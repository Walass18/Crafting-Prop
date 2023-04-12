Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local hit, coords, entity = exports.coreLua:GetCameraTarget(5.0, 16)
		if entity ~= 0 and not IsAimCamActive() and DecorExistOn(entity, 'crate') then
			exports.coreLua:DrawText3d(coords.x, coords.y, coords.z, 0.35, 0, 'Press ~g~E~s~ to interact with crate', 255, 255, 255, true)
			if IsControlJustPressed(0, 51) then
				for k,v in pairs(objects) do
					if v.handle == entity then
						crateType = v.type
						objectId = k
						if crateType == 'storage_locked' then
							accessCode = v.accessCode
						end
					end
				end
				if crateType == 'storage_locked' then
					local code = exports.coreLua:KeyboardInput('Enter Access Code', '', 15)
					if code == accessCode then
						targetEntity = entity
						crateStorage = nil
						WarMenu.OpenMenu('crateMenu')
					else
						exports.coreLua:ShowNotification('Wrong access code, try again.')
					end
				else
					targetEntity = entity
					crateStorage = nil
					WarMenu.OpenMenu('crateMenu')
				end
			end
		end
	end
end)

-- CRATE MENU
Citizen.CreateThread(function()
	WarMenu.CreateMenu('crateMenu', 'Crate Menu')
	WarMenu.CreateSubMenu('storeItemsMenu', 'crateMenu', 'Store Items')
	WarMenu.CreateSubMenu('viewItemsMenu', 'crateMenu', 'Items')
	WarMenu.CreateSubMenu('viewWeaponsMenu', 'crateMenu', 'Weapons')
	while true do
		Citizen.Wait(1)
		if WarMenu.Begin('crateMenu') then
			if WarMenu.Button('Store Weapon') then
				local weapon = GetSelectedPedWeapon(PlayerPedId())
				if weapon ~= GetHashKey('WEAPON_UNARMED') then
					local data = {
						item = weapon,
						amount = GetAmmoInPedWeapon(PlayerPedId(), weapon),
						tint = GetPedWeaponTintIndex(PlayerPedId(), weapon),
						type = 'weapon',
					}
					TriggerServerEvent('CraftingSystem:storeItem', objectId, data)
					exports.coreLua:ShowNotification('Stored ~g~'..exports.coreLua:GetWeaponLabel(weapon))
					TriggerServerEvent('AdminSystem:logPlayerAction', 'stored a '..exports.coreLua:GetWeaponLabel(weapon)..' with '..data.amount..' ammo in crate: '..objectId)
				end
			elseif WarMenu.MenuButton('Store Items  >>>', 'storeItemsMenu') then
			elseif WarMenu.MenuButton('Items  >>>', 'viewItemsMenu') then
				TriggerServerEvent('CraftingSystem:getStorageData', objectId)
			elseif WarMenu.MenuButton('Weapons  >>>', 'viewWeaponsMenu') then
				TriggerServerEvent('CraftingSystem:getStorageData', objectId)
			elseif WarMenu.Button('~r~Destroy Crate') then
				local code = math.random(1000, 9999)
				local confirm = exports.coreLua:KeyboardInput('Enter Confirmation Code: '..code, '', 4)
				if tonumber(confirm) ~= nil then
					if tonumber(confirm) == code then
						TriggerServerEvent('AdminSystem:logPlayerAction', 'destroyed their crate at '..GetEntityCoords(targetEntity))
						WarMenu.CloseMenu('interactionMenu')
						exports.CraftingSystem:Destroy(targetEntity)
					end
				end
			end
			WarMenu.End()
		elseif WarMenu.Begin('storeItemsMenu') then
			local inventory = exports.InventorySystem:GetInventoryItems()
			for k,v in pairs(inventory) do
				if v.amount > 0 then
					if WarMenu.Button(v.name, math.floor(v.amount, 0.5)) then
						local amount = exports.coreLua:KeyboardInput('Enter Amount to Store', '', 5)
						if amount ~= nil and tonumber(amount) ~= nil and tonumber(amount) > 0 and tonumber(amount) <= v.amount then
							local data = {
								item = k,
								amount = tonumber(amount),
								type = 'item',
							}
							TriggerServerEvent('CraftingSystem:storeItem', objectId, data)
							exports.InventorySystem:RemoveItem(k, amount)
							exports.coreLua:ShowNotification('Stored '..amount..'x ~g~'..v.name)
							TriggerServerEvent('AdminSystem:logPlayerAction', 'stored '..amount..' '..v.name..' in crate: '..objectId)
						end
					end
				end
			end
			WarMenu.End()
		elseif WarMenu.Begin('viewItemsMenu') then
			if crateStorage ~= nil then
				for i,v in ipairs(crateStorage.items) do
					local label = exports.InventorySystem:GetItemName(v.item)
					if WarMenu.Button(label, math.floor(v.amount, 0.5)) then
						local amount = exports.coreLua:KeyboardInput('Enter Amount to Take', '', 5)
						if amount ~= nil and tonumber(amount) ~= nil then
							if tonumber(amount) <= v.amount and tonumber(amount) > 0 then
								TriggerServerEvent('CraftingSystem:takeItem', objectId, 'item', i, amount)
								exports.InventorySystem:GiveItem(v.item, amount)
								TriggerServerEvent('AdminSystem:logPlayerAction', 'took '..amount..' '..label..' from crate: '..objectId)
							end
						end
					end
				end
			end
			WarMenu.End()
		elseif WarMenu.Begin('viewWeaponsMenu') then
			if crateStorage ~= nil then
				for i,v in ipairs(crateStorage.weapons) do
					local label = exports.coreLua:GetWeaponLabel(v.item)
					if WarMenu.Button(label, math.floor(v.amount, 0.5)) then
						if #exports.InventorySystem:GetLoadout() < 5 then
							GiveWeaponToPed(PlayerPedId(), v.item, 0, true, true)
							SetPedWeaponTintIndex(PlayerPedId(), v.item, v.tint)
							TriggerServerEvent('CraftingSystem:takeItem', objectId, 'weapon', i, v.amount)
							TriggerServerEvent('AdminSystem:logPlayerAction', 'took a '..label..' with '..v.amount..' ammo from crate: '..objectId)
						end
					end
				end
			end
			WarMenu.End()
		end
	end
end)