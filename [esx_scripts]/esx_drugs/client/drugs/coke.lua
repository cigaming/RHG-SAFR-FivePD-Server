local spawnedCoke = 0
local cokePlants = {}
local isPickingUp, isProcessing = false, false



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.CokeField.coords, true) < 50 then
			SpawnCoke()
			Citizen.Wait(500)
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.ProcessZones.CokeProcessing.coords, true) < 3 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('coke_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then
				isProcessing = true
				ESX.ShowNotification(_U('coke_processingstarted'))
				TriggerServerEvent('esx_drugs:processCoke')
				local timeLeft = Config.Delays.CokeProcessing / 1000

				while timeLeft > 0 do
					Citizen.Wait(1000)
					timeLeft = timeLeft - 1

					if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.ProcessZones.CokeProcessing.coords, false) > 10 then
						ESX.ShowNotification(_U('coke_processingtoofar'))
						TriggerServerEvent('esx_drugs:cancelProcessing')
						break
					end
				end

				isProcessing = false
			end
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObjects, nearbyIDs = nil, nil

		for i=1, #cokePlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(cokePlants[i]), false) < 1 then
				nearbyObjects, nearbyIDs = cokePlants[i], i
			end
		end

		if nearbyObjects and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('coke_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				
				ESX.TriggerServerCallback('esx_drugs:anycops', function(cops)
					if cops >= Config.CopsRequired then
						
						isPickingUp = true
						
						ESX.TriggerServerCallback('esx_drugs:canPickUp', function(canPickUp)
							
							if canPickUp then
								TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
								
								Citizen.Wait(2000)
								ClearPedTasks(playerPed)
								Citizen.Wait(1500)
								
								ESX.Game.DeleteObject(nearbyObjects)
		
								table.remove(cokePlants, nearbyIDs)
								spawnedCoke = spawnedCoke - 1
		
								TriggerServerEvent('esx_drugs:pickedUpCoke')
							else
								ESX.ShowNotification(_U('coke_inventoryfull'))
							end

							isPickingUp = false
						end, 'crack')
					else
						ESX.ShowNotification(_U('not_enough_cops'))
					end
				end)
			end
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(cokePlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnCoke()
	while spawnedCoke < 25 do
		Citizen.Wait(0)
		local cokeCoords = GenerateCokeCoords()
		
		-- prop_weed_02
		-- prop_coke_block_01
		ESX.Game.SpawnLocalObject('prop_bush_med_01', cokeCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(cokePlants, obj)
			spawnedCoke = spawnedCoke + 1
		end)
	end
end

function ValidateCokeCoord(plantCoord)
	if spawnedCoke > 0 then
		local validate = true

		for k, v in pairs(cokePlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.CokeField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateCokeCoords()
	while true do
		Citizen.Wait(1)

		local cokeCoordX, cokeCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-90, 90)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-90, 90)

		if modX > 0 then
			cokeCoordX = Config.CircleZones.CokeField.coords.x + modX
		else
			cokeCoordX = Config.CircleZones.CokeField.coords.x - modX
		end

		if modY > 0 then
			cokeCoordY = Config.CircleZones.CokeField.coords.y + modY
		else
			cokeCoordY = Config.CircleZones.CokeField.coords.y - modY
		end

		local coordZ = GetCoordZ(cokeCoordX, cokeCoordY)
		local coord = vector3(cokeCoordX, cokeCoordY, coordZ)

		if ValidateCokeCoord(coord) then
			return coord
		end
	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 30.0, 39.0, 32.0, 35.0, 32.0, 33.0, 46.0, 47.0, 48.0, 32.0, 33.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 35.0
end