local isOn	=	false

RegisterCommand("neon", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--left
        if isOn then
            SetVehicleNeonLightEnabled(veh, 0, false)
            SetVehicleNeonLightEnabled(veh, 1, false)
            SetVehicleNeonLightEnabled(veh, 2, false)
            SetVehicleNeonLightEnabled(veh, 3, false)
			
			isOn = false
        else
            SetVehicleNeonLightEnabled(veh, 0, true)
            SetVehicleNeonLightEnabled(veh, 1, true)
            SetVehicleNeonLightEnabled(veh, 2, true)
            SetVehicleNeonLightEnabled(veh, 3, true)
			
			isOn = true
        end
    end
end, false)

RegisterCommand("neonleft", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--left
        if IsVehicleNeonLightEnabled(veh, 0) then
            SetVehicleNeonLightEnabled(veh, 0, false)
        else
            SetVehicleNeonLightEnabled(veh, 0, true)
			
			isOn = true
        end
    end
end, false)

RegisterCommand("neonright", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--right
        if IsVehicleNeonLightEnabled(veh, 1) then
            SetVehicleNeonLightEnabled(veh, 1, false)
        else
            SetVehicleNeonLightEnabled(veh, 1, true)
			
			isOn = true
        end
    end
end, false)

RegisterCommand("neonfront", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--front
        if IsVehicleNeonLightEnabled(veh, 2) then
            SetVehicleNeonLightEnabled(veh, 2, false)
        else
            SetVehicleNeonLightEnabled(veh, 2, true)
			
			isOn = true
        end
    end
end, false)

RegisterCommand("neonback", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--back
        if IsVehicleNeonLightEnabled(veh, 3) then
            SetVehicleNeonLightEnabled(veh, 3, false)
        else
            SetVehicleNeonLightEnabled(veh, 3, true)
			
			isOn = true
        end
    end
end, false)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', "/neon", "turn neons on/off or try /neonfront etc")
end)