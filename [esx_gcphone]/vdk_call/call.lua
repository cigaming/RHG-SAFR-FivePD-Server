local callActive = false
local haveTarget = false
local work
local target = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        -- if IsControlJustPressed(1, 56) then
        --     local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
        --     TriggerServerEvent("call:makeCall", "uber", {x=plyPos.x,y=plyPos.y,z=plyPos.z})
        -- end

        -- Press X key to get the call
        if IsControlJustPressed(1, 73) and callActive then
            TriggerServerEvent("call:getCall", work)
            SendNotification("~g~You took the call")
            target.blip = AddBlipForCoord(target.pos.x, target.pos.y, target.pos.z)
            SetBlipRoute(target.blip, true)
            haveTarget = true
            callActive = false
        -- Press N key to declie the call
        elseif IsControlJustPressed(1, 249) and callActive then
            SendNotification("~r~You refused the call")
            callActive = false
        end
        if haveTarget then
            DrawMarker(1, target.pos.x, target.pos.y, target.pos.z, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
            local playerPos = GetEntityCoords(GetPlayerPed(-1), true)
            if Vdist(target.pos.x, target.pos.y, target.pos.z, playerPos.x, playerPos.y, playerPos.z) < 2.0 then
                RemoveBlip(target.blip)
                haveTarget = false
            end
        end
    end
end)

RegisterNetEvent("call:callIncoming")
AddEventHandler("call:callIncoming", function(job, pos)
    callActive = true
    work = job
    target.pos = pos
    SendNotification("Press ~g~X~s~ to take the call or ~g~N~s~ to refuse")
end)

RegisterNetEvent("call:taken")
AddEventHandler("call:taken", function()
    callActive = false
    SendNotification("The call was made")
end)

RegisterNetEvent("target:call:taken")
AddEventHandler("target:call:taken", function(taken)
    if taken == 1 then
        SendNotification("Someone comes.")
    elseif taken == 0 then
        SendNotification("Nobody will come, sorry ...")
    elseif taken == 2 then
        SendNotification("Please remember in a few moments")
    end
end)

-- If player disconnect, remove him from the inService server table
AddEventHandler('playerDropped', function()
	TriggerServerEvent("player:serviceOff", nil)
end)

function SendNotification(message)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(false, false)
end