local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

ESX                           = nil

PlayerData              = {}

Citizen.CreateThread(function()
    while ESX == nil do

        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

        Citizen.Wait(10)
    end

    while ESX.GetPlayerData() == nil do
        Citizen.Wait(10)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

Citizen.CreateThread(function()
    while true do

        local sleepThread = 500

        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)

        if PlayerData.job ~= nil and PlayerData.job.name ~= "police" then

            for detector, v in pairs(Config.Detectors) do

                local distanceCheck = GetDistanceBetweenCoords(pedCoords, v.x, v.y, v.z, true)

                if distanceCheck <= 10.0 then

                    sleepThread = 5

                    ESX.Game.Utils.DrawText3D({ x = v.x, y = v.y, z = v.z }, "Detector", 0.4)

                    if distanceCheck <= 1.5 then

                        local Weapons = ESX.GetWeaponList()

                        for i, values in pairs(Weapons) do

                            print(GetHashKey(values.name))

                            if HasPedGotWeapon(ped, GetHashKey(values["name"]), false) then
                        
                                ESX.ShowNotification("You had weapons on you and the alarm went off.")

                                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "detector", 1.0)

                                Citizen.Wait(5000)

                                TriggerServerEvent('esx_phone:send', 'police', "Message", true, {}, true)

                                break
                            end
                        end

                    end

                end

            end
        else
            sleepThread = 1500
        end

        Citizen.Wait(sleepThread)

    end
end)