ESX = nil
local isBusy = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterCommand("clean", function(source, args, raw)
    local playerPed = PlayerPedId()
    local vehicle   = ESX.Game.GetVehicleInDirection()
    local coords    = GetEntityCoords(playerPed)

    if IsPedSittingInAnyVehicle(playerPed) then
        ESX.ShowNotification(('cannot clean while inside vehicle'))
        ClearPedTasksImmediately(playerPed)
        return
    end

    if DoesEntityExist(vehicle) then
        isBusy = true
        TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
        Citizen.CreateThread(function()
            Citizen.Wait(10000)

            local dirt = GetVehicleDirtLevel(vehicle)

            if dirt > 50 then
                SetVehicleDirtLevel(vehicle, 50)
                ClearPedTasksImmediately(playerPed)
            end

            if dirt <= 50 then
                SetVehicleDirtLevel(vehicle, 0)
                ClearPedTasksImmediately(playerPed)
            end

            ESX.ShowNotification(('You have washed this vehicles'))
            isBusy = false
        end)
    else
        ESX.ShowNotification(('No vehicles nearby'))
    end
end)

RegisterCommand("lean", function(source, args, raw)
    local playerPed = PlayerPedId()

    if IsPedSittingInAnyVehicle(playerPed) then
        ESX.ShowNotification(('cannot lean while inside vehicle'))
        ClearPedTasksImmediately(playerPed)
        return
    end

    TaskStartScenarioInPlace(playerPed, 'world_human_leaning', 0, false)
end)
