local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,["-"] = 84,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local GUI                        = {}
GUI.Time                         = 0
GUI.PoliceCadIsShowed            = false

Citizen.CreateThread(function()

  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
  end

  ESX.UI.Menu.RegisterType('cadsystem', OpenCadSystem, CloseCadSystem)

end)

function OpenCadSystem()

  local playerPed = GetPlayerPed(-1)

  GUI.PoliceCadIsShowed = true

  SendNUIMessage({
      showCadSystem = true,
    })

  ESX.SetTimeout(250, function()
    SetNuiFocus(true, true)
  end)
end

function CloseCadSystem()

  local playerPed = GetPlayerPed(-1)

  SendNUIMessage({
    showCadSystem = false
  })

  SetNuiFocus(false)

  GUI.PoliceCadIsShowed = false

  ClearPedTasks(playerPed)

end

RegisterNUICallback('escape', function()
  ESX.UI.Menu.Close('cadsystem', GetCurrentResourceName(), 'main')
end)

RegisterNUICallback('search-plate', function(data)
  TriggerServerEvent('esx_police_cad:search-plate', data.plate)
end)

RegisterNUICallback('add-cr', function(data)
  officer = ESX.GetPlayerData(-1);
  TriggerServerEvent('esx_police_cad:add-cr', data, officer.identifier)
end)

RegisterNUICallback('get-cr', function(playerid)
    print(playerid.playerid);
  TriggerServerEvent('esx_police_cad:get-cr', playerid.playerid)
end)

RegisterNUICallback('get-license', function(playerid)
  TriggerServerEvent('esx_police_cad:get-license', playerid.playerid)
end)

RegisterNUICallback('search-players', function(data)
  TriggerServerEvent('esx_police_cad:search-players', data.search)
end)

Citizen.CreateThread(function()

    while true do
    Citizen.Wait(10)

    if GUI.PhoneIsShowed then -- codes here: https://pastebin.com/guYd0ht4
      DisableControlAction(0, 1,    true) -- LookLeftRight
      DisableControlAction(0, 2,    true) -- LookUpDown
      DisableControlAction(0, 25,   true) -- Input Aim
      DisableControlAction(0, 106,  true) -- Vehicle Mouse Control Override

      DisableControlAction(0, 24,   true) -- Input Attack
      DisableControlAction(0, 140,  true) -- Melee Attack Alternate
      DisableControlAction(0, 141,  true) -- Melee Attack Alternate
      DisableControlAction(0, 142,  true) -- Melee Attack Alternate
      DisableControlAction(0, 257,  true) -- Input Attack 2
      DisableControlAction(0, 263,  true) -- Input Melee Attack
      DisableControlAction(0, 264,  true) -- Input Melee Attack 2

      DisableControlAction(0, 12,   true) -- Weapon Wheel Up Down
      DisableControlAction(0, 14,   true) -- Weapon Wheel Next
      DisableControlAction(0, 15,   true) -- Weapon Wheel Prev
      DisableControlAction(0, 16,   true) -- Select Next Weapon
      DisableControlAction(0, 17,   true) -- Select Prev Weapon
      if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
          SendNUIMessage({
              type = "click"
          })
      end
    else
      if IsPedInAnyPoliceVehicle(GetPlayerPed(-1)) then
          if GetLastInputMethod(2) and IsControlPressed(2, Keys['TAB']) and (GetGameTimer() - GUI.Time) > 150 then
            if not ESX.UI.Menu.IsOpen('cadsystem', GetCurrentResourceName(), 'main') then
              ESX.UI.Menu.CloseAll()
              ESX.UI.Menu.Open('cadsystem', GetCurrentResourceName(), 'main')
            end
            GUI.Time = GetGameTimer()
          end
      end
    end
  end
end)

RegisterNetEvent('esx_police_cad:showdataplate')
AddEventHandler('esx_police_cad:showdataplate', function(plate,model,firstname,lastname)
        SendNUIMessage({
          plate = plate,
          model = model,
          firstname = firstname,
          lastname = lastname
        })
end)

RegisterNetEvent('esx_police_cad:showdateplateNotFound')
AddEventHandler('esx_police_cad:showdateplateNotFound', function()
        SendNUIMessage({
          plate = 'Not found',
          model = '',
          firstname = '',
          lastname = ''
        })
end)

RegisterNUICallback('esx_police_cad:search-players', function(data)
  TriggerServerEvent('esx_police_cad:search-players', data.search)
end)

RegisterNetEvent('esx_police_cad:returnsearch')
AddEventHandler('esx_police_cad:returnsearch', function(results)
        SendNUIMessage({
          civilianresults = results
        })
end)

RegisterNetEvent('esx_police_cad:show-cr')
AddEventHandler('esx_police_cad:show-cr', function(results)
        SendNUIMessage({
          crresults = results
        })
end)

RegisterNetEvent('esx_police_cad:show-license')
AddEventHandler('esx_police_cad:show-license', function(results)
        SendNUIMessage({
          licenseResults = results
        })
end)

