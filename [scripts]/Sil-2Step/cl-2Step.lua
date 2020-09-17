	--[[
		Antilag & 2-Step Script
			By Silence & Samuel_
		But Client stuff...
	]]
RegisterNetEvent("2step:Anti-lag")
RegisterNetEvent("c_eff_flames")

local activated = false
local antilag = false
local AntilagDisplay = false

AddEventHandler("2step:Anti-lag", function()
	if antilag == false then
		antilag = true
		Notif("~c~Anti-Lag has been ~b~Enabled!")
	else
		antilag = false
		Notif("~c~Anti-Lag has been ~r~Disabled!")
	end
end)

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
		if IsControlPressed(1, Config.twoStepControl) then
			if IsPedInAnyVehicle(ped) then
				local pedVehicle = GetVehiclePedIsIn(ped)
				local pedPos = GetEntityCoords(ped)
				local vehiclePos = GetEntityCoords(pedVehicle)
				local RPM = GetVehicleCurrentRpm(GetVehiclePedIsIn(GetPlayerPed(-1)))

				if GetPedInVehicleSeat(pedVehicle, -1) == ped then
					local vehicleModel = GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1)))
					local BackFireDelay = (math.random(100, 500))
					if RPM > 0.3 and RPM < 0.5 then
						for _,cars in pairs(Config.TwoStepCars) do
							if GetHashKey(cars) == vehicleModel then
								DrawHudText("|", {255, 0, 0,255},0.955,0.8825,0.7,0.7,7)
								TriggerServerEvent("eff_flames", VehToNet(pedVehicle))
								AddExplosion(vehiclePos.x, vehiclePos.y, vehiclePos.z, 61, 0.0, true, true, 0.0, true)
								activated = true
							  Wait(BackFireDelay)
							end
						end
					else 
						activated = false
					end
				end
			else
				activated = false
			end
		else
			activated = false
			if not IsControlPressed(1, 71) and not IsControlPressed(1, 72) then
				if antilag == true then
					if IsPedInAnyVehicle(ped) then
						local pedVehicle = GetVehiclePedIsIn(ped)
						local pedPos = GetEntityCoords(ped)
						local vehiclePos = GetEntityCoords(pedVehicle)
						local RPM = GetVehicleCurrentRpm(GetVehiclePedIsIn(GetPlayerPed(-1)))
						local AntiLagDelay = (math.random(25, 200))
						if GetPedInVehicleSeat(pedVehicle, -1) == ped then
							if RPM > 0.75 then
								for _,cars in pairs(Config.TwoStepCars) do
									local vehicleModel = GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1)))
									if GetHashKey(cars) == vehicleModel then
										DrawHudText("|", {255, 0, 0,255},0.955,0.8825,0.7,0.7,7)
										TriggerServerEvent("eff_flames", VehToNet(pedVehicle))
										AddExplosion(vehiclePos.x, vehiclePos.y, vehiclePos.z, 61, 0.0, true, true, 0.0, true)
										SetVehicleTurboPressure(pedVehicle, 25)
										AntilagDisplay = true
									  Wait(AntiLagDelay)
									end
								end
							else
								AntilagDisplay = false
							end
						end
					else
						AntilagDisplay = false
						antilag = false
					end
				end
			else 
				AntilagDisplay = false
			end
		end
		if IsControlJustReleased(1, Config.twoStepControl) then
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				SetVehicleTurboPressure(pedVehicle, 25)
			end
		end
	  Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		if activated == true then
			DrawHudText("2Step", {0, 255, 85,255},0.92,0.88,0.7,0.7,6)
		end
		if AntilagDisplay == true then
			DrawHudText("Anti-Lag", {0, 255, 85,255},0.92,0.88,0.7,0.7,6)
		end
	  Wait(0)
	end
end)

p_flame_location = {
	"exhaust",
	"exhaust_2",
	"exhaust_3",
	"exhaust_4"	
}
p_flame_particle = "veh_backfire"
p_flame_particle_asset = "core" 
p_flame_size = 2.4

AddEventHandler("c_eff_flames", function(c_veh)
	for _,bones in pairs(p_flame_location) do
		UseParticleFxAssetNextCall(p_flame_particle_asset)
		createdPart = StartParticleFxLoopedOnEntityBone(p_flame_particle, NetToVeh(c_veh), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetEntityBoneIndexByName(NetToVeh(c_veh), bones), p_flame_size, 0.0, 0.0, 0.0)
		StopParticleFxLooped(createdPart, 1)
	end
end)

function DrawHudText(text,colour,coordsx,coordsy,scalex,scaley, font)
    SetTextFont(font)
    SetTextProportional(7)
    SetTextScale(scalex, scaley)
    local colourr,colourg,colourb,coloura = table.unpack(colour)
    SetTextColour(colourr,colourg,colourb, coloura)
    SetTextDropshadow(0, 0, 0, 0, 0)
    SetTextEdge(0, 0, 0, 0, 0)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(coordsx,coordsy)
end

function Notif( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end