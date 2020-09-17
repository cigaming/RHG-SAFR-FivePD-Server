local PlayerData                = {}
ESX                             = nil

local heist = false
local tags = false
local searched = 0
local location1 = false
local location2 = false
local location3 = false
local location4 = false
local location5 = false
local location6 = false
local location7 = false
local location8 = false
local location9 = false
local location10 = false
local location11 = false
local location12 = false
local location13 = false
local location14 = false

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


Citizen.CreateThread(function() -- tags  
    while true do
        Citizen.Wait(1)

        local ped = PlayerPedId()
            local mansion = AddBlipForCoord(-1876.416,2062.067,145.574)
                SetBlipSprite(mansion, 160)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(_U('blipname'))
                SetBlipAsShortRange(mansion, true)
                EndTextCommandSetBlipName(mansion)
                return
        end
    end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
      local ped = PlayerPedId()
        if heist == false then
        if GetDistanceBetweenCoords(GetEntityCoords(ped), -1876.416,2062.067,145.574, true) < 50 then
            DrawMarker(29, -1876.416,2062.067,145.574, 0, 0, 0, 0, 0, 75.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), -1876.416,2062.067,145.574, true) < 1.5 then
                    ESX.ShowHelpNotification(_U('start_robbery'))
                        if IsControlJustReleased(1, 51) then
                            TriggerServerEvent("esx_mansion:robbery")
                            PoliceRobberyAlert()
                        end
                    end
                end
            end
        end
    end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
            local ped = PlayerPedId()
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1876.416,2062.067,145.574, true) > 100 then
                heist = false
                tags = false
            end
        end
    end)
        
RegisterNetEvent("esx_mansion:start")
AddEventHandler("esx_mansion:start", function()
  heist = true
  tags = true
  Citizen.CreateThread(function()
    while true do 
      Citizen.Wait(1)
        local ped = PlayerPedId()
        if location1 == false and tags == true then
            DrawMarker(20, -1879.053, 2065.301, 145.574, 0, 0, 0, 0, 0, 155.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1879.053, 2065.301, 145.574, true) < 1.5 then
                ESX.ShowHelpNotification(_U('search_robbery'))
                    if IsControlJustReleased(1, 51) then
                        Animacja()
                        location1 = true
                        searched = searched+1
                    end
                end
            end
        if location2 == false and tags == true then
            DrawMarker(20, -1879.393, 2069.73, 145.574, 0, 0, 0, 0, 0, 155.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1879.393, 2069.73, 145.574, true) < 1.5 then
                ESX.ShowHelpNotification(_U('search_robbery'))
                    if IsControlJustReleased(1, 51) then
                        Animacja()
                        location2 = true
                        searched = searched+1
                    end
                end
            end
        if location3 == false and tags == true then
            DrawMarker(20, -1884.006, 2069.875, 145.574 , 0, 0, 0, 0, 0, 155.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1884.006, 2069.875, 145.574 , true) < 1.5 then
                ESX.ShowHelpNotification(_U('search_robbery'))
                    if IsControlJustReleased(1, 51) then
                        Animacja()
                        location3 = true
                        searched = searched+1
                    end
                end
            end
        if location4 == false and tags == true then
            DrawMarker(20, -1887.347, 2070.144, 145.574, 0, 0, 0, 0, 0, 70.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1887.347, 2070.144, 145.574, true) < 1.5 then
                ESX.ShowHelpNotification(_U('search_robbery'))
                    if IsControlJustReleased(1, 51) then
                        Animacja()
                        location4 = true
                        searched = searched+1
                    end
                end
            end
        if location5 == false and tags == true then
            DrawMarker(20, -1890.508, 2064.856, 145.574, 0, 0, 0, 0, 0, 70.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1890.508, 2064.856, 145.574, true) < 1.5 then
                ESX.ShowHelpNotification(_U('search_robbery'))
                    if IsControlJustReleased(1, 51) then
                        Animacja()
                        location5 = true
                        searched = searched+1
                    end
                end
            end
        if location6 == false and tags == true then
            DrawMarker(20, -1890.836, 2058.413, 140.984 , 0, 0, 0, 0, 0, 70.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1890.836, 2058.413, 140.984 , true) < 1.5 then
                ESX.ShowHelpNotification(_U('search_robbery'))
                    if IsControlJustReleased(1, 51) then
                        Animacja()
                        location6 = true
                        searched = searched+1
                    end
                end
            end
        if location7 == false and tags == true then
            DrawMarker(20, -1880.922, 2054.534, 140.984, 0, 0, 0, 0, 0, 70.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1880.922, 2054.534, 140.984, true) < 1.5 then
                ESX.ShowHelpNotification(_U('search_robbery'))
                    if IsControlJustReleased(1, 51) then
                        Animacja()
                        location7 = true
                        searched = searched+1
                    end
                end
            end
        if location8 == false and tags == true then
            DrawMarker(20, -1881.262, 2060.95, 140.984, 0, 0, 0, 0, 0, 155.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1881.262, 2060.95, 140.984, true) < 1.5 then
                ESX.ShowHelpNotification(_U('search_robbery'))
                    if IsControlJustReleased(1, 51) then
                        Animacja()
                        location8 = true
                        searched = searched+1
                    end
                end
            end
        if location9 == false and tags == true then
            DrawMarker(20, -1886.188, 2063.007, 140.984, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1886.188, 2063.007, 140.984, true) < 1.5 then
                ESX.ShowHelpNotification(_U('search_robbery'))
                    if IsControlJustReleased(1, 51) then
                        Animacja()
                        location9 = true
                        searched = searched+1
                    end
                end
            end
        if location10 == false and tags == true then
            DrawMarker(20, -1874.666, 2067.354, 140.984 , 0, 0, 0, 0, 0, 155.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1874.666, 2067.354, 140.984 , true) < 1.5 then
                ESX.ShowHelpNotification(_U('search_robbery'))
                    if IsControlJustReleased(1, 51) then
                        Animacja()
                        location10 = true
                        searched = searched+1
                    end
                end
            end
        if location11 == false and tags == true then
            DrawMarker(20, -1887.443, 2072.17, 140.984, 0, 0, 0, 0, 0, 170.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1887.443, 2072.17, 140.984, true) < 1.5 then
                ESX.ShowHelpNotification(_U('search_robbery'))
                    if IsControlJustReleased(1, 51) then
                        Animacja()
                        location11 = true
                        searched = searched+1
                    end
                end
            end
        if location12 == false and tags == true then
            DrawMarker(20, -1876.087, 2057.294, 140.984, 0, 0, 0, 0, 0, 70.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1876.087, 2057.294, 140.984, true) < 1.5 then
                ESX.ShowHelpNotification(_U('search_robbery'))
                    if IsControlJustReleased(1, 51) then
                        Animacja()
                        location12 = true
                        searched = searched+1
                    end
                end
            end
        if location13 == false and tags == true then
            DrawMarker(20, -1874.856, 2059.283, 135.915, 0, 0, 0, 0, 0, 70.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1874.856, 2059.283, 135.915, true) < 1.5 then
                ESX.ShowHelpNotification(_U('search_robbery'))
                    if IsControlJustReleased(1, 51) then
                        Animacja()
                        location13 = true
                        searched = searched+1
                    end
                end
            end
        if location14 == false and tags == true then
            DrawMarker(20, -1878.398, 2061.047, 135.915, 0, 0, 0, 0, 0, 70.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), -1878.398, 2061.047, 135.915, true) < 1.5 then
                ESX.ShowHelpNotification(_U('search_robbery'))
                    if IsControlJustReleased(1, 51) then
                        Animacja()
                        location14 = true
                        searched = searched+1
                    end
                end
            end
        end
    end)
