RegisterNetEvent('unrackrifle')
AddEventHandler('unrackrifle', function(id, name)
  local ID = PlayerId()
  local plyID = GetPlayerFromServerId(id)
    if plyID == ID then
      TriggerEvent('chatMessage', ">*^0".. name .. " unracks ^8RIFLE ^7from cruiser ! ")
      GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 1000, false) -- Change weapon hash here <--
    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(ID)), GetEntityCoords(GetPlayerPed(plyID)), true) < 49.999 then
      TriggerEvent('chatMessage', ">*^0".. name .. " unracks ^8RIFLE ^7from cruiser ! ")
      GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 1000, false) -- Change weapon hash here <--)
    end
end)

RegisterNetEvent('rackrifle')
AddEventHandler('rackrifle', function(id, name)
  local ID = PlayerId()
  local plyID = GetPlayerFromServerId(id)
    if plyID == ID then
      TriggerEvent('chatMessage', ">*^0".. name .. " racks ^8RIFLE ^7back in cruiser ! ")
      RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 0, false) -- Change weapon hash here <--
    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(ID)), GetEntityCoords(GetPlayerPed(plyID)), true) < 49.999 then
      TriggerEvent('chatMessage', ">*^0".. name .. " racks ^8RIFLE ^7back in cruiser ! ")
      RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 0, false) -- Change weapon hash here <--
    end
end)

RegisterNetEvent('unracksg')
AddEventHandler('unracksg', function(id, name)
  local ID = PlayerId()
  local plyID = GetPlayerFromServerId(id)
    if plyID == ID then
      TriggerEvent('chatMessage', ">*^0".. name .. " unracks ^8SHOTGUN ^7from crusier ! ")
      GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), 50, false) -- Change weapon hash here <--
    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(ID)), GetEntityCoords(GetPlayerPed(plyID)), true) < 49.999 then
      TriggerEvent('chatMessage', ">*^0".. name .. " unracks ^8SHOTGUN ^7from crusier ! ")
      GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), 50, false) -- Change weapon hash here <--)
    end
end)

RegisterNetEvent('racksg')
AddEventHandler('racksg', function(id, name)
  local ID = PlayerId()
  local plyID = GetPlayerFromServerId(id)
    if plyID == ID then
      TriggerEvent('chatMessage', ">*^0".. name .. " racks ^8SHOTGUN ^7back into cruiser ! ")
      RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), 0, false) -- Change weapon hash here <--
    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(ID)), GetEntityCoords(GetPlayerPed(plyID)), true) < 49.999 then
      TriggerEvent('chatMessage', ">*^0".. name .. " racks ^8SHOTGUN ^7back into cruiser ! ")
      RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), 0, false) -- Change weapon hash here <--
    end
end)