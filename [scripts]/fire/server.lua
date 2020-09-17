------------------------------------------------------------
------------------------------------------------------------
---- Author: Lucas Decker, Dylan Thuillier              ----
----                                                    ----
---- Email: lucas.d.200501@gmail.com,                   ----
----        itokoyamato@hotmail.fr                      ----
----                                                    ----
---- Resource: Fire Command System                      ----
----                                                    ----
---- File: client.lua                                   ----
------------------------------------------------------------
------------------------------------------------------------

------------------------------------------------------------
-- Chat command handler
------------------------------------------------------------

AddEventHandler("chatMessage", function(source, name, message)
	local args = stringsplit(message, " ");
	if (args[1] == "/fire") then
		CancelEvent();
		if (args[2] == "start") then
			if (not args[3] or not args[4] or not args[5] or not args[6]) then
				sendUsage(source);
			else
				TriggerClientEvent("Fire:start", source, args[3], args[4], args[5], args[6]);
				TriggerClientEvent("chatMessage", source, "",{255, 255, 255}, "^4Fire: ^1started fire");
			end
		elseif (args[2] == "stop") then
			TriggerClientEvent("Fire:stop", source);
			TriggerClientEvent("chatMessage", source, "",{255, 255, 255}, "^4Fire: ^1stopped all fires");
		elseif (args[2] == "preview") then
			if (args[3] == "stop") then
				TriggerClientEvent("Fire:preview", source, args[3], args[4], args[5], args[6], false);

					TriggerClientEvent("chatMessage", source, "",{255, 255, 255}, "^4Fire: ^1disabled preview");
			else
				if (not args[3] or not args[4] or not args[5] or not args[6]) then
					sendUsage(source);
				else
					TriggerClientEvent("Fire:preview", source,args[3], args[4], args[5], args[6], true);
					TriggerClientEvent("chatMessage", source, "",{255, 255, 255}, "^4Fire: ^1enabled preview");
				end
			end
		else
			sendUsage(source);
		end
	end
end);

function sendUsage(source)
	TriggerClientEvent("chatMessage", source, "USAGE",{255, 255, 255}, "/fire start [distance_from_player] [area_size] [density] [scale of flames]");
	TriggerClientEvent("chatMessage", source, "USAGE",{255, 255, 255}, "/fire stop");
	TriggerClientEvent("chatMessage", source, "USAGE",{255, 255, 255}, "/fire preview [distance_from_player] [area_size] [density] [scale of flames]");
	TriggerClientEvent("chatMessage", source, "USAGE",{255, 255, 255}, "/fire preview stop");
end

function newFire(posX, posY, posZ, scale)
	TriggerClientEvent("Fire:newFire", -1, posX, posY, posZ, scale);
end
RegisterServerEvent("Fire:newFire");
AddEventHandler("Fire:newFire", newFire);


------------------------------------------------------------
-- Utils
------------------------------------------------------------

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
