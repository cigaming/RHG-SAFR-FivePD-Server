RegisterCommand("aitow", function(source, args) 														--Change "tow" value to change activation command.
    TriggerEvent("knb:tow")													
end, false)

AddEventHandler("knb:tow", function()
	player = GetPlayerPed(-1)
	playerPos = GetEntityCoords(player)
	
	local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(player, 0.0, 5.0, 0.0)
	
	local targetVeh = GetTargetVehicle(player, inFrontOfPlayer)
	
	GetTowTruck(targetVeh)
	GetTowDriver()
	
	local driverhash = GetHashKey(towTruckDriverPick.ped)
	RequestModel(driverhash)
	local truckhash = GetHashKey(towTruckModelsPick.model)
	RequestModel(truckhash)

	loadAnimDict("random@arrests")
	
	while not HasModelLoaded(driverhash) and RequestModel(driverhash) or not HasModelLoaded(truckhash) and RequestModel(truckhash) do
		RequestModel(driverhash)
		RequestModel(truckhash)
		Citizen.Wait(0)
	end
	
	if DoesEntityExist(targetVeh) then
		if DoesEntityExist(towTruck) then
			DeleteTowTruck(towTruck, towTruckDriver)
			SpawnTowTruck(playerPos.x, playerPos.y, playerPos.x, truckhash, driverhash)
		else
			SpawnTowTruck(playerPos.x, playerPos.y, playerPos.x, truckhash, driverhash)
		end
		playRadioAnim(player)
		GoToTarget(GetEntityCoords(targetVeh).x, GetEntityCoords(targetVeh).y, GetEntityCoords(targetVeh).z, towTruck, towTruckDriver, truckhash, targetVeh)
	end
end)

function SpawnTowTruck(x, y, z, truckhash, driverhash)												--Spawning Function
	local found, spawnPos, spawnHeading = GetClosestVehicleNodeWithHeading(x + math.random(-spawnRadius, spawnRadius), y + math.random(-spawnRadius, spawnRadius), z, 0, 3, 0)
	
	if found and HasModelLoaded(truckhash) and HasModelLoaded(truckhash) then
		towTruck = CreateVehicle(truckhash, spawnPos, spawnHeading, true, false)					--Truck Spawning.
		ClearAreaOfVehicles(GetEntityCoords(towTruck), 5000, false, false, false, false, false);  
		SetVehicleOnGroundProperly(towTruck)
		SetVehicleColours(towTruck, towTruckDriverPick.colour, towTruckDriverPick.colour)
		
		towTruckDriver = CreatePedInsideVehicle(towTruck, 26, driverhash, -1, true, false)			--Driver Spawning.
		
		towTruckBlip = AddBlipForEntity(towTruck)													--Blip Spawning.
		SetBlipFlashes(towTruckBlip, true)
		SetBlipColour(towTruckBlip, 29)
	end
end

function DeleteTowTruck(towTruck, towTruckDriver)
	SetEntityAsMissionEntity(towTruck, false, false)												--Truck Removal
	DeleteEntity(towTruck)
	SetEntityAsMissionEntity(towTruckDriver, false, false)											--Driver Removal
	DeleteEntity(towTruckDriver)
	RemoveBlip(towTruckBlip)																		--Blip Removal
end

function GoToTarget(x, y, z, truck, driver, truckhash, car)
	TaskVehicleDriveToCoord(driver, truck, x, y, z, 17.0, 0, truckhash, drivingStyle, 1, true)
	ShowAdvancedNotification(companyIcon, companyName, "Tow Truck Dispatched", "A tow truck has been dispatched to your location. Thanks for using ~y~" .. companyName)
	enroute = true
	while enroute == true do
		Citizen.Wait(500)
		distanceToTarget = GetDistanceBetweenCoords(GetEntityCoords(car), GetEntityCoords(truck).x, GetEntityCoords(truck).y, GetEntityCoords(truck).z, false)
		if distanceToTarget < 15 then
			TaskVehicleTempAction(driver, truck, 27, -1)
			SetVehicleDoorOpen(truck, 2, false, false)
			SetVehicleDoorOpen(truck, 3, false, false)
		elseif distanceToTarget < 20 then
			Citizen.Wait(5000)
			PickupTarget(truck, driver, car)
		end
	end
end

function PickupTarget(truck, driver, car)
	enroute = false
	AttachEntityToEntity(car, truck, 20, towTruckModelsPick.offset.x, towTruckModelsPick.offset.y, towTruckModelsPick.offset.z, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
	ShowAdvancedNotification(towTruckDriverPick.icon, towTruckDriverPick.name, "Vehicle Towed" , towTruckDriverPick[1][math.random(#towTruckDriverPick[1])])
	Citizen.Wait(5000)
	SetVehicleDoorsShut(truck, false)
	StartVehicleHorn(truck, 100, 0, false)
	TaskVehicleDriveWander(driver, truck, 17.0, drivingStyle)
	SetEntityAsNoLongerNeeded(car)
	SetEntityAsNoLongerNeeded(truck)
	SetPedAsNoLongerNeeded(driver)
	RemoveBlip(towTruckBlip)
	towTruck = nil
	towTruckDriver = nil
	targetVeh = nil
end

function GetTargetVehicle(player, dir)
	if IsPedSittingInAnyVehicle(player) then 
        towedVehicle = GetVehiclePedIsIn(player, false)
	else
		towedVehicle = GetVehicleInDirection(GetEntityCoords(player), dir)
	end
	
	if DoesEntityExist(towedVehicle) then
		return towedVehicle
	else
		ShowNotification("Failed to find a vehicle.")
	end
end

function GetTowTruck(vehicle)
	targetVehClass = GetVehicleClass(vehicle)
	if targetVehClass == 13 or targetVehClass == 8 then
		towTruckModelsPick = towTruckModels.boxtrucks
	else
		towTruckModelsPick = towTruckModels.flatbeds
	end
end

function GetTowDriver()
	towTruckDriverPick = towTruckDrivers[math.random(#towTruckDrivers)]
end

function GetVehicleInDirection(coordFrom, coordTo)
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
    local _, _, _, _, vehicle = GetRaycastResult(rayHandle)
    return vehicle
end

function playRadioAnim(player)
	Citizen.CreateThread(function()
		RequestAnimDict(arrests)
	    TaskPlayAnim(player, "random@arrests", "generic_radio_enter", 1.5, 2.0, -1, 50, 2.0, 0, 0, 0 )
		Citizen.Wait(6000)
		ClearPedTasks(player)
	end)
end

function ShowAdvancedNotification(icon, sender, title, text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
	SetNotificationMessage(icon, icon, true, 4, sender, title, text)
    DrawNotification(false, true)
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end