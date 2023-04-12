local licenseId = ''

RegisterCommand('craft', function(src,args,raw)
	WarMenu.OpenMenu('craftingMenu')
	door = nil
	storage = nil
	structure = nil
	preview = 0
end)

RegisterCommand('crafttest', function(src,args,raw)
	licenseId = '6138cd3ac00fa2be25986cfeed26q32177edff89'
end)

RegisterCommand('craftstructures', function(src,args,raw)
	WarMenu.OpenMenu('craftedStructureMenu')
	licenseId = LocalPlayer.state['licenseId']
end)
RegisterKeyMapping('craftstructures', 'Craft Structures', 'keyboard', 'f4')

-- ADMIN CRAFTING MANAGER
local filterType = 1
local filters = {'Player Name','Object ID'}
Citizen.CreateThread(function()
	WarMenu.CreateMenu('craftingManager', 'Crafting Manager')
	WarMenu.CreateSubMenu('selectedPlayer', 'craftingManager', 'Selected Player')
	WarMenu.CreateSubMenu('selectedCraft', 'selectedPlayer', 'Selected Craft')
	WarMenu.CreateSubMenu('selectedCraft2', 'craftingManager', 'Selected Craft')
	while true do
		if WarMenu.Begin('craftingManager') then
			local _, comboBoxIndex = WarMenu.ComboBox('~g~Filter By', filters, filterType)
			if filterType ~= comboBoxIndex then
				filterType = comboBoxIndex
				filter = nil
			end
			if filterType == 1 then
				if sortedNames ~= nil then
					for k,v in pairs(sortedNames) do
						if filter ~= nil then
							if string.find(k, filter) then
								if WarMenu.MenuButton(k, 'selectedPlayer') then
									selectedPlayerCrafts = {}
									for k2,v2 in pairs(objects) do
										if v2.playerName == k then
											selectedPlayerCrafts[k2] = v2
										end
									end
								end
							end
						else
							if WarMenu.MenuButton(k, 'selectedPlayer') then
								selectedPlayerCrafts = {}
								for k2,v2 in pairs(objects) do
									if v2.playerName == k then
										selectedPlayerCrafts[k2] = v2
									end
								end
							end
						end
					end
				end
			elseif filterType == 2 then
				for k,v in pairs(objects) do
					if filter ~= nil then
						if string.find(k, filter) then
							if WarMenu.MenuButton(k, 'selectedCraft2', v.type) then
								currentCraft = v
							end
						end
					else
						if WarMenu.MenuButton(k, 'selectedCraft2', v.type) then
							currentCraft = v
						end
					end
				end
			end
			if IsControlJustPressed(0, 22) then
				filter = exports.coreLua:KeyboardInput('Enter Name/Number to Filter By', '', 30)
				if filter == '' then
					filter = nil
				end
			end
			WarMenu.End()
		elseif WarMenu.Begin('selectedPlayer') then
			if selectedPlayerCrafts ~= nil then
				for k,v in pairs(selectedPlayerCrafts) do
					if WarMenu.MenuButton(k, 'selectedCraft', v.type) then
						playerCraft = v
					end
				end
			end
			WarMenu.End()
		elseif WarMenu.Begin('selectedCraft') then
			if playerCraft ~= nil then
				if WarMenu.Button('~g~Teleport To') then
					SetEntityCoords(PlayerPedId(), playerCraft.pos.x, playerCraft.pos.y, playerCraft.pos.z)
				end
				WarMenu.Button('Type: '..playerCraft.type)
				WarMenu.Button('Health: '..playerCraft.health)				
			end
			WarMenu.End()
		elseif WarMenu.Begin('selectedCraft2') then
			if currentCraft ~= nil then
				if WarMenu.Button('~g~Teleport To') then
					SetEntityCoords(PlayerPedId(), currentCraft.pos.x, currentCraft.pos.y, currentCraft.pos.z)
				end
				WarMenu.Button('Type: '..currentCraft.type)
				WarMenu.Button('Health: '..currentCraft.health)
				WarMenu.Button('Owner: '..currentCraft.playerName)
				
				if currentCraft.label ~= nil then
					WarMenu.Button('Label: '..currentCraft.label)
				end
			end
			WarMenu.End()
		end
		Citizen.Wait(1)
	end
end)

