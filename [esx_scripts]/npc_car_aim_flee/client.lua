ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    local lastent = nil
    local lastveh = nil
    while true do
        Citizen.Wait(0)
        local pid = PlayerId()
        local foundaiment, aiment = GetEntityPlayerIsFreeAimingAt(pid)
        if IsPlayerFreeAiming(pid) and foundaiment and (lastent~=aiment or IsPedInAnyVehicle(aiment, false)) and (Config.car_aim_flee_range==0 or GetDistanceBetweenCoords(GetEntityCoords(aiment), GetEntityCoords(GetPlayerPed(-1)), false)<=Config.car_aim_flee_range) then
            lastent=aiment
            -- local x,y,z = table.unpack(GetEntityCoords(aiment))
            -- DrawBox(x+1,y+1,z+1,x-1,y-1,z-1, 0, 255, 0, 200)
            local vehicle = GetVehiclePedIsIn(aiment, false)
            lastveh = vehicle
            if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) and DoesEntityExist(aiment) and IsEntityAPed(aiment) and not IsPedAPlayer(aiment) then
                SetPedFleeAttributes(aiment, 0, 0)
                SetVehicleHandbrake(vehicle, true)
                TaskLeaveVehicle(aiment, vehicle, 4160)
                while IsPedInAnyVehicle(aiment,false) do Citizen.Wait(250); TaskLeaveVehicle(aiment, vehicle, 4160) end
                SetVehicleCanBeUsedByFleeingPeds(vehicle, false)
                ResetPedLastVehicle(aiment)
                if math.random()<=Config.give_key_chance/100 then
                    ESX.ShowNotification(Config.give_key_msg)
                    SetVehicleDoorsLockedForPlayer(vehicle, GetPlayerPed(-1), false)
                    SetVehicleHandbrake(vehicle, false)
                end
                TriggerServerEvent("keys:checkMoneyDrop")
                TaskReactAndFleePed(aiment,GetPlayerPed(-1))
            end
        end
    end
end)