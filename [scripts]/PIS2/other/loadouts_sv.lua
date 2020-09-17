AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/loadout cop" then
		CancelEvent()
		--------------
		TriggerClientEvent('cop', s)
	elseif message == "/loadout reset" then
		CancelEvent()
		--------------
		TriggerClientEvent('reset', s)
	elseif message == "/carbine" then
		CancelEvent()
		--------------
		TriggerClientEvent('carbine', s)
	elseif message == "/drop" then
		CancelEvent()
		--------------
		TriggerClientEvent('drop', s)
	end
end)