-- CRAFTED STRUCTURES
local moveSensitivity = 0.010000
Citizen.CreateThread(function()
	WarMenu.CreateMenu('craftedStructureMenu', 'Crafting Structures')
	WarMenu.CreateSubMenu('editStructureMenu', 'craftedStructureMenu', 'Selected Structure')
	while true do
		if WarMenu.Begin('craftedStructureMenu') then
			for k,v in pairs(objects) do
				if v.licenseId == licenseId and #(GetEntityCoords(PlayerPedId()) - vector3(v.pos.x, v.pos.y, v.pos.z)) <= 25.0 then
					if WarMenu.MenuButton(k, 'editStructureMenu') then
						key = k
						objects[key].rot = {x = objects[key].rot.x, y = objects[key].rot.y, z = objects[key].rot.z}
					end
					if WarMenu.IsItemHovered() then
						DrawMarker(0, v.pos.x, v.pos.y, v.pos.z+1, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 0, 255, 0, 255, false, true, false, false)
					end
				end
			end
			WarMenu.End()
		elseif WarMenu.Begin('editStructureMenu') then
			local v = objects[key]
			if WarMenu.Button('Move Sensitivity: ~r~', moveSensitivity) then
				local input = exports.coreLua:KeyboardInput('Enter Amount', '', 50)
				if tonumber(input) ~= nil then
					moveSensitivity = tonumber(input)
				else
					input = exports.coreLua:KeyboardInput('Enter Amount', '', 50)
					exports.coreLua:ShowNotification('~r~Try again.')
				end
			end
			if WarMenu.IsItemHovered() then
				if IsControlJustPressed(0, 10) then -- Page Up
					if moveSensitivity < 1.0 then
						moveSensitivity = moveSensitivity + 0.100000
					end
				elseif IsControlJustPressed(0, 11) then -- Page Down
					if moveSensitivity >= 0.10 then
						moveSensitivity = moveSensitivity - 0.100000
					end
				elseif IsControlJustPressed(0, 174) then -- Arrow left
					if moveSensitivity >= 0.01 then
						moveSensitivity = moveSensitivity - 0.010000
					end
				elseif IsControlJustPressed(0, 175) then -- Arrow Right
					if moveSensitivity < 1.0 then
						moveSensitivity = moveSensitivity + 0.010000
					end
				end
			end
			WarMenu.Button('~r~X: ~s~'..v.pos.x)
			if WarMenu.IsItemHovered() then
				if IsControlPressed(0, 174) then -- Arrow left
					v.pos.x = v.pos.x - moveSensitivity
					SetEntityCoords(v.handle, v.pos.x, v.pos.y, v.pos.z, true, false, false, true)
				elseif IsControlPressed(0, 175) then -- Arrow Right
					v.pos.x = v.pos.x + moveSensitivity
					SetEntityCoords(v.handle, v.pos.x, v.pos.y, v.pos.z, true, false, false, true)
				elseif IsControlJustReleased(0, 174) or IsControlJustReleased(0, 175) then
					TriggerServerEvent("CraftingSystem:update", key, v)
				end
			end
			WarMenu.Button('~g~Y: ~s~'..v.pos.y)
			if WarMenu.IsItemHovered() then
				if IsControlPressed(0, 174) then -- Arrow left
					v.pos.y = v.pos.y - moveSensitivity
					SetEntityCoords(v.handle, v.pos.x, v.pos.y, v.pos.z, true, false, false, true)
				elseif IsControlPressed(0, 175) then -- Arrow Right
					v.pos.y = v.pos.y + moveSensitivity
					SetEntityCoords(v.handle, v.pos.x, v.pos.y, v.pos.z, true, false, false, true)
				elseif IsControlJustReleased(0, 174) or IsControlJustReleased(0, 175) then
					TriggerServerEvent("CraftingSystem:update", key, v)
				end
			end
			-- WarMenu.Button('~b~Z: ~s~'..v.pos.z)
			-- if WarMenu.IsItemHovered() then
				-- if IsControlPressed(0, 174) then -- Arrow left
					-- v.pos.z = v.pos.z - moveSensitivity
					-- SetEntityCoords(v.handle, v.pos.x, v.pos.y, v.pos.z, true, false, false, true)
				-- elseif IsControlPressed(0, 175) then -- Arrow Right
					-- v.pos.z = v.pos.z + moveSensitivity
					-- SetEntityCoords(v.handle, v.pos.x, v.pos.y, v.pos.z, true, false, false, true)
				-- elseif IsControlJustReleased(0, 174) or IsControlJustReleased(0, 175) then
					-- TriggerServerEvent("CraftingSystem:update", key, v)
				-- end
			-- end
			WarMenu.Button('~r~Offset X: ~s~'..v.pos.x)
			if WarMenu.IsItemHovered() then
				if IsControlPressed(0, 174) then -- Arrow left
					local speed = -moveSensitivity
					local offset = GetOffsetFromEntityInWorldCoords(v.handle, speed, 0.0, 0.0)
					v.pos.x = offset.x
					v.pos.y = offset.y
					v.pos.z = offset.z
					SetEntityCoords(v.handle, offset.x, offset.y, offset.z, true, false, false, true)
				elseif IsControlPressed(0, 175) then -- Arrow Right
					local speed = moveSensitivity
					local offset = GetOffsetFromEntityInWorldCoords(v.handle, speed, 0.0, 0.0)
					v.pos.x = offset.x
					v.pos.y = offset.y
					v.pos.z = offset.z
					SetEntityCoords(v.handle, offset.x, offset.y, offset.z, true, false, false, true)
				elseif IsControlJustReleased(0, 174) or IsControlJustReleased(0, 175) then
					TriggerServerEvent("CraftingSystem:update", key, v)
				end
			end
			WarMenu.Button('~g~Offset Y: ~s~'..v.pos.y)
			if WarMenu.IsItemHovered() then
				if IsControlPressed(0, 174) then -- Arrow left
					local speed = -moveSensitivity
					local offset = GetOffsetFromEntityInWorldCoords(v.handle, 0.0, speed, 0.0)
					v.pos.x = offset.x
					v.pos.y = offset.y
					v.pos.z = offset.z
					SetEntityCoords(v.handle, offset.x, offset.y, offset.z, true, false, false, true)
				elseif IsControlPressed(0, 175) then -- Arrow Right
					local speed = moveSensitivity
					local offset = GetOffsetFromEntityInWorldCoords(v.handle, 0.0, speed, 0.0)
					v.pos.x = offset.x
					v.pos.y = offset.y
					v.pos.z = offset.z
					SetEntityCoords(v.handle, offset.x, offset.y, offset.z, true, false, false, true)
				elseif IsControlJustReleased(0, 174) or IsControlJustReleased(0, 175) then
					TriggerServerEvent("CraftingSystem:update", key, v)
				end
			end
			if WarMenu.Button('Level With Ground', '~b~'..tostring(v.onGround)) then
				v.onGround = not v.onGround
				TriggerServerEvent("CraftingSystem:update", key, v)
			end
			WarMenu.Button('~b~Heading: ~s~'..v.rot.z)
			if WarMenu.IsItemHovered() then
				if IsControlPressed(0, 174) then -- Arrow left
					local rot = {z = v.rot.z}
					v.rot.z = v.rot.z - moveSensitivity
					SetEntityHeading(v.handle, v.rot.z)
				elseif IsControlPressed(0, 175) then -- Arrow Right
					v.rot.z = v.rot.z + moveSensitivity
					SetEntityHeading(v.handle, v.rot.z)
				elseif IsControlJustReleased(0, 174) or IsControlJustReleased(0, 175) then
					TriggerServerEvent("CraftingSystem:update", key, v)
				end
			end
			if WarMenu.Button('~r~Delete Structure') then
				local code = math.random(1000, 9999)
				local confirm = exports.coreLua:KeyboardInput('Enter Confirmation Code: '..code, '', 4)
				if confirm ~= nil and tonumber(confirm) ~= nil then
					if tonumber(confirm) == code then
						WarMenu.OpenMenu('craftedStructureMenu')
						exports.CraftingSystem:Destroy(v.handle)
					end
				end
			end
			WarMenu.End()
		end
		Citizen.Wait(1)
	end
end)

