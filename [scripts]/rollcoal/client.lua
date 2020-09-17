--## CONFIG
--## CONFIG

local effect_time = 2   -- how long it lasts in seconds

local spam_timer = 0    -- prevent spam ( in minutes )

local SIZE = 0.8        -- size of smoke 

local particleName = "ent_amb_exhaust_thick"    -- smoke thats used more below 

-- [ EFFECTS FOR PARTICLENAME ABOVE ]
-- veh_exhaust_truck_rig [size = 3.0]
-- ent_amb_smoke_general [size = 1.0]
-- ent_amb_generator_smoke [size = 1.0]
-- ent_amb_exhaust_thick [size = 0.8]

carblacklist = {   -- ONLY CARS IN THIS LIST CAN USE THIS SCRIPT 
 
"sandking"  ,
"subwrx" ,
"evo9"  ,
"rass"  ,
"taxi"  ,
"ambulance"  ,
"contender" , 
"raptor12" , 

}

local bone = "exhaust" and "exhaust_1" -- what it comes out of 








--## END OF CONFIG
--## END OF CONFIG









local smoke_ready = true
local particleDict = "core"

local car_net = nil
local vehicle
local ped
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        ped = GetPlayerPed(PlayerId())
        
        if IsPedInAnyVehicle(ped, false) then

            vehicle = GetVehiclePedIsIn(ped, false)
            
            if IsControlJustPressed(0, 21) then
                smoke_ready = false
                checkCar(vehicle)
                timer()
            end
        end
    end
end)
RegisterNetEvent("Smoke:StartParticles")
AddEventHandler("Smoke:StartParticles", function(carid)
    local entity = NetToVeh(carid)
    local part = GetWorldPositionOfEntityBone(entity, bone)
    local rot = GetWorldRotationOfEntityBone(entity, bone)
    local loopAmount = 150
    local particleEffects = {}

    for x=0,loopAmount do

        UseParticleFxAssetNextCall(particleDict)
        local particle = StartParticleFxLoopedOnEntityBone(particleName, entity, part.x, part.y, part.z, rot.x, rot.y, rot.z, GetEntityBoneIndexByName(entity, bone), SIZE, false, false, false)            

        SetParticleFxLoopedEvolution(particle, particleName, SIZE, true)
        table.insert(particleEffects, 1, particle)
        Citizen.Wait(0)
    end
    

    Citizen.Wait(effect_time * 1000)
    for _,particle in pairs(particleEffects) do
        StopParticleFxLooped(particle, true)
    end
end)
function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
        carName = GetDisplayNameFromVehicleModel(carModel)
        
        if isCarBlacklisted(carModel) then
            
            RequestNamedPtfxAsset(particleDict)
            while not HasNamedPtfxAssetLoaded(particleDict) do
                Citizen.Wait(10)
            end
            
            local netid = VehToNet(vehicle)
            SetNetworkIdExistsOnAllMachines(netid, 1)
            NetworkSetNetworkIdDynamic(netid, 0)
            SetNetworkIdCanMigrate(netid, 0)
                
            car_net = netid
            TriggerServerEvent("Smoke:SyncStartParticles", car_net)
		end
	end
end
function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(carblacklist) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end
	return false
end
function timer()
    local timer = spam_timer
    for i = 1, timer do
        Citizen.Wait(60000)
    end
    smoke_ready = true
end