local materialObjects = {
	[tostring(GetHashKey('prop_barrel_03a'))] = {materials = {'scrap_metal'}, damageCount = 12, amount = 8},
	[tostring(GetHashKey('prop_barrel_03d'))] = {materials = {'scrap_metal'}, damageCount = 12, amount = 8},
	[tostring(GetHashKey('prop_barrel_pile_01'))] = {materials = {'scrap_metal'}, damageCount = 24, amount = 15},
	[tostring(GetHashKey('prop_box_wood07a'))] = {materials = {'wood_plank'}, damageCount = 6, amount = 8},
	[tostring(GetHashKey('prop_cablespool_01a'))] = {materials = {'wood_plank'}, damageCount = 10, amount = 5},
	[tostring(GetHashKey('prop_cablespool_01b'))] = {materials = {'wood_plank'}, damageCount = 20, amount = 10},
	[tostring(GetHashKey('prop_chair_05'))] = {materials = {'scrap_cloth','wood_plank'}, damageCount = 10, amount = 5},
	[tostring(GetHashKey('prop_crate_10a'))] = {materials = {'plastic'}, damageCount = 10, amount = 6},
	[tostring(GetHashKey('prop_crate_11c'))] = {materials = {'plastic'}, damageCount = 5, amount = 3},
	[tostring(GetHashKey('prop_cratepile_01a'))] = {materials = {'plastic'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_elecbox_01a'))] = {materials = {'scrap_metal'}, damageCount = 15, amount = 8},
	[tostring(GetHashKey('prop_elecbox_04a'))] = {materials = {'scrap_metal'}, damageCount = 12, amount = 6},
	[tostring(GetHashKey('prop_fnccorgm_02a'))] = {materials = {'nails','scrap_metal'}, damageCount = 15, amount = 5},
	[tostring(GetHashKey('prop_fnccorgm_02b'))] = {materials = {'nails','scrap_metal'}, damageCount = 15, amount = 5},
	[tostring(GetHashKey('prop_fnccorgm_02c'))] = {materials = {'nails','scrap_metal'}, damageCount = 15, amount = 5},
	[tostring(GetHashKey('prop_fnccorgm_02d'))] = {materials = {'nails','scrap_metal'}, damageCount = 15, amount = 5},
	[tostring(GetHashKey('prop_fnccorgm_03a'))] = {materials = {'nails','scrap_metal'}, damageCount = 15, amount = 5},
	[tostring(GetHashKey('prop_fnccorgm_03b'))] = {materials = {'nails','scrap_metal'}, damageCount = 15, amount = 6},
	[tostring(GetHashKey('prop_fnccorgm_04a'))] = {materials = {'nails','scrap_metal'}, damageCount = 18, amount = 6},
	[tostring(GetHashKey('prop_fnclink_08post'))] = {materials = {'wood_plank'}, damageCount = 5, amount = 3},
	[tostring(GetHashKey('prop_fnclog_02b'))] = {materials = {'wood_logs'}, damageCount = 2, amount = 1},
	[tostring(GetHashKey('prop_fnclog_03a'))] = {materials = {'wood_logs'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_fncwood_07a'))] = {materials = {'wood_plank'}, damageCount = 6, amount = 3},
	[tostring(GetHashKey('prop_fncwood_09d'))] = {materials = {'wood_plank'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_fncwood_10b'))] = {materials = {'wood_plank'}, damageCount = 10, amount = 4},
	[tostring(GetHashKey('prop_fncwood_14b'))] = {materials = {'wood_logs'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_generator_03a'))] = {materials = {'battery','nails','scrap_metal'}, damageCount = 25, amount = 12},
	[tostring(GetHashKey('prop_ind_light_04'))] = {materials = {'light_bulb','scrap_metal'}, damageCount = 8, amount = 2},
	[tostring(GetHashKey('prop_joshua_tree_01a'))] = {materials = {'wood_logs'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_joshua_tree_01b'))] = {materials = {'wood_logs'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_joshua_tree_01c'))] = {materials = {'wood_logs'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_joshua_tree_01d'))] = {materials = {'wood_logs'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_joshua_tree_01e'))] = {materials = {'wood_logs'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_joshua_tree_02a'))] = {materials = {'wood_logs'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_joshua_tree_02b'))] = {materials = {'wood_logs'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_joshua_tree_02c'))] = {materials = {'wood_logs'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_joshua_tree_02d'))] = {materials = {'wood_logs'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_joshua_tree_02e'))] = {materials = {'wood_logs'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_ld_crate_01'))] = {materials = {'nails','wood_plank'}, damageCount = 15, amount = 12},
	[tostring(GetHashKey('prop_ld_crate_lid_01'))] = {materials = {'nails','wood_plank'}, damageCount = 8, amount = 6},
	[tostring(GetHashKey('prop_oldlight_01a'))] = {materials = {'light_bulb','scrap_metal'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_oldlight_01c'))] = {materials = {'light_bulb','scrap_metal'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_oldlight_01b'))] = {materials = {'light_bulb','scrap_metal'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_paints_bench01'))] = {materials = {'plastic','wood_plank'}, damageCount = 15, amount = 10},
	[tostring(GetHashKey('prop_pallet_01a'))] = {materials = {'wood_plank'}, damageCount = 3, amount = 1},
	[tostring(GetHashKey('prop_pallet_02a'))] = {materials = {'wood_plank'}, damageCount = 3, amount = 1},
	[tostring(GetHashKey('prop_pallet_03a'))] = {materials = {'wood_plank'}, damageCount = 3, amount = 1},
	[tostring(GetHashKey('prop_pallet_03b'))] = {materials = {'wood_plank'}, damageCount = 3, amount = 1},
	[tostring(GetHashKey('prop_pallet_pile_01'))] = {materials = {'wood_plank'}, damageCount = 6, amount = 3},
	[tostring(GetHashKey('prop_pallet_pile_02'))] = {materials = {'wood_plank'}, damageCount = 6, amount = 3},
	[tostring(GetHashKey('prop_pallet_pile_03'))] = {materials = {'wood_plank'}, damageCount = 6, amount = 3},
	[tostring(GetHashKey('prop_pallet_pile_04'))] = {materials = {'wood_plank'}, damageCount = 4, amount = 3},
	[tostring(GetHashKey('prop_pallettruck_02'))] = {materials = {'nails','scrap_metal','wood_plank'}, damageCount = 25, amount = 12},
	[tostring(GetHashKey('prop_patio_lounger1'))] = {materials = {'scrap_cloth','wood_plank'}, damageCount = 12, amount = 6},
	[tostring(GetHashKey('prop_patio_lounger_3'))] = {materials = {'plastic'}, damageCount = 10, amount = 6},
	[tostring(GetHashKey('prop_picnictable_01'))] = {materials = {'wood_plank'}, damageCount = 8, amount = 3},
	[tostring(GetHashKey('prop_pighouse1'))] = {materials = {'nails','scrap_metal'}, damageCount = 10, amount = 5},
	[tostring(GetHashKey('prop_portaloo_01a'))] = {materials = {'nails','plastic'}, damageCount = 25, amount = 12},
	[tostring(GetHashKey('prop_rub_carwreck_3'))] = {materials = {'nails', 'scrap_metal'}, damageCount = 100, amount = 50},
	[tostring(GetHashKey('prop_rub_couch01'))] = {materials = {'scrap_cloth', 'wood_plank'}, damageCount = 10, amount = 5},
	[tostring(GetHashKey('prop_rub_couch02'))] = {materials = {'scrap_cloth', 'wood_plank'}, damageCount = 6, amount = 3},
	[tostring(GetHashKey('prop_rub_couch03'))] = {materials = {'scrap_cloth', 'wood_plank'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_rub_generator'))] = {materials = {'battery','scrap_metal'}, damageCount = 10, amount = 4},
	[tostring(GetHashKey('prop_rub_planks_01'))] = {materials = {'wood_plank'}, damageCount = 3, amount = 1},
	[tostring(GetHashKey('prop_rub_planks_02'))] = {materials = {'wood_plank'}, damageCount = 5, amount = 2},
	[tostring(GetHashKey('prop_rub_planks_03'))] = {materials = {'wood_plank'}, damageCount = 7, amount = 3},
	[tostring(GetHashKey('prop_rub_planks_04'))] = {materials = {'wood_plank'}, damageCount = 2, amount = 1},
	[tostring(GetHashKey('prop_rub_scrap_02'))] = {materials = {'scrap_metal'}, damageCount = 5, amount = 4},
	[tostring(GetHashKey('prop_rub_scrap_03'))] = {materials = {'scrap_metal'}, damageCount = 6, amount = 5},
	[tostring(GetHashKey('prop_rub_scrap_05'))] = {materials = {'scrap_metal'}, damageCount = 8, amount = 6},
	[tostring(GetHashKey('prop_rub_scrap_06'))] = {materials = {'scrap_metal'}, damageCount = 5, amount = 4},
	[tostring(GetHashKey('prop_rub_scrap_07'))] = {materials = {'scrap_metal'}, damageCount = 5, amount = 4},
	[tostring(GetHashKey('prop_sign_road_02a'))] = {materials = {'scrap_metal'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_sign_road_03e'))] = {materials = {'scrap_metal'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_sign_road_03g'))] = {materials = {'scrap_metal'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_sign_road_05a'))] = {materials = {'scrap_metal'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_sign_road_05e'))] = {materials = {'scrap_metal'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_sign_road_05f'))] = {materials = {'scrap_metal'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_sign_road_05v'))] = {materials = {'scrap_metal'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_sign_road_05y'))] = {materials = {'scrap_metal'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_sign_road_05za'))] = {materials = {'scrap_metal'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_sign_road_06d'))] = {materials = {'scrap_metal','wood_plank'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_sign_road_06f'))] = {materials = {'scrap_metal','wood_plank'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_sign_road_07a'))] = {materials = {'scrap_metal'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_sign_road_09f'))] = {materials = {'scrap_metal','wood_plank'}, damageCount = 4, amount = 5},
	[tostring(GetHashKey('prop_skid_chair_01'))] = {materials = {'scrap_cloth','scrap_metal'}, damageCount = 4, amount = 3},
	[tostring(GetHashKey('prop_skid_chair_02'))] = {materials = {'scrap_cloth','scrap_metal'}, damageCount = 4, amount = 3},
	[tostring(GetHashKey('prop_skip_01a'))] = {materials = {'nails','scrap_metal'}, damageCount = 25, amount = 15},
	[tostring(GetHashKey('prop_streetlight_11c'))] = {materials = {'light_bulb','scrap_metal'}, damageCount = 8, amount = 1},
	[tostring(GetHashKey('prop_t_sofa'))] = {materials = {'scrap_cloth'}, damageCount = 25, amount = 15},
	[tostring(GetHashKey('prop_t_sofa_02'))] = {materials = {'scrap_cloth'}, damageCount = 25, amount = 15},
	[tostring(GetHashKey('prop_table_03b'))] = {materials = {'plastic'}, damageCount = 15, amount = 5},
	[tostring(GetHashKey('prop_table_03_chr'))] = {materials = {'plastic'}, damageCount = 10, amount = 4},
	[tostring(GetHashKey('prop_toolchest_04'))] = {materials = {'scrap_metal','silver'}, damageCount = 15, amount = 5},
	[tostring(GetHashKey('prop_wall_light_01a'))] = {materials = {'light_bulb','scrap_metal'}, damageCount = 4, amount = 2},
	[tostring(GetHashKey('prop_wall_light_02a'))] = {materials = {'light_bulb','scrap_metal'}, damageCount = 4, amount = 2},
	[tostring(GetHashKey('prop_wall_light_03a'))] = {materials = {'light_bulb','scrap_metal'}, damageCount = 4, amount = 2},
	[tostring(GetHashKey('prop_wall_light_05c'))] = {materials = {'light_bulb','scrap_metal'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_wall_light_17a'))] = {materials = {'light_bulb','scrap_metal'}, damageCount = 8, amount = 4},
	[tostring(GetHashKey('prop_wheelbarrow01a'))] = {materials = {'scrap_metal','wood_plank'}, damageCount = 10, amount = 5},
	[tostring(GetHashKey('prop_wooden_barrel'))] = {materials = {'wood_plank'}, damageCount = 10, amount = 5},
	[tostring(GetHashKey('prop_woodpile_01a'))] = {materials = {'wood_plank'}, damageCount = 15, amount = 8},
	[tostring(GetHashKey('prop_woodpile_01c'))] = {materials = {'wood_plank'}, damageCount = 15, amount = 6},
	[tostring(GetHashKey('prop_woodpile_03a'))] = {materials = {'wood_plank'}, damageCount = 30, amount = 15},
	[tostring(GetHashKey('prop_woodpile_04a'))] = {materials = {'wood_plank'}, damageCount = 35, amount = 16},
	[tostring(GetHashKey('prop_woodpile_04b'))] = {materials = {'wood_plank'}, damageCount = 50, amount = 25},
}

DecorRegister("damageCount", 3)

function GetNearestObject()
	if not IsPedDeadOrDying(PlayerPedId(), true) then
		local hit, coords, entity = exports.coreLua:GetCameraTarget(3.0, 16)
		if hit and entity ~= 0 then
			if GetEntityType(entity) == 3 then
				return coords, entity
			end
		end
	end
	return nil
end

-- Chop objects for materials
local swinging = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_GOLFCLUB') then
			if IsControlJustPressed(0, 24) then
				swinging = true
			end
			if IsPedPerformingMeleeAction(PlayerPedId()) then
				DisableControlAction(0, 24, true)
			end
		end
	end
end)

Citizen.CreateThread(function()
	DecorRegister("damageCount", 3)
	while true do
		Citizen.Wait(1)
		if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_GOLFCLUB') then
			local coords, obj = GetNearestObject()
			if obj ~= 0 then
				if not DecorExistOn(obj, "craftable") and not DecorExistOn(obj, "wardrobe") and not DecorExistOn(obj, "weapon") then
					if materialObjects[tostring(GetEntityModel(obj))] ~= nil then
						DisableControlAction(0, 24, true)
						DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.1, 255, 0, 0, 175, false, true, 2, nil, nil, false)
						local damageCount = DecorGetInt(obj, "damageCount")
						if damageCount > 0 then
							DrawText(0.5, 0.54, damageCount..'/'..materialObjects[tostring(GetEntityModel(obj))].damageCount, 6, 0.4, true, 255, 255, 255)
						end
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_GOLFCLUB') then
			local coords, obj = GetNearestObject()
			if obj ~= 0 then
				if materialObjects[tostring(GetEntityModel(obj))] ~= nil then
					local v = materialObjects[tostring(GetEntityModel(obj))]
					if IsDisabledControlPressed(0, 24) then
						FreezeEntityPosition(obj, true)
						local animDict = 'melee@large_wpn@streamed_core_fps'
						if not IsEntityPlayingAnim(PlayerPedId(), animDict, 'ground_attack_on_spot', 3) then
							RequestAnimDict(animDict)
							while not HasAnimDictLoaded(animDict) do
								Wait(1)
							end
							TaskPlayAnim(PlayerPedId(), animDict, 'ground_attack_on_spot', 5.0, 5.0, 1500, 49, 0.0, false, false, false)
							if not DecorExistOn(obj, 'damageCount') then
								DecorSetInt(obj, "damageCount", v.damageCount)
							end
							local damageCount = DecorGetInt(obj, "damageCount")
							DecorSetInt(obj, "damageCount", damageCount - 1)
							TaskTurnPedToFaceCoord(PlayerPedId(), coords, 1000)
							Wait(500)
							ShootSingleBulletBetweenCoords(GetEntityCoords(PlayerPedId()), coords, 100, true, GetHashKey('WEAPON_MG'), PlayerPedId(), true, false, 1.0)
							if GetEntityModel(obj) ~= nil then
								if damageCount <= 1 then						
									local materials = v.materials
									for i, v2 in ipairs(materials) do
										local amount = v.amount
										local randAmount = math.random(amount, amount * 2)
										exports.InventorySystem:GiveItem(v2, randAmount)
										exports.coreLua:ShowNotification('Collected '..randAmount..' '..exports.InventorySystem:GetItemName(v2))
									end
									Wait(500)
									TriggerServerEvent('CraftingSystem:deleteProp', GetEntityCoords(obj), GetEntityModel(obj))
								end
							end
							Wait(1000)
						end
					end
				end
			end
		end
	end
end)