-- CRAFTING MENU
Citizen.CreateThread(function()
	WarMenu.CreateMenu('craftingMenu', 'Crafting Menu')
	WarMenu.CreateSubMenu('craftItemsMenu', 'craftingMenu', 'Craft Items')
	WarMenu.CreateSubMenu('craftDoorsMenu', 'craftingMenu', 'Craft Doors')
	WarMenu.CreateSubMenu('craftStorageMenu', 'craftingMenu', 'Craft Storage')
	WarMenu.CreateSubMenu('craftStructuresMenu', 'craftingMenu', 'Craft Structures')
	WarMenu.CreateSubMenu('selectedStorage', 'craftStorageMenu', 'Selected Storage')
	WarMenu.CreateSubMenu('selectedStructure', 'craftStructuresMenu', 'Selected Structure')
	WarMenu.CreateSubMenu('selectedDoor', 'craftDoorsMenu', 'Selected Door')
	while true do
		if WarMenu.Begin('craftingMenu') then
			WarMenu.MenuButton('Items  >>>', 'craftItemsMenu')
			WarMenu.MenuButton('Storage  >>>', 'craftStorageMenu')
			WarMenu.MenuButton('Structures  >>>', 'craftStructuresMenu')
			WarMenu.MenuButton('Doors  >>>', 'craftDoorsMenu')
			WarMenu.End()
		elseif WarMenu.Begin('craftItemsMenu') then
			if WarMenu.Button('Bandage', '~r~1x') then
				local amount = exports.coreLua:KeyboardInput('Enter Amount to Craft', '', 10)
				if tonumber(amount) ~= nil then
					if exports.InventorySystem:GetItemAmount('scrap_cloth') >= tonumber(amount) then
						for i = 1, tonumber(amount) do
							if exports.InventorySystem:GetItemAmount('scrap_cloth') >= 2 then
								if GetEntitySpeed(PlayerPedId()) > 1 then
									exports.coreLua:ShowNotification('Crafting was cancelled.')
									ExecuteCommand('e c')
									break
								end
								ExecuteCommand('e mechanic')
								exports.coreLua:StartLoadingBar(3)
								Wait(4000)
								exports.InventorySystem:RemoveItem('scrap_cloth', 2)
								exports.InventorySystem:GiveItem('bandages', 1)
								ExecuteCommand('e c')
							end
						end
					else
						exports.coreLua:ShowNotification('You do not have ~r~2x Scrap Cloth~s~ or more to craft this item.')
					end
				end
			elseif WarMenu.Button('Gasoline') then
				if HasPedGotWeapon(PlayerPedId(), GetHashKey('WEAPON_PETROLCAN')) then
					if exports.InventorySystem:GetItemAmount('animal_fat') <= 0 then
						exports.coreLua:ShowNotification('You need animal fat to craft gasoline.')
					else
						if exports.InventorySystem:GetItemAmount('animal_fat') >= 4 then
							if GetAmmoInPedWeapon(PlayerPedId(), GetHashKey('WEAPON_PETROLCAN')) < 4500 then
								AddAmmoToPed(PlayerPedId(), GetHashKey('WEAPON_PETROLCAN'), 4500)
								exports.InventorySystem:RemoveItem('animal_fat', 4)
								exports.coreLua:ShowNotification('Added 100% more gasoline to jerry can')
							end
						elseif exports.InventorySystem:GetItemAmount('animal_fat') == 3 then
							if GetAmmoInPedWeapon(PlayerPedId(), GetHashKey('WEAPON_PETROLCAN')) < 4500 then
								AddAmmoToPed(PlayerPedId(), GetHashKey('WEAPON_PETROLCAN'), 3000)
								exports.InventorySystem:RemoveItem('animal_fat', 3)
								exports.coreLua:ShowNotification('Added 75% more gasoline to jerry can')
							end
						elseif exports.InventorySystem:GetItemAmount('animal_fat') == 2 then
							if GetAmmoInPedWeapon(PlayerPedId(), GetHashKey('WEAPON_PETROLCAN')) < 4500 then
								AddAmmoToPed(PlayerPedId(), GetHashKey('WEAPON_PETROLCAN'), 2000)
								exports.InventorySystem:RemoveItem('animal_fat', 2)
								exports.coreLua:ShowNotification('Added 50% more gasoline to jerry can')
							end
						elseif exports.InventorySystem:GetItemAmount('animal_fat') == 1 then
							if GetAmmoInPedWeapon(PlayerPedId(), GetHashKey('WEAPON_PETROLCAN')) < 4500 then
								AddAmmoToPed(PlayerPedId(), GetHashKey('WEAPON_PETROLCAN'), 1000)
								exports.InventorySystem:RemoveItem('animal_fat', 1)
								exports.coreLua:ShowNotification('Added 25% more gasoline to jerry can')
							end
						else
							exports.coreLua:ShowNotification('You do not have enough animal fat to craft gasoline.')
						end
					end
				else
					exports.coreLua:ShowNotification('You need a jerry can to craft gasoline.')
				end
			elseif WarMenu.Button('Molotov', '~r~1x') then
				local amount = exports.coreLua:KeyboardInput('Enter Amount to Craft', '', 10)
				if tonumber(amount) ~= nil then
					local beer = exports.InventorySystem:GetItemAmount('beer')
					local lighter = exports.InventorySystem:GetItemAmount('lighter')
					local scrapCloth = exports.InventorySystem:GetItemAmount('scrap_cloth')
					if beer >= tonumber(amount) and lighter >= tonumber(amount) and scrapCloth >= tonumber(amount) then
						for i = 1, tonumber(amount) do
							beer = exports.InventorySystem:GetItemAmount('beer')
							lighter = exports.InventorySystem:GetItemAmount('lighter')
							scrapCloth = exports.InventorySystem:GetItemAmount('scrap_cloth')
							if beer >= 1 and lighter >= 1 and scrapCloth >= 1 then
								if GetEntitySpeed(PlayerPedId()) > 1 then
									exports.coreLua:ShowNotification('Crafting was cancelled.')
									ExecuteCommand('e c')
									break
								end
								ExecuteCommand('e mechanic')
								exports.coreLua:StartLoadingBar(5)
								Wait(6000)
								exports.InventorySystem:RemoveItem('beer', 1)
								exports.InventorySystem:RemoveItem('lighter', 1)
								exports.InventorySystem:RemoveItem('scrap_cloth', 1)
								GiveWeaponToPed(PlayerPedId(), GetHashKey('WEAPON_MOLOTOV'), 1, true, true)
								ExecuteCommand('e c')
							end
						end
					else
						exports.coreLua:ShowNotification('You do not have the resources to craft this item.')
					end
				end
			end
			WarMenu.End()
		elseif WarMenu.Begin('craftStorageMenu') then
			for k,v in pairs(crates) do
				if WarMenu.MenuButton(v.name, 'selectedStorage') then
					storage = v
				end
			end
			WarMenu.End()
		elseif WarMenu.Begin('craftStructuresMenu') then
			for i,v in ipairs(structures) do
				if WarMenu.MenuButton(v.name, 'selectedStructure') then
					structure = v
				end
			end
			WarMenu.End()
		elseif WarMenu.Begin('craftDoorsMenu') then
			for i,v in ipairs(doors) do
				if WarMenu.MenuButton(v.name, 'selectedDoor') then
					door = v
				end
			end
			WarMenu.End()
		elseif WarMenu.Begin('selectedDoor') then
			if WarMenu.Button('~g~Craft') then
				CraftDoor()
				WarMenu.OpenMenu('craftDoorsMenu')
				door = nil
			end
			if door ~= nil then
				for i, v in ipairs(door.requirements) do
					local amount = exports.InventorySystem:GetItemAmount(v.item)
					if amount >= v.amount then
						if WarMenu.Button('REQUIREMENT:', '~g~'..v.amount..'x '..v.item) then
						end
					else
						if WarMenu.Button('REQUIREMENT:', '~r~'..v.amount..'x '..v.item) then
						end
					end
				end
			end
			WarMenu.End()
		elseif WarMenu.Begin('selectedStorage') then
			if WarMenu.Button('~g~Craft') then
				CraftStorage()
				WarMenu.OpenMenu('craftStorageMenu')
				storage = nil
			end
			if storage ~= nil then
				for i, v in ipairs(storage.requirements) do
					local amount = exports.InventorySystem:GetItemAmount(v.item)
					if amount >= v.amount then
						if WarMenu.Button('REQUIREMENT:', '~g~'..v.amount..'x '..v.item) then
						end
					else
						if WarMenu.Button('REQUIREMENT:', '~r~'..v.amount..'x '..v.item) then
						end
					end
				end
			end
			WarMenu.End()
		elseif WarMenu.Begin('selectedStructure') then
			if WarMenu.Button('~g~Craft') then
				CraftStructure()
				WarMenu.OpenMenu('craftStructuresMenu')
				structure = nil
			end
			if structure ~= nil then
				for i, v in ipairs(structure.requirements) do
					local amount = exports.InventorySystem:GetItemAmount(v.item)
					if amount >= v.amount then
						if WarMenu.Button('REQUIREMENT:', '~g~'..v.amount..'x '..v.item) then
						end
					else
						if WarMenu.Button('REQUIREMENT:', '~r~'..v.amount..'x '..v.item) then
						end
					end
				end
			end
			WarMenu.End()
		end
		Citizen.Wait(1)
	end
end)

