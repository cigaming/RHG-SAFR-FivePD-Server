local CurrentAction = nil
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local times 			= 0

local this_Garage = {}

-- Fin Local

-- Init ESX
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
-- Fin init ESX

--- Gestion Des blips
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	--PlayerData = xPlayer
	--TriggerServerEvent('esx_jobs:giveBackCautionInCaseOfDrop')
	refreshBlips()
end)

function refreshBlips()
	local zones = {}
	local blipInfo = {}

	for zoneKey,zoneValues in pairs(Config.Garages)do

		local blip = AddBlipForCoord(zoneValues.Pos.x, zoneValues.Pos.y, zoneValues.Pos.z)
		SetBlipSprite (blip, Config.BlipInfos.Sprite)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.2)
		SetBlipColour (blip, Config.BlipInfos.Color)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(zoneKey)
		EndTextCommandSetBlipName(blip)

		local blip = AddBlipForCoord(zoneValues.MunicipalPoundPoint.Pos.x, zoneValues.MunicipalPoundPoint.Pos.y, zoneValues.MunicipalPoundPoint.Pos.z)
		SetBlipSprite (blip, Config.BlipPound.Sprite)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.2)
		SetBlipColour (blip, Config.BlipPound.Color)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Fourriere")
		EndTextCommandSetBlipName(blip)
	end
end
-- Fin Gestion des Blips

--Fonction Menu

function OpenMenuGarage(PointType)

	ESX.UI.Menu.CloseAll()

	local elements = {}


	if PointType == 'spawn' then
		table.insert(elements,{label = "Liste des véhicules", value = 'list_vehicles'})
	end

	if PointType == 'delete' then
		table.insert(elements,{label = "Rentrer vehicules", value = 'stock_vehicle'})
	end

	if PointType == 'pound' then
		table.insert(elements,{label = "Retour vehicule ("..Config.Price.."$)", value = 'return_vehicle'})
	end

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'garage_menu',
		{
			title    = 'Garage',
			align    = 'top-left',
			elements = elements,
		},
		function(data, menu)

			menu.close()
			if(data.current.value == 'list_vehicles') then
				ListVehiclesMenu()
			end
			if(data.current.value == 'stock_vehicle') then
				StockVehicleMenu()
			end
			if(data.current.value == 'return_vehicle') then
				ReturnVehicleMenu()
			end

			local playerPed = GetPlayerPed(-1)
			SpawnVehicle(data.current.value)

		end,
		function(data, menu)
			menu.close()

		end
	)
end


-- Afficher les listes des vehicules
function ListVehiclesMenu()
	local elements, vehiclePropsList = {}, {}

	ESX.TriggerServerCallback('eden_garage:getVehicles', function(vehicles)

		for k,v in ipairs(vehicles) do
			local vehicleProps = json.decode(v.vehicle)
			vehiclePropsList[vehicleProps.plate] = vehicleProps
			local vehicleHash = vehicleProps.model
			local vehicleName = GetDisplayNameFromVehicleModel(vehicleHash)
			local vehicleLabel

			if v.state then
				vehicleLabel = vehicleName..': Garage'
			else
				vehicleLabel = vehicleName..': Fourriere'
			end

			table.insert(elements, {
				label = vehicleLabel,
				state = v.state,
				plate = vehicleProps.plate
			})
		end

		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'spawn_vehicle',
		{
			title    = 'Garage',
			align    = 'top-left',
			elements = elements,
		},
		function(data, menu)
			if data.current.state then
				menu.close()
				local vehicleProps = vehiclePropsList[data.current.plate]
				SpawnVehicle(vehicleProps)
			else
				TriggerEvent('esx:showNotification', 'Votre véhicule est a la fourriere')
			end
		end,
		function(data, menu)
			menu.close()
			--CurrentAction = 'open_garage_action'
		end
	)
	end)
end
-- Fin Afficher les listes des vehicules
function reparation(prix,vehicle,vehicleProps)

	ESX.UI.Menu.CloseAll()

	local elements = {
		{label = "Rentrer le vehicule ("..prix.."$)", value = 'yes'},
		{label = "passer voir le mécano", value = 'no'},
	}
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'delete_menu',
		{
			title    = 'vehicule endomagé',
			align    = 'top-left',
			elements = elements,
		},
		function(data, menu)

			menu.close()
			if(data.current.value == 'yes') then
				TriggerServerEvent('eden_garage:payhealth', math.abs(prix))
				ranger(vehicle,vehicleProps)
			end
			if(data.current.value == 'no') then
				ESX.ShowNotification('Passez voir le mécano')
			end

		end,
		function(data, menu)
			menu.close()

		end
	)
end

function ranger(vehicle,vehicleProps)
	ESX.Game.DeleteVehicle(vehicle)
	TriggerServerEvent('eden_garage:modifystate', vehicleProps, true)
	TriggerEvent('esx:showNotification', 'Votre véhicule est dans le garage')
