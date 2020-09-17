ESX                           = nil
local ESXLoaded = false

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

    ESXLoaded = true
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterNetEvent('loffe_burglary:setFrozen')
AddEventHandler('loffe_burglary:setFrozen', function(house, status)
    Config.Burglary[house].Door.Frozen = status
    local door = GetClosestObjectOfType(Config.Burglary[house].Door.Coords, 2.0, GetHashKey(Config.Burglary[house].Door.Object), false, 0, 0)
    FreezeEntityPosition(door, status)
end)

RegisterNetEvent('loffe_burglary:setHealth')
AddEventHandler('loffe_burglary:setHealth', function(house, health)
    Config.Burglary[house].Door.Health = health
    local door = GetClosestObjectOfType(Config.Burglary[house].Door.Coords, 2.0, GetHashKey(Config.Burglary[house].Door.Object), false, 0, 0)
    SetEntityHealth(door, health)
end)

RegisterNetEvent('loffe_burglary:text')
AddEventHandler('loffe_burglary:text', function(text, x, y, time)
    drawSub(text, 4, 1, x, y, 0.5, 255, 255, 255, 255, time)
end)

RegisterNetEvent('loffe_burglary:setItems')
AddEventHandler('loffe_burglary:setItems', function(house, furniture, items)
    Config.Burglary[house].MultipleSearch[furniture].Items = items
end)

RegisterNetEvent('loffe_burglary:helpTimed')
AddEventHandler('loffe_burglary:helpTimed', function(text, time)
    local faketimer = time
    while faketimer >= 0 do
        faketimer = faketimer - 1
        Wait(0)
        BeginTextCommandDisplayHelp('STRING')
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandDisplayHelp(0, false, true, -1)
    end
end)

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function drawSub(text,font,centre,x,y,scale,r,g,b,a, time)
	local timesdone = 0
    while timesdone <= time/10 do
        drawTxt(text, font, centre, x, y, scale, r, g, b, a)
		Wait(0)
		timesdone = timesdone + 1
	end