local preview = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if WarMenu.IsMenuOpened('selectedDoor') or WarMenu.IsMenuOpened('selectedStorage') or WarMenu.IsMenuOpened('selectedStructure') then
			if door ~= nil then
				local hit, coords, entity = exports.coreLua:GetCameraTarget(15.0, 1)
				if not DoesEntityExist(preview) then
					local model = GetHashKey(door.hash)
					RequestModel(model)
					while not HasModelLoaded(model) do
						Wait(1)
					end
					preview = CreateObjectNoOffset(model, coords.x, coords.y, coords.z + door.offset, false, false, true)
					SetEntityAsMissionEntity(preview)
					SetEntityCollision(preview, false, false)
					SetEntityAlpha(preview, 200)
				end
				if preview ~= 0 then
					SetEntityCoords(preview, coords.x, coords.y, coords.z + door.offset)
					local rot = GetGameplayCamRot(2)
					if GetRenderingCam() ~= -1 then
						rot = GetCamRot(GetRenderingCam())
					end
					SetEntityHeading(preview, rot.z)
				end
			elseif storage ~= nil then
				local hit, coords, entity = exports.coreLua:GetCameraTarget(15.0, 1)
				if not DoesEntityExist(preview) then
					local model = GetHashKey(storage.hash)
					RequestModel(model)
					while not HasModelLoaded(model) do
						Wait(1)
					end
					preview = CreateObjectNoOffset(model, coords.x, coords.y, coords.z, false, false, true)
					SetEntityAsMissionEntity(preview)
					SetEntityCollision(preview, false, false)
					SetEntityAlpha(preview, 200)
				end
				if preview ~= 0 then
					SetEntityCoords(preview, coords.x, coords.y, coords.z + storage.offset)
					local rot = GetGameplayCamRot(2)
					if GetRenderingCam() ~= -1 then
						rot = GetCamRot(GetRenderingCam())
					end
					SetEntityHeading(preview, rot.z)
					if storage.onGround then
						PlaceObjectOnGroundProperly(preview)
					end
				end
			elseif structure ~= nil then
				local hit, coords, entity = exports.coreLua:GetCameraTarget(15.0, 1)
				if not DoesEntityExist(preview) then
					local model = GetHashKey(structure.hash)
					RequestModel(model)
					while not HasModelLoaded(model) do
						Wait(1)
					end
					preview = CreateObjectNoOffset(model, coords.x, coords.y, coords.z, false, false, true)
					SetEntityAsMissionEntity(preview)
					SetEntityCollision(preview, false, false)
					SetEntityAlpha(preview, 200)
				end
				if preview ~= 0 then
					SetEntityCoords(preview, coords.x, coords.y, coords.z + structure.offset)
					local rot = GetGameplayCamRot(2)
					if GetRenderingCam() ~= -1 then
						rot = GetCamRot(GetRenderingCam())
					end
					SetEntityHeading(preview, rot.z)
					if structure.onGround then
						PlaceObjectOnGroundProperly(preview)
					end
				end
			end
		else
			if DoesEntityExist(preview) then
				DeleteEntity(preview)
			end
			door = nil
			storage = nil
			structure = nil
		end
	end
