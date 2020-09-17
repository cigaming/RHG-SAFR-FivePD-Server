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
	end
end)

--[[RegisterServerEvent('grabServer')
AddEventHandler('grabServer', function(infrontPed, source)
  TriggerClientEvent('grab', infrontPed , source)
end)]]