end)

Citizen.CreateThread(function()
    while searched < 14 do 
        Citizen.Wait(100)
            if searched == 14 then
                TriggerServerEvent("esx_mansion:reward")
                heist = false
                tags = false
                Citizen.Wait(19000)
                ESX.ShowHelpNotification(_U('suitcase_found'))
            end
        end
    end)

function Animacja()
  local ped = PlayerPedId()
  Citizen.CreateThread(function()
    RequestAnimDict("mini@triathlon")
    Citizen.Wait(100)
    TaskPlayAnim((ped), 'mini@triathlon', 'rummage_bag', 2.0, 2.0, -1, 81, 0, 0, 0, 0)
    FreezeEntityPosition(PlayerPedId(), true)
    Citizen.Wait(20000)
    ClearPedTasks(ped)
    FreezeEntityPosition(PlayerPedId(), false)
  end)
end

RegisterNetEvent("esx_mansion:notification")
AddEventHandler("esx_mansion:notification", function(text)
    ESX.ShowHelpNotification(text)
end)

RegisterNetEvent("esx_mansion:notify")
AddEventHandler("esx_mansion:notify", function(text)
    ESX.ShowNotification(_U('notification'))
    PlaySoundFrontend(-1, "HACKING_SUCCESS", 0, 1)
end)

RegisterCommand("neq", function()
    TriggerEvent("esx_mansion:lspd")
end)

function PoliceRobberyAlert()
    local playerPed = PlayerPedId()
    PedPosition	= GetEntityCoords(playerPed)
    robbery_alert = 'burglary at vinewood mansion'
    local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }
    TriggerServerEvent('esx_addons_gcphone:startCall', 'police', robbery_alert, PlayerCoords, {
    PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
    })
end