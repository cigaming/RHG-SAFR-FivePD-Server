-- Settings
local enableTaxiGui = true -- Enables the GUI (Default: true)
local fareCost = 1.66 --(1.66 = $100 per minute) Cost per second
local costPerMile = 35.0
local initialFare = 50.0 -- the cost to start a fare

local testMode = true -- enables spawn car command

DecorRegister("fares", 1)
DecorRegister("miles", 1)
DecorRegister("meteractive", 2)
DecorRegister("initialFare", 1)
DecorRegister("costPerMile", 1)
DecorRegister("fareCost", 1)

-- NUI Variables
local inTaxi = false
local meterOpen = false
local meterActive = false

-- Open Gui and Focus NUI
function openGui()
  SendNUIMessage({openMeter = true})
end

-- Close Gui and disable NUI
function closeGui()
  SendNUIMessage({openMeter = false})
  meterOpen = false
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped, false)
    if IsInTaxi() and GetPedInVehicleSeat(veh, -1) ~= ped then
      local ped = GetPlayerPed(-1)
      local veh = GetVehiclePedIsIn(ped, false)
      TriggerEvent('taxi:updatefare', veh)
      openGui()
      meterOpen = true
    end
    if meterActive and GetPedInVehicleSeat(veh, -1) == ped then
      local _fare = DecorGetFloat(veh, "fares")
      local _miles = DecorGetFloat(veh, "miles")
      local _fareCost = DecorGetFloat(veh, "fareCost")

      if _fareCost ~= 0 then
        DecorSetFloat(veh, "fares", _fare + _fareCost)
      else
        DecorSetFloat(veh, "fares", _fare + fareCost)
      end
      DecorSetFloat(veh, "miles", _miles + round(GetEntitySpeed(veh) * 0.000621371, 5))
      TriggerEvent('taxi:updatefare', veh)
    end
    if IsInTaxi() and not GetPedInVehicleSeat(veh, -1) == ped then
      TriggerEvent('taxi:updatefare', veh)
    end
  end
end)

-- If GUI setting turned on, listen for INPUT_PICKUP keypress
if enableTaxiGui then
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if(IsInTaxi()) then
        if (inTaxi == false) then
          msg = "Press HOME to toggle Taxi Meter"
          TriggerEvent("pNotify:SendNotification", {text = msg , type = "success", layout = "centerLeft", queue = "global", theme = "gta", timeout = 5000})
        end
        inTaxi = true
        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(ped, false)
        if(IsInTaxi() and GetPedInVehicleSeat(veh, -1) == ped) then
          if IsControlJustReleased(0, 213)  then -- HOME
            TriggerEvent('taxi:toggleDisplay')
            Citizen.Wait(100)
          end
          if IsControlJustReleased(0, 311)  then -- K
            TriggerEvent('taxi:toggleHire')
            Citizen.Wait(100)
          end
          if IsControlJustReleased(0,7) then -- L
            TriggerEvent('taxi:resetMeter')
            Citizen.Wait(100)
          end
        end
      else
        if(meterOpen) then
          closeGui()
        end
        meterOpen = false
      end
    end
  end)
end

function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

-- NUI Callback Methods
RegisterNUICallback('close', function(data, cb)
  closeGui()
  cb('ok')
end)

RegisterNetEvent('taxi:toggleDisplay')
AddEventHandler('taxi:toggleDisplay', function()
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsIn(ped, false)
  if(IsInTaxi() and GetPedInVehicleSeat(veh, -1) == ped) then
    if meterOpen then
      closeGui()
      meterOpen = false
    else
      local _fare = DecorGetFloat(veh, "fares")
      if _fare < initialFare then
        DecorSetFloat(veh, "fares", initialFare)
      end
      TriggerEvent('taxi:updatefare', veh)
      openGui()
      meterOpen = true
    end
  end
end)

RegisterNetEvent('taxi:toggleHire')
AddEventHandler('taxi:toggleHire', function()
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsIn(ped, false)
  if(IsInTaxi() and GetPedInVehicleSeat(veh, -1) == ped) then
    if meterActive then
      SendNUIMessage({meterActive = false})
      meterActive = false
      DecorSetBool(veh, "meteractive", false)
      Citizen.Trace("Trigger OFF")
    else
      SendNUIMessage({meterActive = true})
      meterActive = true
      DecorSetBool(veh, "meteractive", true)
      Citizen.Trace("Trigger ON")
    end
  end
end)

