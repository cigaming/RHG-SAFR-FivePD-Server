ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer 
end)

local particleDict = "scr_indep_fireworks"
local AnimationDict = "anim@mp_fireworks"

RegisterNetEvent('fireworks:box')
AddEventHandler('fireworks:box', function()
	local ply = PlayerPedId()
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ply, 0.0, 0.5, -1.02))

	RequestAnimDict('anim@mp_fireworks')
	while not HasAnimDictLoaded('anim@mp_fireworks') do
		Wait(1)
	end
	TaskPlayAnim(ply, 'anim@mp_fireworks', 'place_firework_3_box', 8.0, -1, -1, 0, 0, 0, 0, 0)

	Wait(1250)
	ClearPedSecondaryTask(ply)

	local objectName = GetHashKey("ind_prop_firework_03")
	local prop = CreateObject(objectName, x, y, z, true, false, true)
	SetEntityHeading(prop, GetEntityHeading(ply))
	PlaceObjectOnGroundProperly(prop)

	ESX.ShowNotification("Fuse Lit Stand Clear ~r~(9s)")

	Wait(9000)
	TriggerServerEvent("syncbad4", x, y, z)

	Wait(18000)
	DeleteObject(prop)
end)
RegisterNetEvent("syncbad_cl4")
AddEventHandler("syncbad_cl4", function(x, y, z)
    RequestNamedPtfxAsset(particleDict)
    while not HasNamedPtfxAssetLoaded(particleDict) do
        Wait(1)
	end
	
	UseParticleFxAssetNextCall(particleDict)
	local particle = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle2 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle3 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle4 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle5 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle6 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle7 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle8 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(4000)
	UseParticleFxAssetNextCall(particleDict)
	local particle9 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 1.8, false, false, false, false)
end)

RegisterNetEvent('fireworks:cone')
AddEventHandler('fireworks:cone', function()
	local ply = PlayerPedId()
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ply, 0.0, 0.5, -1.02))

	RequestAnimDict('anim@mp_fireworks')
	while not HasAnimDictLoaded('anim@mp_fireworks') do
		Wait(1)
	end
	TaskPlayAnim(ply, 'anim@mp_fireworks', 'place_firework_4_cone', 8.0, -1, -1, 0, 0, 0, 0, 0)

	Wait(1250)
	ClearPedSecondaryTask(ply)

	local objectName = GetHashKey("ind_prop_firework_04")
	local prop = CreateObject(objectName, x, y, z, true, false, true)
	SetEntityHeading(prop, GetEntityHeading(ply))
	PlaceObjectOnGroundProperly(prop)

	ESX.ShowNotification("Fuse Lit Stand Clear ~r~(9s)")

	Wait(9000)
	TriggerServerEvent("syncbad3", x, y, z)
	
	Wait(18000)
	DeleteObject(prop)
end)
RegisterNetEvent("syncbad_cl3")
AddEventHandler("syncbad_cl3", function(x, y, z)
    RequestNamedPtfxAsset(particleDict)
    while not HasNamedPtfxAssetLoaded(particleDict) do
        Wait(1)
	end
	
	UseParticleFxAssetNextCall(particleDict)
	local particle = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle2 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle3 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle4 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle5 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(2500)
	UseParticleFxAssetNextCall(particleDict)
	local particle6 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
end)

RegisterNetEvent('fireworks:cylinder')
AddEventHandler('fireworks:cylinder', function()
	local ply = PlayerPedId()
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ply, 0.0, 0.5, -1.02))

	RequestAnimDict('anim@mp_fireworks')
	while not HasAnimDictLoaded('anim@mp_fireworks') do
		Wait(1)
	end
	TaskPlayAnim(ply, 'anim@mp_fireworks', 'place_firework_2_cylinder', 8.0, -1, -1, 0, 0, 0, 0, 0)

	Wait(1250)
	ClearPedSecondaryTask(ply)

	local objectName = GetHashKey("ind_prop_firework_02")
	local prop = CreateObject(objectName, x, y, z, true, false, true)
	SetEntityHeading(prop, GetEntityHeading(ply))
	PlaceObjectOnGroundProperly(prop)

	ESX.ShowNotification("Fuse Lit Stand Clear ~r~(9s)")

	Wait(9000)
	TriggerServerEvent("syncbad2", x, y, z)
		
	Wait(18000)
	DeleteObject(prop)
end)
RegisterNetEvent("syncbad_cl2")
AddEventHandler("syncbad_cl2", function(x, y, z)
    RequestNamedPtfxAsset(particleDict)
    while not HasNamedPtfxAssetLoaded(particleDict) do
        Wait(1)
	end
	
	UseParticleFxAssetNextCall(particleDict)
	local particle = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle2 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle3 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle4 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(particleDict)
	local particle5 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(2500)
	UseParticleFxAssetNextCall(particleDict)
	local particle6 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
	Wait(2500)
	UseParticleFxAssetNextCall(particleDict)
	local particle7 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
	Wait(2500)
	UseParticleFxAssetNextCall(particleDict)
	local particle8 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
end)

RegisterNetEvent('fireworks:rocket')
AddEventHandler('fireworks:rocket', function()
	local ply = PlayerPedId()
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ply, 0.0, 0.5, -1.02))

	RequestAnimDict('anim@mp_fireworks')
	while not HasAnimDictLoaded('anim@mp_fireworks') do
		Wait(1)
	end
	TaskPlayAnim(ply, 'anim@mp_fireworks', 'place_firework_1_rocket', 8.0, -1, -1, 0, 0, 0, 0, 0)

	Wait(1250)
	ClearPedSecondaryTask(ply)

	local objectName = GetHashKey("ind_prop_firework_01")
	local prop = CreateObject(objectName, x, y, z, true, false, true)
	SetEntityHeading(prop, GetEntityHeading(ply))
	PlaceObjectOnGroundProperly(prop)

	ESX.ShowNotification("Fuse Lit Stand Clear ~r~(9s)")

	Wait(9000)
	TriggerServerEvent("syncbad1", x, y, z)

	local veh = GetClosestVehicle(x,y,z, 100.0, 0, 70)
	SetVehicleAlarm(veh, true)	
	SetVehicleAlarmTimeLeft(veh, 8000)

	Wait(8500)
	DeleteObject(prop)
end)
RegisterNetEvent("syncbad_cl1")
AddEventHandler("syncbad_cl1", function(x, y, z)
    RequestNamedPtfxAsset(particleDict)
    while not HasNamedPtfxAssetLoaded(particleDict) do
        Wait(1)
    end
    UseParticleFxAssetNextCall(particleDict)
    StartParticleFxNonLoopedAtCoord("scr_indep_firework_starburst", x, y, z, 0.0, 0.0, 0.0, 2.5, false, false, false, false)
end)