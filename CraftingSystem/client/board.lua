Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local hit, coords, entity = exports.coreLua:GetCameraTarget(5.0, 16)
		if entity ~= 0 and not IsAimCamActive() and DecorExistOn(entity, 'board') then
			exports.coreLua:DrawText3d(coords.x, coords.y, coords.z, 0.35, 0, 'Press ~g~E~s~ to interact with bulletin board', 255, 255, 255, true)
			if IsControlJustPressed(0, 51) then
				for k,v in pairs(objects) do
					if v.handle == entity then
						objectId = k
					end
				end
				targetEntity = entity
				crateStorage = nil
				WarMenu.OpenMenu('boardMenu')
			end
		end
	end
end)

-- BOARD MENU
Citizen.CreateThread(function()
	WarMenu.CreateMenu('boardMenu', 'Bulletin Board')
	WarMenu.CreateSubMenu('tasksMenu', 'boardMenu', 'View Tasks')
	WarMenu.CreateSubMenu('viewNotesMenu', 'boardMenu', 'View Notes')
	WarMenu.CreateSubMenu('selectedNoteMenu', 'viewNotesMenu', 'Selected Note')
	while true do
		Citizen.Wait(1)
		if WarMenu.Begin('boardMenu') then
			if WarMenu.Button('Add Note') then
				local title = exports.coreLua:KeyboardInput('Enter Title for Note', '', 25)
				local desc = exports.coreLua:KeyboardInput('Enter Description for Note', '', 1000)
				if string.len(title) > 3 and string.len(desc) > 5 then
					local data = {
						title = title,
						desc = desc,
						characterName = string.upper(exports.CharacterSystem:CharacterName()),
					}
					TriggerServerEvent('CraftingSystem:addNote', objectId, data)
					exports.coreLua:ShowNotification('Added Note: ~r~'..title)
					title = nil
					desc = nil
				end
			elseif WarMenu.MenuButton('Task List  >>>', 'tasksMenu') then
				TriggerServerEvent('CraftingSystem:getTaskNotes', objectId)
			elseif WarMenu.MenuButton('View Notes  >>>', 'viewNotesMenu') then
				TriggerServerEvent('CraftingSystem:getNotes', objectId)
			end
			WarMenu.End()
		elseif WarMenu.Begin('tasksMenu') then
			if WarMenu.Button('~g~Add Task Note') then
				local item = exports.coreLua:KeyboardInput('Enter Text for Task Note', '', 25)
				if string.len(item) > 3 then
					local data = {
						item = item,
						checked = false,
						characterName = string.upper(exports.CharacterSystem:CharacterName()),
					}
					TriggerServerEvent('CraftingSystem:addTaskNote', objectId, data)
					exports.coreLua:ShowNotification('Added Task Note: ~r~'..item)
					item = nil
				end
			elseif WarMenu.Button('~r~Clean Completed Tasks') then
				local code = math.random(1000, 9999)
				local confirm = exports.coreLua:KeyboardInput('Enter Confirmation Code: '..code, '', 4)
				if confirm ~= nil and tonumber(confirm) ~= nil then
					if tonumber(confirm) == code then
						TriggerServerEvent('CraftingSystem:deleteCompletedTasks', objectId)
					end
				end
			end
			if taskNotes ~= nil then
				local characterName = string.upper(exports.CharacterSystem:CharacterName())
				for i,v in ipairs(taskNotes) do
					WarMenu.CheckBox(v.item, v.checked)
					if WarMenu.IsItemHovered() then
						if v.checkedBy ~= '' then
							WarMenu.ToolTip('Completed By: ~g~'..v.checkedBy, 0.25, true)
						end
					end
					if WarMenu.IsItemSelected() then
						TriggerServerEvent('CraftingSystem:completeTask', objectId, i)
					end
				end
			end
			WarMenu.End()
		elseif WarMenu.Begin('viewNotesMenu') then
			if notes ~= nil then
				for i,v in ipairs(notes) do
					if WarMenu.MenuButton(v.title, 'selectedNoteMenu') then
						index = i
						note = v
					end
				end
			end
			WarMenu.End()
		elseif WarMenu.Begin('selectedNoteMenu') then
			if WarMenu.Button('View Description  >>>') then
				local desc = exports.coreLua:KeyboardInput('Description', note.desc, 1000)
			elseif WarMenu.Button('Author Name:', note.characterName) then
			elseif WarMenu.Button('Date:', note.date) then
			elseif WarMenu.Button('~r~Delete Note') then
				local code = math.random(1000, 9999)
				local confirm = exports.coreLua:KeyboardInput('Enter Confirmation Code: '..code, '', 4)
				if confirm ~= nil and tonumber(confirm) ~= nil then
					if tonumber(confirm) == code then
						TriggerServerEvent('CraftingSystem:deleteNote', objectId, index)
						WarMenu.OpenMenu('viewNotesMenu')
					end
				end
			end
			WarMenu.End()
		end
	end
end)