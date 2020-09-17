RegisterServerEvent('ticket')
AddEventHandler('ticket', function(string)
  TriggerClientEvent('chatMessage', -1, string)
end)

local pisVersion = "1.0.5"

print("")
print("----------------[P.I.S]----------------")
print("PIS:SYSTEM - PIS SUCCESFULLY LOADED")
print("PIS:SYSTEM - RUNNING ON v" .. pisVersion)
print("---------------------------------------")

TriggerClientEvent('chatMessage', -1, "PIS ^6v" .. pisVersion, { 0, 0, 0}, " SUCCESFULLY LOADED!")


onduty = {""}
status = {""}


RegisterServerEvent("duty")
AddEventHandler("duty", function(playernames)

shit = playernames

TriggerClientEvent('chatMessage', -1, "Dispatch", {244, 155, 66}, shit.." is now on duty.")

onduty[source] = playernames
end)

RegisterServerEvent("avail")
AddEventHandler("avail", function()
for i = 1, 40 do
	
	if onduty[i] == "" or onduty[i] == nil then
	
	--TriggerClientEvent('chatMessage', source, "Dispatch", {244, 155, 66}, " Nobody ")
	else
	TriggerClientEvent('chatMessage', source, "Dispatch", {0, 0, 0}, onduty[i].." Is "..status[i])
	end
	
	
	
	
	end


end)

RegisterServerEvent("108")
AddEventHandler("108", function(playernames)

status[source] = "10-8(Available)"
	
	TriggerClientEvent('chatMessage', -1, "Dispatch", {0, 128, 0}, playernames.." is now 10-8(Available)")
end)

RegisterServerEvent("106")
AddEventHandler("106", function(playernames)

status[source] = "10-6(Busy)"
	
	TriggerClientEvent('chatMessage', -1, "Dispatch", {204, 204, 0}, playernames.." is now 10-6(Busy)")
end)

RegisterServerEvent("107")
AddEventHandler("107", function(playernames)

status[source] = "10-7(Out Of Service)"
	
	TriggerClientEvent('chatMessage', -1, "Dispatch", {255, 0, 0}, playernames.." is now 10-7(Out Of Service)")
end)

RegisterServerEvent("1017")
AddEventHandler("1017", function(playernames)

status[source] = "10-96(EnRoute)"
	
	TriggerClientEvent('chatMessage', -1, "Dispatch", {128, 0, 128}, playernames.." is now 10-96(EnRoute)")
end)

RegisterServerEvent("1023")
AddEventHandler("1023", function(playernames)

status[source] = "10-97(On Scene)"
	
	TriggerClientEvent('chatMessage', -1, "Dispatch", {255, 140, 0}, playernames.." is now 10-97(On Scene)")
end)

RegisterServerEvent("1061")
AddEventHandler("1061", function(playernames)

status[source] = "10-38(Traffic Stop)"
	
	TriggerClientEvent('chatMessage', -1, "Dispatch", {244, 155, 66}, playernames.." is now 10-38(On a Traffic Stop)")
end)

AddEventHandler('chatMessage', function(source, color, message)
  args = stringsplit(message, " ")
if (args[1] == "/panic") then
    CancelEvent()
	players = source
    TriggerClientEvent('setgps', -1, players)
	TriggerClientEvent('chatMessage', source, "Dispatch", {244, 155, 66}, "You have hit your panic button")
  end
  
  if (args[1] == "/10-8") then
    
	status[source] = "10-8"
	
	TriggerClientEvent('chatMessage', source, "Dispatch", {244, 155, 66}, "You are now 10-8")
  end
  
  if (args[1] == "/10-6") then
    
	status[source] = "10-6"
	
	TriggerClientEvent('chatMessage', source, "Dispatch", {244, 155, 66}, "You are now 10-6")
  end
  
  
  if (args[1] == "/avail") then
    CancelEvent()
	
	
	for i = 1, 40 do
	
	if onduty[i] == "" or onduty[i] == nil then
	
	--TriggerClientEvent('chatMessage', source, "Dispatch", {244, 155, 66}, " Nobody ")
	else
	TriggerClientEvent('chatMessage', source, "Dispatch", {244, 155, 66}, onduty[i].." Is "..status[i])
	end
	
	
	
	
	end
	
	
	
  end
  
  
  end)
  
AddEventHandler("playerDropped", function()
   
	
	if onduty[source] ~= "" or onduty[source] ~= nil then
	
	  onduty[source] = nil
	
	end
	
	
	
	
	
end)

RegisterServerEvent("aa")
AddEventHandler("aa", function(playernames)

shit = playernames

TriggerClientEvent('chatMessage', -1, "Dispatch", {244, 155, 66}, shit.." is now on duty.")

onduty[source] = playernames
end)

function stringsplit(inputstr, sep)
  if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end