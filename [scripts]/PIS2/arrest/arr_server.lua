AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/arrest" then
		CancelEvent()
		--------------
		TriggerClientEvent('arrest', -1, s)
	elseif message == "/book" then
		CancelEvent()
		--------------
		TriggerClientEvent('book', -1, s)
	elseif message == "/unarrest" then
		CancelEvent()
		--------------
		TriggerClientEvent('unarrest', -1, s)
	elseif message == "/secure" then
		CancelEvent()
		--------------
		TriggerClientEvent('secure', -1, s)
	elseif message == "/unsecure" then
		CancelEvent()
		--------------
		TriggerClientEvent('unsecure', -1, s)
	
	elseif message == "/cpr" then
		CancelEvent()
		--------------
		TriggerClientEvent('revive', -1 , s)
	end
end)

RegisterServerEvent('grabServer')
AddEventHandler('grabServer', function(infrontPed, source)
  TriggerClientEvent('grab', -1 , source)
end)


RegisterServerEvent('synccuff')
AddEventHandler('synccuff', function(pedd, source)

numm = tonumber(pedd)

  TriggerClientEvent('sync', -1, numm)
end)

RegisterServerEvent('bookServer')
AddEventHandler('bookServer', function(bookingPed, source)
  TriggerClientEvent('book', -1, source)
end)

RegisterServerEvent("work")
AddEventHandler("work", function()
    print("Requested Items")
    local src = source
    TriggerClientEvent("laydown", -1, src)
end)