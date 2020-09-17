local menu = false
ESX = nil

function getVehData(veh)
    if not DoesEntityExist(veh) then return nil end
    local lvehstats = {
        boost = GetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveForce"),
        fuelmix = GetVehicleHandlingFloat(veh, "CHandlingData", "fDriveInertia"),
        braking = GetVehicleHandlingFloat(veh ,"CHandlingData", "fBrakeBiasFront"),
        drivetrain = GetVehicleHandlingFloat(veh, "CHandlingData", "fDriveBiasFront"),
        brakeforce = GetVehicleHandlingFloat(veh, "CHandlingData", "fBrakeForce")
    }
    return lvehstats
end

function setVehData(veh,data)
    if not DoesEntityExist(veh) or not data then return nil end
    SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveForce", data.boost*1.0)
    SetVehicleHandlingFloat(veh, "CHandlingData", "fDriveInertia", data.fuelmix*1.0)
    SetVehicleEnginePowerMultiplier(veh, data.gearchange*1.0)
    SetVehicleHandlingFloat(veh, "CHandlingData", "fBrakeBiasFront", data.braking*1.0)
    SetVehicleHandlingFloat(veh, "CHandlingData", "fDriveBiasFront", data.drivetrain*1.0)
    SetVehicleHandlingFloat(veh, "CHandlingData", "fBrakeForce", data.brakeforce*1.0)
end

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function toggleMenu(b,send)
    menu = b
    SetNuiFocus(b,b)
    local vehData = getVehData(GetVehiclePedIsIn(GetPlayerPed(-1),false))
    if send then SendNUIMessage(({type = "togglemenu", state = b, data = vehData})) end
end

RegisterNUICallback("togglemenu",function(data,cb)
    toggleMenu(data.state,false)
end)

RegisterNUICallback("save",function(data,cb)
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
    if not IsPedInAnyVehicle(GetPlayerPed(-1)) or GetPedInVehicleSeat(veh, -1)~=GetPlayerPed(-1) then return end
    setVehData(veh,data)
end)

RegisterNetEvent("tuning:useLaptop")
AddEventHandler("tuning:useLaptop", function()
    if not menu then
        TriggerServerEvent("tuning:removeItem")
        local ped = GetPlayerPed(-1)
        toggleMenu(true,true)
        while IsPedInAnyVehicle(ped, false) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped, false), -1)==ped do
            Citizen.Wait(100)
        end
        toggleMenu(false,true)
    else
        return
    end
end)

RegisterNetEvent("tuning:closeMenu")
AddEventHandler("tuning:closeMenu",function()
    toggleMenu(false,true)
end)