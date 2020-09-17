local spawnedGolds = 0
local golden = {}
local isPickingUp, isProcessing = false, false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.GoldField.coords, true) < 50 then
			SpawnedGoldds()
			Citizen.Wait(500)
		else
			Citizen.Wait(500)
		end
	end
end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #golden, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(golden[i]), false) < 1 then
				nearbyObject, nearbyID = golden[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('gold_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('esx_GoldDig:canPickUp', function(canPickUp)

					if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_CONST_DRILL', 0, false)
 TriggerEvent("mythic_progbar:client:progress", {
						 
							name = "unique_action_name",
							duration = 5000,
							label = "Drilling....",
							useWhileDead = false,
							canCancel = true,
							controlDisables = {
								disableMovement = true,
								disableCarMovement = true,
								disableMouse = false,
								disableCombat = true,
								},
								
							}, function(status)
								if not status then
									-- Do Something If Event Wasn't Cancelled
								end
						end)
						Citizen.Wait(5000)
						ClearPedTasks(playerPed)
						Citizen.Wait(0)
		
						ESX.Game.DeleteObject(nearbyObject)
		
						table.remove(golden, nearbyID)
						spawnedGolds = spawnedGolds - 1
		
						TriggerServerEvent('esx_GoldDig:pickedUpCannabis')
					else
						ESX.ShowNotification(_U('gold_inventoryfull'))
					end

					isPickingUp = false

				end, 'gold_o')
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(golden) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnedGoldds()
	while spawnedGolds < 50 do
		Citizen.Wait(0)
		local goldCoords = GenerateGoldCoords()

		ESX.Game.SpawnLocalObject('prop_rock_5_c', goldCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(golden, obj)
			spawnedGolds = spawnedGolds + 1
		end)
	end
end

function ValidateGoldCoord(plantCoord)
	if spawnedGolds > 0 then
		local validate = true

		for k, v in pairs(golden) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 10 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.GoldField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateGoldCoords()
	while true do
		Citizen.Wait(1)

		local goldCoordX, goldCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-120, 120)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-120, 120)

		goldCoordX = Config.CircleZones.GoldField.coords.x + modX
		goldCoordY = Config.CircleZones.GoldField.coords.y + modY

		local coordZ = GetCoordZ(goldCoordX, goldCoordY)
		local coord = vector3(goldCoordX, goldCoordY, coordZ)

		if ValidateGoldCoord(coord) then
			return coord
		end
	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 43.0
end