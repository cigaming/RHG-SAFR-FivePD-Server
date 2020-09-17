local taxiMeter = {}

-- HELPER FUNCTIONS
function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function splitString(str, sep)
  if sep == nil then sep = "%s" end

  local t={}
  local i=1

  for str in string.gmatch(str, "([^"..sep.."]+)") do
    t[i] = str
    i = i + 1
  end

  return t
end

--if testMode then
  AddEventHandler('chatMessage', function(source, n, message)
    local args = stringsplit(message, " ")
    if (args[1] == "/spawn") then
      CancelEvent()
      if (args[2] ~= nil) then
        local playerID = tonumber(source)
        local vehicleName = tostring(args[2])
        TriggerClientEvent('VehicleSpawn', playerID, vehicleName)
      else
        local event = 'chatMessage'
        local eventTarget = source
        local messageSender = "SYSTEM"
        local messageSenderColor = {200, 0, 0}
        local message = "Usage: /spawn <Vehicle_Name>  (for example /spawn polmav)"
        TriggerClientEvent(event, eventTarget, messageSender, messageSenderColor, message)
      end
    end
  end)
--end
AddEventHandler('chatMessage', function(from,name,message)
  if(string.sub(message,1,1) == "/") then

    local args = splitString(message)
    local cmd = args[1]

    if(cmd == "/taxifare")then
      CancelEvent()

      local subCmd = string.lower(tostring(args[2]))
      if(subCmd == nil)then
        TriggerClientEvent('chatMessage', from, "Taxi Meter -- Settings", {200,0,0} , "Usage: /taxifare help")
        return
      end
      if subCmd == "help" then
        TriggerClientEvent('chatMessage', from, "Taxi Meter -- Help", {200,0,0} , "Possible actions: initial, mile, minute, show. Initial is the base starting fare (default: $50). Mile is the rate per mile driven (default: $35). Minute is the rate per minute while the meter is on (default: $100). Show will display your current settings.")
        return
      end
      if subCmd == "show" then
        TriggerClientEvent("vRP_taxi:user_settings", from, subCmd, nil)
        return
      end
      if args[3] ~= nil then
        value = parseDouble(args[3])
        if subCmd == "initial" then
          TriggerClientEvent("vRP_taxi:user_settings", from, subCmd, value)
          return
        end
        if subCmd == "mile" then
          TriggerClientEvent("vRP_taxi:user_settings", from, subCmd, value)
          return
        end
        if subCmd == "minute" then
          TriggerClientEvent("vRP_taxi:user_settings", from, subCmd, value)
          return
        end
      else
        TriggerClientEvent('chatMessage', from, "Taxi Meter -- Settings", {200,0,0} , "Usage: /taxifare help")
        return
      end
    elseif cmd == "/taxihire" then
      TriggerClientEvent('taxi:toggleHire',from)
    elseif cmd == "/taxireset" then
      TriggerClientEvent('taxi:resetMeter',from)
    elseif cmd == "/taxidisplay" then
      TriggerClientEvent('taxi:toggleDisplay',from)
    end
  end
end)

function stringsplit(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={}
  i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    t[i] = str i = i + 1
  end
  return t
end