end

-- Fonction qui permet de rentrer un vehicule
function StockVehicleMenu()
	local playerPed  = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed,  false) then

		local playerPed = GetPlayerPed(-1)
		local coords    = GetEntityCoords(playerPed)
		local vehicle =GetVehiclePedIsIn(playerPed,false)
		local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
		local current 	    = GetPlayersLastVehicle(GetPlayerPed(-1), true)
		local engineHealth  = GetVehicleEngineHealth(current)

		ESX.TriggerServerCallback('eden_garage:stockv',function(valid)

			if (valid) then
				TriggerServerEvent('eden_garage:debug', "plaque vehicule rentree au garage: "  .. vehicleProps.plate)
				TriggerServerEvent('eden_garage:logging',"santee vehicule rentree au garage: " .. engineHealth)
				if engineHealth < 1000 then
					local fraisRep= math.floor((1000 - engineHealth)*100)
				reparation(fraisRep,vehicle,vehicleProps)
				else
					ranger(vehicle,vehicleProps)
				end
			else
				TriggerEvent('esx:showNotification', 'Vous ne pouvez pas stocker ce véhicule')
			end
		end,vehicleProps)
	else
		TriggerEvent('esx:showNotification', 'Il n\' y a pas de vehicule à rentrer')
	end

end
-- Fin fonction qui permet de rentrer un vehicule
--Fin fonction Menu


--Fonction pour spawn vehicule
function SpawnVehicle(vehicle)

	ESX.Game.SpawnVehicle(vehicle.model,{
		x=this_Garage.SpawnPoint.Pos.x ,
		y=this_Garage.SpawnPoint.Pos.y,
		z=this_Garage.SpawnPoint.Pos.z + 1
		},this_Garage.SpawnPoint.Heading, function(callback_vehicle)
		ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
		SetVehRadioStation(callback_vehicle, "OFF")
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
		local plate = GetVehicleNumberPlateText(callback_vehicle)
		TriggerServerEvent("ls:mainCheck", plate, callback_vehicle, true)
		end)


	TriggerServerEvent('eden_garage:modifystate', vehicle, false)

end
--Fin fonction pour spawn vehicule

--Fonction pour spawn vehicule fourriere
function SpawnPoundedVehicle(vehicleProps)

	ESX.Game.SpawnVehicle(vehicleProps.model, {
		x = this_Garage.SpawnMunicipalPoundPoint.Pos.x ,
		y = this_Garage.SpawnMunicipalPoundPoint.Pos.y,
		z = this_Garage.SpawnMunicipalPoundPoint.Pos.z + 1
		},180, function(callback_vehicle)
		ESX.Game.SetVehicleProperties(callback_vehicle, vehicleProps)
		local plate = GetVehicleNumberPlateText(callback_vehicle)
		TriggerServerEvent("ls:mainCheck", plate, callback_vehicle, true)
		end)
	TriggerServerEvent('eden_garage:modifystate', vehicleProps, true)

	ESX.SetTimeout(10000, function()
		TriggerServerEvent('eden_garage:modifystate', vehicleProps, false)
	end)

end
--Fin fonction pour spawn vehicule fourriere
--Action das les markers
AddEventHandler('eden_garage:hasEnteredMarker', function(zone)

	if zone == 'spawn' then
		CurrentAction     = 'spawn'
		CurrentActionMsg  = "Appuyer sur ~INPUT_PICKUP~ pour sortir un vehicule"
		CurrentActionData = {}
	end

	if zone == 'delete' then
		CurrentAction     = 'delete'
		CurrentActionMsg  = "Appuyer sur ~INPUT_PICKUP~ pour rentrer un vehicule"
		CurrentActionData = {}
	end

	if zone == 'pound' then
		CurrentAction     = 'pound_action_menu'
		CurrentActionMsg  = "Appuyer sur ~INPUT_PICKUP~ pour acceder a la fourriere"
		CurrentActionData = {}
	end
end)

AddEventHandler('eden_garage:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)
--Fin Action das les markers

function ReturnVehicleMenu()

	ESX.TriggerServerCallback('eden_garage:getOutVehicles', function(vehicles)

		local elements, vehiclePropsList = {}, {}

		for k,v in ipairs(vehicles) do
			local vehicleProps = json.decode(v.vehicle)
			vehiclePropsList[vehicleProps.plate] = vehicleProps
			local vehicleHash = vehicleProps.model
			local vehicleName = GetDisplayNameFromVehicleModel(vehicleHash)
			local vehicleLabel = vehicleName..': Sortie'

			table.insert(elements, {
				label = vehicleLabel,
				plate = vehicleProps.plate
			})
		end

		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'return_vehicle',
		{
			title    = 'Garage',
			align    = 'top-left',
			elements = elements,
		},
		function(data, menu)

			ESX.TriggerServerCallback('eden_garage:checkMoney', function(hasEnoughMoney)
				if hasEnoughMoney then

					if times == 0 then
						TriggerServerEvent('eden_garage:pay')
						local vehicleProps = vehiclePropsList[data.current.plate]
						SpawnPoundedVehicle(vehicleProps)
						times=times+1
					elseif times > 0 then
						ESX.SetTimeout(60000, function()
						times=0
						end)
					end
				else
					ESX.ShowNotification('Vous n\'avez pas assez d\'argent')
				end
			end)
		end,
		function(data, menu)
			menu.close()
			--CurrentAction = 'open_garage_action'
		end
		)
	end)
