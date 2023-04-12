objects = {}
harvestedProps = {}

DecorRegister('board', 2)
DecorRegister('craftable', 2)
DecorRegister('crate', 2)
DecorRegister('door', 2)

-- Show info
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if showInfo then
			for k,v in pairs(objects) do
				if #(GetEntityCoords(PlayerPedId()) - vector3(v.pos.x, v.pos.y, v.pos.z)) <= 25.0 then
					if v.type == 'storage_locked' then
						exports.coreLua:DrawText3d(v.pos.x, v.pos.y, v.pos.z, 0.5, 0, 'Owner: ~g~'..v.playerName..'~s~ | ID: ~r~'..k..'~s~ | Access Code: ~r~'..v.accessCode, 255, 255, 255, true)
					else
						exports.coreLua:DrawText3d(v.pos.x, v.pos.y, v.pos.z, 0.5, 0, 'Owner: ~g~'..v.playerName..'~s~ | ID: ~r~'..k, 255, 255, 255, true)
					end
				end
			end
		end
	end
end)

-- Handle Spawning
Citizen.CreateThread(function()
	TriggerServerEvent('CraftingSystem:getData')
	while true do
		Citizen.Wait(1000)
		local pos = GetEntityCoords(PlayerPedId())
		for k,v in pairs(objects) do
			if #(pos - vector3(v.pos.x, v.pos.y, v.pos.z)) <= 250.0 then
				if not DoesEntityExist(v.handle) then
					RequestModel(v.model)
					while not HasModelLoaded(v.model) do
						Wait(1)
					end
					v.handle = CreateObjectNoOffset(v.model, v.pos.x, v.pos.y, v.pos.z, false, false, true)
					SetEntityAsMissionEntity(v.handle)
					SetEntityRotation(v.handle, v.rot.x, v.rot.y, v.rot.z, 2, false)
					FreezeEntityPosition(v.handle, true)
					SetEntityLodDist(v.handle, 250)
					if v.onGround then
						PlaceObjectOnGroundProperly(v.handle)
					end
					if v.type == 'storage' or v.type == 'storage_locked' then
						DecorSetBool(v.handle, 'crate', true)
						DecorSetBool(v.handle, 'craftable', true)
					elseif v.model == GetHashKey('vw_prop_vw_board_01a') then
						DecorSetBool(v.handle, 'board', true)
						DecorSetBool(v.handle, 'craftable', true)
					elseif v.type == 'door' then
						DecorSetBool(v.handle, 'door', true)
						DecorSetBool(v.handle, 'craftable', true)
						if v.open then
							SetEntityRotation(v.handle, v.rot.x, v.rot.y, v.rot.z + 90, 2, false)
						end
					else
						DecorSetBool(v.handle, 'craftable', true)
					end
				end
			else
				if DoesEntityExist(v.handle) then
					DeleteEntity(v.handle)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		for i, obj in pairs(GetGamePool('CObject')) do
			local pos = GetEntityCoords(obj)
			local id = math.floor(pos.x, 0.5)..''..math.floor(pos.y, 0.5)..''..math.floor(pos.z, 0.5)
			if harvestedProps[id] ~= nil then
				print(obj)
				SetEntityAsMissionEntity(obj)
				DeleteEntity(obj)
			end
		end
	end
end)

-- CRATE LABELS
function GetCloseObjects()
	local t = {}
	local pos = GetEntityCoords(PlayerPedId())
	for k,v in pairs(objects) do
		if #(pos - vector3(v.pos.x, v.pos.y, v.pos.z)) <= 5.0 then
			if v.type == 'storage' or v.type == 'storage_locked' or v.model == GetHashKey('vw_prop_vw_board_01a') then
				t[k] = v
			end
		end
	end
	return t
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		closeObjects = GetCloseObjects()
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if closeObjects ~= nil then
			for k,v in pairs(closeObjects) do
				exports.coreLua:DrawText3d(v.pos.x, v.pos.y, v.pos.z, 0.5, 0, v.label, 255, 255, 255, true)
			end
		end
	end
end)

exports('Destroy', function(entity)
	for k,v in pairs(objects) do
		if v.handle == entity then
			objectId = k
		end
	end
	TriggerServerEvent('CraftingSystem:destroy', objectId)
	
	-- Return materials
	if DecorExistOn(entity, 'crate') then
		if crates[GetEntityModel(entity)] ~= nil then
			requirements = crates[GetEntityModel(entity)].requirements
		end
		if requirements ~= nil then
			for i, v in ipairs(requirements) do
				exports.InventorySystem:GiveItem(v.item, v.amount)
			end
		end
	elseif DecorExistOn(entity, 'door') then
		for i, v in ipairs(doors) do
			if GetEntityModel(entity) == GetHashKey(v.hash) then
				requirements = v.requirements
			end
		end
		if requirements ~= nil then
			for i, v in ipairs(requirements) do
				exports.InventorySystem:GiveItem(v.item, v.amount)
			end
		end
	else
		for i, v in ipairs(structures) do
			if GetEntityModel(entity) == GetHashKey(v.hash) then
				requirements = v.requirements
			end
		end
		if requirements ~= nil then
			for i, v in ipairs(requirements) do
				exports.InventorySystem:GiveItem(v.item, v.amount)
			end
		end
	end
end)