end)

function HasRequirements(type)
	if type == 'door' then
		for i, v in ipairs(door.requirements) do
			local amount = exports.InventorySystem:GetItemAmount(v.item)
			if amount < v.amount then
				return false
			end
		end
	elseif type == 'storage' then
		for i, v in ipairs(storage.requirements) do
			local amount = exports.InventorySystem:GetItemAmount(v.item)
			if amount < v.amount then
				return false
			end
		end
	elseif type == 'structure' then
		for i, v in ipairs(structure.requirements) do
			local amount = exports.InventorySystem:GetItemAmount(v.item)
			if amount < v.amount then
				return false
			end
		end
	end
	return true
end

function CraftStorage()
	if HasRequirements('storage') then
		if preview ~= 0 and DoesEntityExist(preview) then
			local label = exports.coreLua:KeyboardInput('Enter Label for This Crate', '', 50)
			for i, v in ipairs(storage.requirements) do
				exports.InventorySystem:RemoveItem(v.item, v.amount)
			end
			
			local accessCode = ''
			if storage.crateType == 'storage_locked' then
				accessCode = exports.coreLua:KeyboardInput('Enter Access Code', '', 15)
			end
		
			local data = {
				handle = 0,
				health = storage.health,
				capacity = storage.capacity,
				model = GetEntityModel(preview),
				pos = GetEntityCoords(preview),
				rot = GetEntityRotation(preview, 2),
				label = label,
				accessCode = accessCode,
				renderDist = storage.renderDist,
				onGround = storage.onGround,
				type = storage.crateType,
			}
			TriggerServerEvent('CraftingSystem:save', data)
			exports.coreLua:ShowNotification('Successfully crafted '..storage.name)
		end
	else
		exports.coreLua:ShowNotification('You do not have the required materials to craft this.')
	end