end

Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do
        Wait(0)
    end
    while not ESXLoaded do
        Wait(0)
    end
    Wait(50)
    for i = 1, #Config.Burglary do
        ESX.TriggerServerCallback('loffe_burglary:getDoorFreezeStatus', function(frozen)
            print(frozen)
            Config.Burglary[i].Door.Frozen = frozen
            local door = GetClosestObjectOfType(Config.Burglary[i].Door.Coords, 2.0, GetHashKey(Config.Burglary[i].Door.Object), false, 0, 0)
            FreezeEntityPosition(door, Config.Burglary[i].Door.Frozen)
        end, i)
        ESX.TriggerServerCallback('loffe_burglary:getDoorHealth', function(health)
            Config.Burglary[i].Door.Health = health
            local door = GetClosestObjectOfType(Config.Burglary[i].Door.Coords, 2.0, GetHashKey(Config.Burglary[i].Door.Object), false, 0, 0)
            SetEntityHealth(door, health)
        end, i)
    end
    while true do
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        for i = 1, #Config.Burglary do
            Wait(0)
            local v = Config.Burglary[i]
            local d = v.Door
            local door = GetClosestObjectOfType(d.Coords, 2.0, GetHashKey(d.Object), false, 0, 0)
            if door ~= nil then
                FreezeEntityPosition(door, d.Frozen)
                if d.Frozen then
                    SetEntityHeading(door, d.Heading)
                end
            end
            if GetDistanceBetweenCoords(coords, d.Coords, true) <= 2.0 and d.Frozen then
                TriggerEvent('loffe_burglary:text', 'Break the door, it has '  .. math.floor(d.Health)/10 .. '% health' , 0.5, 0.97, 75)
                if d.Health ~= GetEntityHealth(door) then
                    if GetSelectedPedWeapon(player) == GetHashKey("WEAPON_CROWBAR") or GetHashKey("WEAPON_wrench") or GetHashKey("WEAPON_BAT") or GetHashKey("WEAPON_UNARMED") then
                        TriggerServerEvent('loffe_burglary:setDoorHealth', i, GetEntityHealth(door))
                        if GetEntityHealth(door) <= 0.0 then
                            PoliceRobberyAlert()
			                --TriggerServerEvent('esx_phone:send', 'police', 'Inbrott', true, {x = d.Coords.x, y = d.Coords.y, z = d.Coords.z}, true)
                            if v.Type == 'ghetto' then
                                for j = 1, #v.Peds do
                                    print(j)
                                    local randomPed = Config.GhettoPeds[math.random(1, #Config.GhettoPeds)]
                                    RequestModel(randomPed)
                                    while not HasModelLoaded(randomPed) do
                                        Wait(0)
                                    end
                                    local ped = CreatePed(4, randomPed, v.Peds[j], 0.0, true, false)

                                    local randomWeaponChance = math.random(1, 100)
                                    if randomWeaponChance <= Config.WeaponChance then
                                        local randomWeapon = math.random(1, #Config.GhettoWeapons)
                                        GiveWeaponToPed(ped, GetHashKey(Config.GhettoWeapons[randomWeapon]), math.random(1, 5000), false, true)
                                    end

                                    TaskCombatPed(ped, player, 0, 16)
                                    SetEntityAsMissionEntity(ped, true, true)
                                    SetPedHearingRange(ped, 15.0)
                                    SetPedSeeingRange(ped, 15.0)
                                    SetPedAlertness(ped, 15.0)
                                    SetPedFleeAttributes(ped, 0, 0)
                                    SetPedCombatAttributes(ped, 46, true)
                                    SetPedFleeAttributes(ped, 0, 0)

                                end
                            end
                        end
                    else
                        SetEntityHealth(door, d.Health)
                        TriggerEvent("showNotification", "You have to break the door with a crowbar/wrench !")
                    end
                end
                if GetEntityHealth(door) <= 0.0 then
                    TriggerServerEvent('loffe_burglary:setDoorFreezeStatus', i, false)
                end
            elseif ESX.PlayerData.job.name == 'police' and not d.Frozen and GetDistanceBetweenCoords(coords, d.Coords, true) <= 2.0 then
                TriggerEvent('loffe_burglary:helpTimed', '~INPUT_CONTEXT~ Lock the Door', 25)
                if IsControlPressed(0, 38) then
                    local finished = true
                    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
                    FreezeEntityPosition(PlayerPedId(), true)
                    for i = 1, 256 do
                        TriggerEvent('loffe_burglary:helpTimed', '~INPUT_JUMP~ Stop adding new lock', 250)
                        drawSub('Mounting new lock ~b~' .. i .. '%', 4, 1, 0.5, 0.97, 0.5, 255, 255, 255, 255, 250)
                        if IsControlPressed(0, 22) then
                            ClearPedTasks(PlayerPedId())
                            finished = false
                            break
                        end
                    end
                    FreezeEntityPosition(PlayerPedId(), false)
                    if finished then
                        TriggerServerEvent('loffe_burglary:setDoorFreezeStatus', i, true)
                    end
                    ClearPedTasks(PlayerPedId())
                end
            end
        end
        Wait(50)
    end
end)

Citizen.CreateThread(function()
    while not ESXLoaded do
        Wait(0)
    end
    while true do
        for k, v in pairs(Config.Burglary) do
            for i = 1, #v.MultipleSearch do
                local player = PlayerPedId()
                local coords = GetEntityCoords(player)
                if GetDistanceBetweenCoords(coords, v.MultipleSearch[i].Position, true) <= 1.0 and not v.Door.Frozen then
                    TriggerEvent('loffe_burglary:helpTimed', '~INPUT_CONTEXT~ Search through ' .. v.MultipleSearch[i].Name, 25)
                    if IsControlPressed(0, 38) then
                        local elements = {}
                        for j = 1, v.MultipleSearch[i].Items do
                            table.insert(elements, {label = v.MultipleSearch[i].Text .. ' ' .. j, value = j})
                        end
                        local selected = false
                        ESX.UI.Menu.CloseAll()
                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), '_' .. v.MultipleSearch[i].Name,
                        {
                            title    = v.MultipleSearch[i].Name,
                            align    = 'bottom-right',
                            elements = elements
                        }, function(data, menu)
                            selected = true
                            ESX.UI.Menu.CloseAll()
                        end, function(data, menu)
                            menu.close()
                        end)
                        while not selected do
                            if IsControlPressed(0, 177) then
                                break
                            end
                            Wait(0)
                        end
                        if selected and v.MultipleSearch[i].Items >= 1 and GetDistanceBetweenCoords(GetEntityCoords(player), v.MultipleSearch[i].Position, true) <= 1.0 then
                            TriggerServerEvent('loffe_burglary:loot', k, i)
                            SetEntityHeading(player, v.MultipleSearch[i].Heading)
                            FreezeEntityPosition(player, true)
                            TaskStartScenarioInPlace(player, "PROP_HUMAN_BUM_BIN", 0, true)
                            Wait(5000)
                            ClearPedTasks(player)
                            Wait(2500)
                            FreezeEntityPosition(player, false)
                        end
                    end
                end
            end
        end
        Wait(50)
    end
end)

RegisterNetEvent("showNotification")

Citizen.CreateThread(function()
	AddEventHandler("showNotification", function(text)
		SetNotificationTextEntry("STRING")
		AddTextComponentString(text)
		DrawNotification(0,1)
	end)
end)

function PoliceRobberyAlert()
    local playerPed = PlayerPedId()
    PedPosition	= GetEntityCoords(playerPed)
    robbery_alert = 'House robbery in progress. Secure the house and lock it!'
    local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }
    TriggerServerEvent('esx_addons_gcphone:startCall', 'police', robbery_alert, PlayerCoords, {
    PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
    })
end

