-----------------------------------------------
-- BAITCAR SCRIPT --
-----------------------------------------------
AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/lockbc" or sm[1] == "/Lockbc" or sm[1] == "/LOCKBC" then
		CancelEvent()
		local ServerID = sm[2]
		TriggerClientEvent("simp:baitCarDisable", ServerID)
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/unlockbc" or sm[1] == "/Unlockbc" or sm[1] == "/UNLOCKBC" then
		CancelEvent()
		local ServerID = sm[2]
		TriggerClientEvent("simp:baitCarunlock", ServerID)
	end
end)



-----------------------------------------------
-- StringSplit Function, Just Ignore this. --
-----------------------------------------------
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
-----------------------------------------------------------------------------------------------------------------------
-- CREATED BY TONI MORTON FOR THE FIVEM COMMUNITY, PLEASE GIVE CREDITS TO ME IF YOU USE THIS SCRIPT IN YOUR SERVER.  --
-----------------------------------------------------------------------------------------------------------------------