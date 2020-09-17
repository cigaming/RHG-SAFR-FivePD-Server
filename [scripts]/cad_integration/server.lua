--------------------------------------------------------
------   DO NOT CHANGE THIS VALUE -----
local cadURL = 'https://therocketcad.com/'
------   Insert Server ID into this variable (Found in Owner Panel > FiveM Integration) ----- 
local server = 'TXuU2'
--------------------------------------------------------

RegisterServerEvent("chatMessage")

AddEventHandler('chatMessage', function(source, n, message)
	if message == "/911" then
		
		CancelEvent()
		local name = GetPlayerName(source)
		TriggerClientEvent("911Location", source, name)
    elseif message == "/panic" then
		CancelEvent()
		local name = GetPlayerName(source)
		TriggerClientEvent("Location", source, name)
		TriggerClientEvent("PanicClicked", -1, name)
	end
end)

RegisterServerEvent("911locationUpdate")
AddEventHandler("911locationUpdate", function(street, cross, name)
		PerformHttpRequest(cadURL..'/api/1.1/wf/911', function(err, text, headers)
    if text then
		RconPrint("911 API Response: \n"..text)
    end
end, 'POST', json.encode({server = server,callerName = name,street = street,cross = cross}), { ["Content-Type"] = 'application/json' })

		CancelEvent()
end)

RegisterServerEvent("locationUpdate")
AddEventHandler("locationUpdate", function(street, cross, name)
		PerformHttpRequest(cadURL..'/api/1.1/wf/panic', function(err, text, headers)
    if text then
		RconPrint("911 API Response: \n"..text)
    end
end, 'POST', json.encode({server = server,name = name,street = street,cross = cross}), { ["Content-Type"] = 'application/json' })

		CancelEvent()
		TriggerClientEvent("locationUpdate", -1, street, cross)
end)
