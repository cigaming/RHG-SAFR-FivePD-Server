local spawnedSpice = 0
local spicePlants = {}
local isPickingUp, isProcessing = false, false



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.SpiceField.coords, true) < 50 then
			SpawnSpice()
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

		if GetDistanceBetweenCoords(coords, Config.ProcessZones.SpiceProcessing.coords, true) < 3 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('spice_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then
				isProcessing = true
				ESX.ShowNotification(_U('spice_processingstarted'))
				TriggerServerEvent('esx_drugs:processSpice')
				local timeLeft = Config.Delays.SpiceProcessing / 1000

				while timeLeft > 0 do
					Citizen.Wait(1000)
					timeLeft = timeLeft - 1

					if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.ProcessZones.SpiceProcessing.coords, false) > 10 then
						ESX.ShowNotification(_U('spice_processingtoofar'))
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

		for i=1, #spicePlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(spicePlants[i]), false) < 1 then
				nearbyObjects, nearbyIDs = spicePlants[i], i
			end
		end

		if nearbyObjects and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('spice_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

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
		
								table.remove(spicePlants, nearbyIDs)
								spawnedSpice = spawnedSpice - 1
					
								TriggerServerEvent('esx_drugs:pickedUpSpice')
							else
								ESX.ShowNotification(_U('spice_inventoryfull'))
							end

							isPickingUp = false
						end, 'cannabinoid')
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
		for k, v in pairs(spicePlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnSpice()
	while spawnedSpice < 25 do
		Citizen.Wait(0)
		local spiceCoords = GenerateSpiceCoords()
		
		-- prop_weed_02
		-- prop_coke_block_01
		ESX.Game.SpawnLocalObject('prop_bush_med_01', spiceCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(spicePlants, obj)
			spawnedSpice = spawnedSpice + 1
		end)
	end
end

function ValidateSpiceCoord(plantCoord)
	if spawnedSpice > 0 then
		local validate = true

		for k, v in pairs(spicePlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.SpiceField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateSpiceCoords()
	while true do
		Citizen.Wait(1)

		local spiceCoordX, spiceCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-90, 90)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-90, 90)

		if modX > 0 then
			spiceCoordX = Config.CircleZones.SpiceField.coords.x + modX
		else
			spiceCoordX = Config.CircleZones.SpiceField.coords.x - modX
		end

		if modY > 0 then
			spiceCoordY = Config.CircleZones.SpiceField.coords.y + modY
		else
			spiceCoordY = Config.CircleZones.SpiceField.coords.y - modY
		end

		local coordZ = GetCoordZ(spiceCoordX, spiceCoordY)
		local coord = vector3(spiceCoordX, spiceCoordY, coordZ)

		if ValidateSpiceCoord(coord) then
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