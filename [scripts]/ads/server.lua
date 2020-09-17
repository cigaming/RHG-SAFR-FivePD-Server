RegisterServerEvent("SyncAd")
AddEventHandler('SyncAd', function(adtype, inputText)
	TriggerClientEvent('DisplayAd', -1, adtype, inputText)
end)


AddEventHandler('chatMessage', function(from, name, message)
	cm = stringsplit(message, " ")

	if cm[1] == "/ad" then
		CancelEvent()
		if cm[2] == nil then
			TriggerClientEvent("ShowAds", from)	
			return
		end

		local adtype = cm[2]
		local ad = stringadd(cm, 3)
		TriggerEvent("SyncAd", adtype, ad)	
	end
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

function stringadd(table, start)
	local txt = ""
	for i=start, #table do
		txt = (txt .. " " .. tostring(table[i]))
	end

	return txt
end