local commanduse = true -- allow use of /flash command
local minDelay = 300 -- min random delay
local maxDelay = 1000 -- max random delay
local maxFlash = 5 -- how many flashes before delay kicks in before next pattern


local flashing = false
local inveh = false
local sirenon = false
local vehicle = nil
local count = 0

RegisterCommand('fl', function(source, args)
    if commanduse then
        if flashing == true then
            flashing = false
        else
            flashing = true
        end
    end
end)

function flash(vehicle)
    --SetVehicleLights(vehicle,2) -- on
    --SetVehicleLights(vehicle,0) -- default
    if sirenon or flashing then
        while count < maxFlash and sirenon or flashing do
            SetVehicleLights(vehicle,2)
            Wait(50)
            SetVehicleLights(vehicle,0)
            Wait(50)
            count = count + 1
        end
        Wait(math.random(minDelay,maxDelay)) -- random delay
        count = 0 
    end
end

Citizen.CreateThread(function()
    while true do
        Wait(minDelay/2)
        sirenon = IsVehicleSirenOn(vehicle)
        inveh = IsPedInAnyVehicle(GetPlayerPed(-1), false )
        if inveh then
            vehicle = GetVehiclePedIsIn(GetPlayerPed(-1),false)
            flash(vehicle)
        end
    end
end)