--[[-------------------------------------------------------------------------
    Author: Lucifer
    Last Edit: 13/10/2019
    Description: Simple locking system made for SOSAY Nation
    Notes: You cannot release or remove this text, enjoy!
--]]-------------------------------------------------------------------------

--[[

    -- You will have to implement this into your garage and vehicle shop menu when it creates the vehicle with CreateVehicle, use the variable that native is assigned to, instead of "veh"
    
    local vehNet = NetworkGetNetworkIdFromEntity(veh)
    local plate = GetVehicleNumberPlateText(veh)
    TriggerServerEvent("SOSAY_Locking:GiveKeys", vehNet, plate)

]]

ESX = nil -- dont touch

---------------------------------------------------------------------------
-- Commands
---------------------------------------------------------------------------
RegisterCommand("givekeys", function(source, args, raw)
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, false)
    local veh = GetClosestVehicle(plyCoords.x, plyCoords.y, plyCoords.z, 10.0, 0, 70)
    local vehNet = NetworkGetNetworkIdFromEntity(veh)
    local plate = GetVehicleNumberPlateText(veh)
    local player, distance = GetClosestPlayer()
    if distance ~= -1 and distance < 10 then
        TriggerServerEvent("SOSAY_Locking:GiveKeysToPlayer", GetPlayerServerId(player), vehNet, plate)
    else
        ESX.ShowNotification("~r~No nearby player found!")
    end
end)

---------------------------------------------------------------------------
-- Threads
---------------------------------------------------------------------------
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while true do

        local ply = PlayerPedId()
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(ply)) then
            local veh = GetVehiclePedIsTryingToEnter(ply)
            local isLocked = GetVehicleDoorLockStatus(veh)
            if isLocked == 7 then -- Prevent people from pulling AI out of there vehicles, if not wanted, comment it out.
                SetVehicleDoorsLocked(veh, 2)
            end

            if isLocked == 4 then -- Lock default parked cars 50%
                ClearPedTasks(ply)
            end

            local aiPed = GetPedInVehicleSeat(veh, -1)
            if aiPed then
                SetPedCanBeDraggedOut(aiPed, false)
            end
        end
        
        if IsControlJustPressed(0, 303) and GetLastInputMethod(0) then
            local insideVeh = IsPedInAnyVehicle(ply, false)

            if insideVeh == 1 then
                local veh = GetVehiclePedIsIn(ply, false)
                local isLocked = GetVehicleDoorLockStatus(veh)
                if isLocked == 0 then
                    SetVehicleDoorsLocked(veh, 2)
                elseif isLocked == 1 then
                    SetVehicleDoorsLocked(veh, 2)
                elseif isLocked == 5 then
                    SetVehicleDoorsLocked(veh, 2)
                else
                    SetVehicleDoorsLocked(veh, 0)
                end
            else
                local inFront = GetVehicleInFront()
                if inFront ~= 0 then
                    local vehNet = NetworkGetNetworkIdFromEntity(inFront)
                    local plate = GetVehicleNumberPlateText(inFront)
                    if vehNet ~= 0 then
                        TriggerServerEvent("SOSAY_Locking:CheckOwnership", vehNet, plate)
                    end
                end
            end
        end
        Wait(0)
    end
end)

---------------------------------------------------------------------------
-- Toggle vehicle lock from outside vehicle
---------------------------------------------------------------------------
RegisterNetEvent("SOSAY_Locking:ToggleOutsideLock")
AddEventHandler("SOSAY_Locking:ToggleOutsideLock", function(vehNet, hasKeys)
    if hasKeys then
        local veh = NetworkGetEntityFromNetworkId(vehNet)
        local isLocked = GetVehicleDoorLockStatus(veh)
        if isLocked == 0 then
            --ESX.ShowNotification("Vehicle ~r~locked")
            exports['mythic_notify']:SendAlert('error', 'Locked')
            lockAnimation()
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "lock", 0.2)
            SetVehicleDoorsLocked(veh, 2)
            SetVehicleLights(veh, 2)
            Wait(200)
            SetVehicleLights(veh, 0)
        elseif isLocked == 1 then
            --ESX.ShowNotification("Vehicle ~r~locked")
            exports['mythic_notify']:SendAlert('error', 'Locked')
            lockAnimation()
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "lock", 0.2)
            SetVehicleDoorsLocked(veh, 2)
            SetVehicleLights(veh, 2)
            Wait(200)
            SetVehicleLights(veh, 0)
        elseif isLocked == 5 then
            exports['mythic_notify']:SendAlert('error', 'Locked')
			--ESX.ShowNotification("Vehicle ~r~locked")
            lockAnimation()
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "lock", 0.2)
            SetVehicleDoorsLocked(veh, 2)
            SetVehicleLights(veh, 2)
            Wait(200)
            SetVehicleLights(veh, 0)
        else
            --ESX.ShowNotification("Vehicle ~g~unlocked")
            exports['mythic_notify']:SendAlert('Success', 'Unlocked')
            lockAnimation()
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "unlock", 0.2)
            SetVehicleDoorsLocked(veh, 0)
            SetVehicleLights(veh, 2)
            Wait(200)
            SetVehicleLights(veh, 0)
        end
    else
     --  ESX.ShowNotification("~r~You don't have the keys to this vehicle!")
    end
end)

---------------------------------------------------------------------------
-- Handle ESX Above Mini-Map notification from server side
---------------------------------------------------------------------------
RegisterNetEvent("SOSAY_Locking:ESX_Notification")
AddEventHandler("SOSAY_Locking:ESX_Notification", function(message)
    ESX.ShowNotification(message)
end)

---------------------------------------------------------------------------
-- Functions
---------------------------------------------------------------------------

-- Unlocking/Locking vehicle animation
function lockAnimation()
    local ply = PlayerPedId()
    RequestAnimDict("anim@heists@keycard@")
    while not HasAnimDictLoaded("anim@heists@keycard@") do
        Wait(0)
    end
    TaskPlayAnim(ply, "anim@heists@keycard@", "exit", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
    Wait(800)
    ClearPedTasks(ply)
end

-- Get Closest Player
function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = PlayerPedId()
	local plyCoords = GetEntityCoords(ply, 0)

	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end

	return closestPlayer, closestDistance
end

function GetPlayers()
    local players = {}

    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

-- Get Closest and Vehicle In Front of you-
function GetVehicleInFront()
	local plyCoords = GetEntityCoords(GetPlayerPed(PlayerId()), false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 5.0, 0.0)
	local rayHandle = StartShapeTestCapsule(plyCoords.x, plyCoords.y, plyCoords.z, plyOffset.x, plyOffset.y, plyOffset.z, 1.0, 10, GetPlayerPed(PlayerId()), 7)
	local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
	return vehicle
end

function GetClosestVeh()
	local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)
    local entityWorld = GetOffsetFromEntityInWorldCoords(ply, 0.0, 20.0, 0.0)
    local rayHandle = CastRayPointToPoint(plyCoords["x"], plyCoords["y"], plyCoords["z"], entityWorld.x, entityWorld.y, entityWorld.z, 10, ply, 0)
    local a, b, c, d, targetVehicle = GetRaycastResult(rayHandle)

    return targetVehicle
end