-- Chop destroyed vehicles for materials
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if swinging then
			local near, vehicle = NearestVehicle()
			if vehicle ~= 0 and GetVehicleEngineHealth(vehicle) < -2500 then
				local damageCount = DecorGetInt(vehicle, "damageCount")
				Wait(1000)
				print('Damage: '..DecorGetInt(vehicle, "damageCount"))
				DecorSetInt(vehicle, "damageCount", damageCount + 1)
				swinging = false
				
				if damageCount >= 5 then			
					local randamount = 1
					exports.InventorySystem:GiveItem('scrap_metal', randAmount)
					exports.coreLua:ShowNotification('Collected '..randAmount..' Scrap Metal')
					
					NetworkRequestControlOfEntity(vehicle)
					while not NetworkHasControlOfEntity(vehicle) do
						Wait(1)
					end
					DeleteEntity(vehicle)
				end
			end
		end
	end
end)

-- INTERACT WITH WORKBENCH
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		primaryProfession, secondaryProfession = exports.CharacterSystem:Professions()
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if primaryProfession == 'Carpenter' or primaryProfession == 'Gunsmith' or secondaryProfession == 'Carpenter' or secondaryProfession == 'Gunsmith' then
			local coords, obj = GetNearestObject()
			if obj ~= 0 then
				if GetEntityModel(obj) == GetHashKey('prop_tool_bench02') then
					exports.coreLua:DrawText3d(coords.x, coords.y, coords.z, 0.35, 0, 'Press ~g~E~s~ to interact with workbench', 255, 255, 255, true)
					if IsControlJustPressed(0, 51) then
						currentObj = obj
						WarMenu.OpenMenu('workbenchMenu')
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	WarMenu.CreateMenu('workbenchMenu', 'Workbench')
	while true do
		if WarMenu.Begin('workbenchMenu') then
			if primaryProfession == 'Carpenter' or secondaryProfession == 'Carpenter' then
				if WarMenu.Button('Craft Nails') then
					local amount = exports.coreLua:KeyboardInput('Enter amount to craft', '', 3)
					if tonumber(amount) ~= nil then
						for i = 1, tonumber(amount) do
							if GetEntitySpeed(PlayerPedId()) > 1 then
								exports.coreLua:ShowNotification('Canceled action!')
								break
							end
							if exports.InventorySystem:GetItemAmount('scrap_metal') >= 1 then
								TaskTurnPedToFaceEntity(PlayerPedId(), currentObj, 2000)
								ExecuteCommand('e mechanic')
								exports.coreLua:StartLoadingBar(4)
								Wait(5000)
								exports.InventorySystem:RemoveItem('scrap_metal', 1)
								exports.InventorySystem:GiveItem('nails', 2)
								exports.coreLua:ShowNotification('Crafted ~g~2x~s~ Nails')
								ExecuteCommand('e c')
							else
								exports.coreLua:ShowNotification('Not enough resources. Requires ~r~1x~s~ Scrap Metal | ~r~2x~s~ Nails')
								break
							end
						end
					end
				elseif WarMenu.Button('Craft Wood Planks') then
					local amount = exports.coreLua:KeyboardInput('Enter amount to craft', '', 3)
					if tonumber(amount) ~= nil then
						for i = 1, tonumber(amount) do
							if GetEntitySpeed(PlayerPedId()) > 1 then
								exports.coreLua:ShowNotification('Canceled action!')
								break
							end
							if exports.InventorySystem:GetItemAmount('wood_logs') >= 1 then
								TaskTurnPedToFaceEntity(PlayerPedId(), currentObj, 2000)
								ExecuteCommand('e mechanic')
								exports.coreLua:StartLoadingBar(9)
								Wait(10000)
								exports.InventorySystem:RemoveItem('wood_logs', 1)
								exports.InventorySystem:GiveItem('wood_plank', 4)
								exports.coreLua:ShowNotification('Crafted ~g~4x~s~ Wood Planks')
								ExecuteCommand('e c')
							else
								exports.coreLua:ShowNotification('Not enough resources. Requires ~r~1x~s~ Wood Logs | ~r~4x~s~ Wood Planks')
								break
							end
						end
					end
				end
			elseif primaryProfession == 'Gunsmith' or secondaryProfession == 'Gunsmith' then
				if WarMenu.Button('Craft Arrow') then
					local amount = exports.coreLua:KeyboardInput('Enter amount to craft', '', 3)
					if tonumber(amount) ~= nil then
						for i = 1, tonumber(amount) do
							if GetEntitySpeed(PlayerPedId()) > 1 then
								exports.coreLua:ShowNotification('Canceled action!')
								break
							end
							if exports.InventorySystem:GetItemAmount('scrap_metal') >= 1 and exports.InventorySystem:GetItemAmount('wood_plank') >= 1 then
								TaskTurnPedToFaceEntity(PlayerPedId(), currentObj, 2000)
								ExecuteCommand('e mechanic')
								exports.coreLua:StartLoadingBar(9)
								Wait(10000)
								exports.InventorySystem:RemoveItem('scrap_metal', 1)
								exports.InventorySystem:RemoveItem('wood_plank', 1)
								exports.InventorySystem:GiveItem('arrow', 1)
								exports.coreLua:ShowNotification('Crafted ~g~1x~s~ Arrow')
								ExecuteCommand('e c')
							else
								exports.coreLua:ShowNotification('Not enough resources. Requires ~r~1x~s~ Scrap Metal | ~r~1x~s~ Wood Plank')
								break
							end
						end
					end
				elseif WarMenu.Button('Craft Assault Rifle Ammo') then
					local amount = exports.coreLua:KeyboardInput('Enter amount to craft', '', 3)
					if tonumber(amount) ~= nil then
						for i = 1, tonumber(amount) do
							if GetEntitySpeed(PlayerPedId()) > 1 then
								exports.coreLua:ShowNotification('Canceled action!')
								break
							end
							if exports.InventorySystem:GetItemAmount('brass') >= 30 and exports.InventorySystem:GetItemAmount('gunpowder') >= 15 then
								TaskTurnPedToFaceEntity(PlayerPedId(), currentObj, 2000)
								ExecuteCommand('e mechanic')
								exports.coreLua:StartLoadingBar(9)
								Wait(10000)
								exports.InventorySystem:RemoveItem('brass', 30)
								exports.InventorySystem:RemoveItem('gunpowder', 15)
								exports.InventorySystem:GiveItem('ar_ammo', 1)
								exports.coreLua:ShowNotification('Crafted ~g~1x~s~ Assault Rifle Ammo')
								ExecuteCommand('e c')
							else
								exports.coreLua:ShowNotification('Not enough resources. Requires ~r~30x~s~ Brass | ~r~15x~s~ Gunpowder')
								break
							end
						end
					end
				elseif WarMenu.Button('Craft Flare Ammo') then
					local amount = exports.coreLua:KeyboardInput('Enter amount to craft', '', 3)
					if tonumber(amount) ~= nil then
						for i = 1, tonumber(amount) do
							if GetEntitySpeed(PlayerPedId()) > 1 then
								exports.coreLua:ShowNotification('Canceled action!')
								break
							end
							if exports.InventorySystem:GetItemAmount('plastic') >= 1 and exports.InventorySystem:GetItemAmount('gunpowder') >= 1 then
								TaskTurnPedToFaceEntity(PlayerPedId(), currentObj, 2000)
								ExecuteCommand('e mechanic')
								exports.coreLua:StartLoadingBar(4)
								Wait(5000)
								exports.InventorySystem:RemoveItem('plastic', 1)
								exports.InventorySystem:RemoveItem('gunpowder', 1)
								exports.InventorySystem:GiveItem('flare_ammo', 1)
								exports.coreLua:ShowNotification('Crafted ~g~1x~s~ Flare Ammo')
								ExecuteCommand('e c')
							else
								exports.coreLua:ShowNotification('Not enough resources. Requires ~r~1x~s~ Plastic | ~r~1x~s~ Gunpowder')
								break
							end
						end
					end
				elseif WarMenu.Button('Craft MG Ammo') then
					local amount = exports.coreLua:KeyboardInput('Enter amount to craft', '', 3)
					if tonumber(amount) ~= nil then
						for i = 1, tonumber(amount) do
							if GetEntitySpeed(PlayerPedId()) > 1 then
								exports.coreLua:ShowNotification('Canceled action!')
								break
							end
							if exports.InventorySystem:GetItemAmount('brass') >= 100 and exports.InventorySystem:GetItemAmount('gunpowder') >= 50 then
								TaskTurnPedToFaceEntity(PlayerPedId(), currentObj, 2000)
								ExecuteCommand('e mechanic')
								exports.coreLua:StartLoadingBar(9)
								Wait(10000)
								exports.InventorySystem:RemoveItem('brass', 100)
								exports.InventorySystem:RemoveItem('gunpowder', 50)
								exports.InventorySystem:GiveItem('mg_ammo', 1)
								exports.coreLua:ShowNotification('Crafted ~g~1x~s~ MG Ammo')
								ExecuteCommand('e c')
							else
								exports.coreLua:ShowNotification('Not enough resources. Requires ~r~100x~s~ Brass | ~r~50x~s~ Gunpowder')
								break
							end
						end
					end
				elseif WarMenu.Button('Craft Pistol Ammo') then
					local amount = exports.coreLua:KeyboardInput('Enter amount to craft', '', 3)
					if tonumber(amount) ~= nil then
						for i = 1, tonumber(amount) do
							if GetEntitySpeed(PlayerPedId()) > 1 then
								exports.coreLua:ShowNotification('Canceled action!')
								break
							end
							if exports.InventorySystem:GetItemAmount('brass') >= 10 and exports.InventorySystem:GetItemAmount('gunpowder') >= 5 then
								TaskTurnPedToFaceEntity(PlayerPedId(), currentObj, 2000)
								ExecuteCommand('e mechanic')
								exports.coreLua:StartLoadingBar(9)
								Wait(10000)
								exports.InventorySystem:RemoveItem('brass', 10)
								exports.InventorySystem:RemoveItem('gunpowder', 5)
								exports.InventorySystem:GiveItem('pistol_ammo', 1)
								exports.coreLua:ShowNotification('Crafted ~g~1x~s~ Pistol Ammo')
								ExecuteCommand('e c')
							else
								exports.coreLua:ShowNotification('Not enough resources. Requires ~r~10x~s~ Brass | ~r~5x~s~ Gunpowder')
								break
							end
						end
					end
				elseif WarMenu.Button('Craft Shotgun Ammo') then
					local amount = exports.coreLua:KeyboardInput('Enter amount to craft', '', 3)
					if tonumber(amount) ~= nil then
						for i = 1, tonumber(amount) do
							if GetEntitySpeed(PlayerPedId()) > 1 then
								exports.coreLua:ShowNotification('Canceled action!')
								break
							end
							if exports.InventorySystem:GetItemAmount('brass') >= 8 and exports.InventorySystem:GetItemAmount('gunpowder') >= 4 then
								TaskTurnPedToFaceEntity(PlayerPedId(), currentObj, 2000)
								ExecuteCommand('e mechanic')
								exports.coreLua:StartLoadingBar(9)
								Wait(10000)
								exports.InventorySystem:RemoveItem('brass', 8)
								exports.InventorySystem:RemoveItem('gunpowder', 4)
								exports.InventorySystem:GiveItem('shotgun_ammo', 1)
								exports.coreLua:ShowNotification('Crafted ~g~1x~s~ Shotgun Ammo')
								ExecuteCommand('e c')
							else
								exports.coreLua:ShowNotification('Not enough resources. Requires ~r~8x~s~ Brass | ~r~4x~s~ Gunpowder')
								break
							end
						end
					end
				elseif WarMenu.Button('Craft Sniper Rifle Ammo') then
					local amount = exports.coreLua:KeyboardInput('Enter amount to craft', '', 3)
					if tonumber(amount) ~= nil then
						for i = 1, tonumber(amount) do
							if GetEntitySpeed(PlayerPedId()) > 1 then
								exports.coreLua:ShowNotification('Canceled action!')
								break
							end
							if exports.InventorySystem:GetItemAmount('brass') >= 10 and exports.InventorySystem:GetItemAmount('gunpowder') >= 5 then
								TaskTurnPedToFaceEntity(PlayerPedId(), currentObj, 2000)
								ExecuteCommand('e mechanic')
								exports.coreLua:StartLoadingBar(9)
								Wait(10000)
								exports.InventorySystem:RemoveItem('brass', 10)
								exports.InventorySystem:RemoveItem('gunpowder', 5)
								exports.InventorySystem:GiveItem('sniper_ammo', 1)
								exports.coreLua:ShowNotification('Crafted ~g~1x~s~ Sniper Rifle Ammo')
								ExecuteCommand('e c')
							else
								exports.coreLua:ShowNotification('Not enough resources. Requires ~r~10x~s~ Brass | ~r~5x~s~ Gunpowder')
								break
							end
						end
					end
				end
			end
			WarMenu.End()
		end
		Citizen.Wait(1)
	end
end)

function NearestVehicle()
	if IsPedInAnyVehicle(PlayerPedId()) then
		local handle = GetVehiclePedIsIn(PlayerPedId(), false)
		local nearVehicle = true
		return nearVehicle, handle
	else
		local coords = GetEntityCoords(PlayerPedId(), false)
		local shapetest = StartShapeTestCapsule(coords.x, coords.y, coords.z, coords.x, coords.y, coords.z, 5.0, 2, PlayerPedId(), 7)
		local number, nearVehicle, endCoords, surfaceNormal, handle = GetShapeTestResult(shapetest)
		return nearVehicle, handle
	end
end

function DrawText(x, y, text, font, scale, center, r, g, b)
	SetTextFont(font)
	SetTextProportional(1)
	SetTextScale(0.0, scale)
	SetTextColour(r, g, b, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextCentre(center)
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	EndTextCommandDisplayText(x, y)
end