end

function CraftDoor()
	if HasRequirements('door') then
		if preview ~= 0 and DoesEntityExist(preview) then
			for i, v in ipairs(door.requirements) do
				exports.InventorySystem:RemoveItem(v.item, v.amount)
			end
			
			local accessCode = ''
			local label = ''
			accessCode = exports.coreLua:KeyboardInput('Enter Access Code', '', 15)
		
			local data = {
				handle = 0,
				health = door.health,
				model = GetEntityModel(preview),
				pos = GetEntityCoords(preview),
				rot = GetEntityRotation(preview, 2),
				accessCode = accessCode,
				renderDist = door.renderDist,
				onGround = door.onGround,
				locked = false,
				opened = false,
				type = 'door',
			}
			TriggerServerEvent('CraftingSystem:save', data)
			exports.coreLua:ShowNotification('Successfully crafted '..door.name)
		end
	else
		exports.coreLua:ShowNotification('You do not have the required materials to craft this.')
	end
end

function CraftStructure()
	if HasRequirements('structure') then
		if preview ~= 0 and DoesEntityExist(preview) then
			for i, v in ipairs(structure.requirements) do
				exports.InventorySystem:RemoveItem(v.item, v.amount)
			end
			
			local label = ''
			if structure.hash == 'vw_prop_vw_board_01a' then
				label = exports.coreLua:KeyboardInput('Enter Label Name for Bulletin Board', '', 20)
			end
		
			local data = {
				handle = 0,
				health = structure.health,
				model = GetEntityModel(preview),
				pos = GetEntityCoords(preview),
				rot = GetEntityRotation(preview, 2),
				label = label,
				renderDist = structure.renderDist,
				onGround = structure.onGround,
				type = 'structure',
			}
			TriggerServerEvent('CraftingSystem:save', data)
			exports.coreLua:ShowNotification('Successfully crafted '..structure.name)
		end
	else
		exports.coreLua:ShowNotification('You do not have the required materials to craft this.')
	end
end