RegisterNetEvent('taxi:resetMeter')
AddEventHandler('taxi:resetMeter', function()
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsIn(ped, false)
  if(IsInTaxi() and GetPedInVehicleSeat(veh, -1) == ped) then
    local _fare = DecorGetFloat(veh, "fares")
    local _miles = DecorGetFloat(veh, "miles")
    DecorSetFloat(veh, "initialFare", initialFare)
    DecorSetFloat(veh, "costPerMile", costPerMile)
    DecorSetFloat(veh, "fareCost", fareCost)
    DecorSetFloat(veh, "fares", DecorGetFloat(veh, "initialFare"))
    DecorSetFloat(veh, "miles", 0.0)
    TriggerEvent('taxi:updatefare', veh)
  end
end)

-- Check if player is in a vehicle
function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

-- Check if player is in a Taxi
function IsInTaxi()
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsIn(ped, false)
  local model = GetEntityModel(veh)
  local displaytext = GetDisplayNameFromVehicleModel(model)
  local name = GetLabelText(displaytext)
  if (name == "Taxi") then
    return true
  else
    return false
  end
end

-- Check if player is in a Taxi
function ReturnVehicle()
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsIn(ped, false)
  local model = GetEntityModel(veh)
  local displaytext = GetDisplayNameFromVehicleModel(model)
  local name = GetLabelText(displaytext)
end

-- Check if player is near another player
function IsNearPlayer(player)
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  local ply2 = GetPlayerPed(GetPlayerFromServerId(player))
  local ply2Coords = GetEntityCoords(ply2, 0)
  local distance = GetDistanceBetweenCoords(ply2Coords["x"], ply2Coords["y"], ply2Coords["z"],  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
  if(distance <= 5) then
    return true
  end
end

-- Send NUI message to update
RegisterNetEvent('taxi:updatefare')
AddEventHandler('taxi:updatefare', function(veh)
  local id = PlayerId()
  local playerName = GetPlayerName(id)
  local _fare = DecorGetFloat(veh, "fares")
  local _miles = DecorGetFloat(veh, "miles")
  local farecost = _fare + (_miles * DecorGetFloat(veh, "costPerMile"))


	SendNUIMessage({
		updateBalance = true,
		balance = string.format("%.2f", farecost),
    player = string.format("%.2f", _miles),
    meterActive = DecorGetBool(veh, "meteractive")
	})
end)

RegisterNetEvent('vRP_taxi:user_settings')
AddEventHandler('vRP_taxi:user_settings', function(action, value)
  if action ~= nil and IsInTaxi() then
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped, false)
    if GetPedInVehicleSeat(veh, -1) == ped then
      if action == "show" then
        msg = "<b>Current meter values</b></b><br /><b>Initial</b> = $"..initialFare.."<br /><b>Fare per mile</b> = $"..costPerMile.."<br /><b>Fare per minute</b> = $"..fareCost*60
      elseif action == "initial" then
        initialFare = value*1.0
        DecorSetFloat(veh, "fares", initialFare)
        TriggerEvent('taxi:updatefare', veh)
        msg = "<b>Initial fare set to </b>$"..value
        DecorSetFloat(veh, "initialFare", value*1.0)
      elseif action == "mile" then
        costPerMile = value
        msg = "<b>Fare per mile set to </b>$"..value
        DecorSetFloat(veh, "costPerMile", value)
      elseif action == "minute" then
        fareCost = value/60
        msg = "<b>Fare per minute set to </b>$"..value
        DecorSetFloat(veh, "fareCost", value/60)
      end
      if msg ~= nil then
        TriggerEvent("pNotify:SendNotification", {text = msg , type = "success", layout = "centerLeft", queue = "global", theme = "gta", timeout = 5000})
      end
    end
  end
end)

if testMode then
  RegisterNetEvent('VehicleSpawn')
  AddEventHandler('VehicleSpawn', function(vehicleName)
    local myPed = GetPlayerPed(-1)
    local player = PlayerId()
    local vehicle = GetHashKey(vehicleName)
    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do
      Wait(1)
    end
    local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
    local spawned_car = CreateVehicle(vehicle, coords, GetEntityHeading(myPed), true, false)
    SetVehicleOnGroundProperly(spawned_car)
    SetModelAsNoLongerNeeded(vehicle)
    Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(spawned_car))
  end)

  Citizen.CreateThread(function()
    while true do
      Wait(1)
    end
  end)
end
