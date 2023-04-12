RegisterNetEvent('CraftingSystem:updateDoor', function(objectId, action)
	if objects[objectId] ~= nil then
		if action == 'close' then
			objects[objectId].open = false
			if DoesEntityExist(objects[objectId].handle) then
				SetEntityRotation(objects[objectId].handle, objects[objectId].rot.x, objects[objectId].rot.y, objects[objectId].rot.z, 2, false)
			end
		elseif action == 'lock' then
			objects[objectId].locked = true
		elseif action == 'open' then
			objects[objectId].open = true
			if DoesEntityExist(objects[objectId].handle) then
				SetEntityRotation(objects[objectId].handle, objects[objectId].rot.x, objects[objectId].rot.y, objects[objectId].rot.z + 90, 2, false)
			end
		elseif action == 'unlock' then
			objects[objectId].locked = false
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local hit, coords, entity = exports.coreLua:GetCameraTarget(5.0, 16)
		if entity ~= 0 and not IsAimCamActive() and DecorExistOn(entity, 'door') then
			exports.coreLua:DrawText3d(coords.x, coords.y, coords.z, 0.35, 0, 'Press ~g~E~s~ to interact with door', 255, 255, 255, true)
			if IsControlJustPressed(0, 51) then
				for k,v in pairs(objects) do
					if v.handle == entity then
						objectId = k
					end
				end
				targetEntity = entity
				WarMenu.OpenMenu('doorMenu')
			end
		end
	end
end)

-- DOOR MENU
Citizen.CreateThread(function()
	WarMenu.CreateMenu('doorMenu', 'Door')
	while true do
		Citizen.Wait(1)
		if WarMenu.Begin('doorMenu') then
			if objects[objectId] ~= nil then
				if objects[objectId].open then
					if WarMenu.Button('Open/Close Door', '~g~OPEN') then
						TriggerServerEvent('CraftingSystem:updateDoor', objectId, 'close')
					end
				else
					if WarMenu.Button('Open/Close Door', '~r~CLOSED') then
						if not objects[objectId].locked then
							TriggerServerEvent('CraftingSystem:updateDoor', objectId, 'open')
						end
					end
				end
				
				if objects[objectId].locked then
					if WarMenu.Button('Lock/Unlock Door', '~r~LOCKED') then
						local accessCode = exports.coreLua:KeyboardInput('Enter Access Code', '', 30)
						if accessCode == objects[objectId].accessCode then
							TriggerServerEvent('CraftingSystem:updateDoor', objectId, 'unlock')
						end
					end
				else
					if WarMenu.Button('Lock/Unlock Door', '~g~UNLOCKED') then
						local accessCode = exports.coreLua:KeyboardInput('Enter Access Code', '', 30)
						if accessCode == objects[objectId].accessCode then
							TriggerServerEvent('CraftingSystem:updateDoor', objectId, 'lock')
						end
					end
				end
			end
			WarMenu.End()
		end
	end
end)