end

-- Affichage markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Garages) do
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
				DrawMarker(v.SpawnPoint.Marker, v.SpawnPoint.Pos.x, v.SpawnPoint.Pos.y, v.SpawnPoint.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.SpawnPoint.Size.x, v.SpawnPoint.Size.y, v.SpawnPoint.Size.z, v.SpawnPoint.Color.r, v.SpawnPoint.Color.g, v.SpawnPoint.Color.b, 100, false, true, 2, false, false, false, false)
				DrawMarker(v.DeletePoint.Marker, v.DeletePoint.Pos.x, v.DeletePoint.Pos.y, v.DeletePoint.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.DeletePoint.Size.x, v.DeletePoint.Size.y, v.DeletePoint.Size.z, v.DeletePoint.Color.r, v.DeletePoint.Color.g, v.DeletePoint.Color.b, 100, false, true, 2, false, false, false, false)
			end
			if(GetDistanceBetweenCoords(coords, v.MunicipalPoundPoint.Pos.x, v.MunicipalPoundPoint.Pos.y, v.MunicipalPoundPoint.Pos.z, true) < Config.DrawDistance) then
				DrawMarker(v.MunicipalPoundPoint.Marker, v.MunicipalPoundPoint.Pos.x, v.MunicipalPoundPoint.Pos.y, v.MunicipalPoundPoint.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.MunicipalPoundPoint.Size.x, v.MunicipalPoundPoint.Size.y, v.MunicipalPoundPoint.Size.z, v.MunicipalPoundPoint.Color.r, v.MunicipalPoundPoint.Color.g, v.MunicipalPoundPoint.Color.b, 100, false, true, 2, false, false, false, false)
				DrawMarker(v.SpawnMunicipalPoundPoint.Marker, v.SpawnMunicipalPoundPoint.Pos.x, v.SpawnMunicipalPoundPoint.Pos.y, v.SpawnMunicipalPoundPoint.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.SpawnMunicipalPoundPoint.Size.x, v.SpawnMunicipalPoundPoint.Size.y, v.SpawnMunicipalPoundPoint.Size.z, v.SpawnMunicipalPoundPoint.Color.r, v.SpawnMunicipalPoundPoint.Color.g, v.SpawnMunicipalPoundPoint.Color.b, 100, false, true, 2, false, false, false, false)
			end
		end
	end
end)
-- Fin affichage markers

-- Activer le menu quand player dedans
Citizen.CreateThread(function()
	local currentZone = 'garage'
	while true do

		Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false

		for _,v in pairs(Config.Garages) do
			if(GetDistanceBetweenCoords(coords, v.SpawnPoint.Pos.x, v.SpawnPoint.Pos.y, v.SpawnPoint.Pos.z, true) < v.Size.x) then
				isInMarker  = true
				this_Garage = v
				currentZone = 'spawn'
			end

			if(GetDistanceBetweenCoords(coords, v.DeletePoint.Pos.x, v.DeletePoint.Pos.y, v.DeletePoint.Pos.z, true) < v.Size.x) then
				isInMarker  = true
				this_Garage = v
				currentZone = 'delete'
			end
			if(GetDistanceBetweenCoords(coords, v.MunicipalPoundPoint.Pos.x, v.MunicipalPoundPoint.Pos.y, v.MunicipalPoundPoint.Pos.z, true) < v.MunicipalPoundPoint.Size.x) then
				isInMarker  = true
				this_Garage = v
				currentZone = 'pound'
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			LastZone                = currentZone
			TriggerEvent('eden_garage:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('eden_garage:hasExitedMarker', LastZone)
		end

	end
end)


-- Fin activer le menu fourriere quand player dedans

-- Controle touche
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		if CurrentAction ~= nil then

			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlJustReleased(0, 38) then

				if CurrentAction == 'pound_action_menu' then
					OpenMenuGarage('pound')
				end
				if CurrentAction == 'spawn' then
					OpenMenuGarage('spawn')
				end
				if CurrentAction == 'delete' then
					OpenMenuGarage('delete')
				end


				CurrentAction = nil
			end
		end
	end
end)
-- Fin controle touche
