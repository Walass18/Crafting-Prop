showInfo = false

sortedNames = {}

RegisterNetEvent('CraftingSystem:completeTask', function(id, index, data)
	if id == objectId then
		taskNotes[index].checked = data.checked
		taskNotes[index].checkedBy = data.checkedBy
	end
end)

RegisterNetEvent('CraftingSystem:deleteProp', function(id, data)
	harvestedProps[id] = data
	-- for i, obj in ipairs(GetGamePool('CObject')) do
		-- if #(coords - GetEntityCoords(obj)) <= 1.0 and GetEntityModel(obj) == model then
			
			-- SetEntityAsMissionEntity(obj, true, true)
			-- DeleteEntity(obj)
		-- end
	-- end
end)

RegisterNetEvent('CraftingSystem:destroy', function(objectId)
	DeleteEntity(objects[objectId].handle)
	objects[objectId] = nil
end)

RegisterNetEvent('CraftingSystem:destroyStaff', function(coords, radius)	
	local count = 0
	print(coords)
	for k,v in pairs(objects) do
		if #(coords - vector3(v.pos.x, v.pos.y, v.pos.z)) < radius then
			if DoesEntityExist(v.handle) then
				DeleteEntity(v.handle)
			end
			objects[k] = nil
			count = count + 1
		end
	end
	print('Removed '..count..' crafted structures')
end)

RegisterNetEvent('CraftingSystem:getData', function(data1, data2)
	objects = data1
	harvestedProps = data2
end)

RegisterNetEvent('CraftingSystem:getNotes', function(data)
	notes = data
end)

RegisterNetEvent('CraftingSystem:getTaskNotes', function(data)
	taskNotes = data
end)

RegisterNetEvent('CraftingSystem:getStorageData', function(data)
	crateStorage = data
end)

RegisterNetEvent('CraftingSystem:openCraftingManager', function()
	-- sortedNames = {}
	for k,v in pairs(objects) do
		sortedNames[v.playerName] = true
	end
	WarMenu.OpenMenu('craftingManager')
end)

RegisterNetEvent('CraftingSystem:save', function(objectId, data)
	local pos = {}
	pos.x = data.pos.x
	pos.y = data.pos.y
	pos.z = data.pos.z
	data.pos = pos
	objects[objectId] = data
end)

RegisterNetEvent('CraftingSystem:showInfo', function()
	showInfo = not showInfo
end)

RegisterNetEvent('CraftingSystem:storeItem', function(id, data)
	if id == objectId then
		crateStorage = data
	end
end)

RegisterNetEvent('CraftingSystem:takeItem', function(id, data)
	if id == objectId then
		crateStorage = data
	end
end)

RegisterNetEvent('CraftingSystem:updateNotes', function(id, data)
	if id == objectId then
		notes = data
	end
end)

RegisterNetEvent('CraftingSystem:updateTaskNotes', function(id, data)
	if id == objectId then
		taskNotes = data
	end
end)

RegisterNetEvent('CraftingSystem:update', function(id, data)
	data.handle = objects[id].handle
	Wait(100)
	objects[id] = data
	SetEntityCoords(objects[id].handle, data.pos.x, data.pos.y, data.pos.z)
	SetEntityHeading(objects[id].handle, data.rot.z)
	if data.onGround then
		PlaceObjectOnGroundProperly(objects[id].handle)
	end
end)