 RegisterCommand("engine", function()
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(ped, false)

    if IsPedInAnyVehicle(ped, true) then
        if IsVehicleEngineOn(vehicle) then
            SetVehicleEngineOn(vehicle, false, false, true)
            SetVehicleUndriveable(vehicle, true)
        else
            SetVehicleEngineOn(vehicle, true, false, true)
            SetVehicleUndriveable(vehicle, false)
        end
    end
end, false)

RegisterCommand("smoke", function()
    local ped = GetPlayerPed(-1)

    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", -1, 1)
end, false)

RegisterCommand("dance1", function()
    local ped = GetPlayerPed(-1)

    local dict = "anim@mp_player_intcelebrationfemale@raise_the_roof"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end

    TaskPlayAnim(ped, dict, "raise_the_roof", 8.0, -8.0, -1, 49, 0, false, false, false)
end, false)

RegisterCommand("dance2", function()
    local ped = GetPlayerPed(-1)

    local dict = "misschinese2_crystalmazemcs1_cs"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    
    TaskPlayAnim(ped, dict, "dance_loop_tao", 8.0, -8.0, -1, 49, 0, false, false, false)
end, false)

RegisterCommand("cross", function()
    local ped = GetPlayerPed(-1)

    local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end

    TaskPlayAnim(ped, dict, "base", 8.0, -8.0, -1, 49, 0, false, false, false)
end, false)

RegisterCommand("ayy", function()
    local ped = GetPlayerPed(-1)

    local dict = "anim@mp_player_intincarthumbs_upbodhi@ps@"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end

    TaskPlayAnim(ped, dict, "enter", 8.0, -8.0, -1, 49, 0, false, false, false)
end, false)

RegisterCommand("up", function()
    local ped = GetPlayerPed(-1)

    local dict = "mp_player_int_upperfinger"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end

end, false)

RegisterCommand("wank", function()
    local ped = GetPlayerPed(-1)

    local dict = "mp_player_int_upperwank"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    
    TaskPlayAnim(ped, dict, "mp_player_int_wank_01", 8.0, -8.0, -1, 49, 0, false, false, false)
end, false)