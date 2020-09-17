-- T R U N K --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/trunk" then
		CancelEvent()
		--------------
		TriggerClientEvent('trunk', s)
	end
end)
-- R E A R  D O O R S --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/rdoors" then
		CancelEvent()
		--------------
		TriggerClientEvent('rdoors', s)
	end
end)
-- H O O D --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/hood" then
		CancelEvent()
		--------------
		TriggerClientEvent('hood', s)
	end
end)
-- L O C K --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/l" then
		CancelEvent()
		--------------
		TriggerClientEvent('lock', s)
	end
end)
-- S A V E --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/save" then
		CancelEvent()
		--------------
		TriggerClientEvent('save', s)
	end
end)
-- R E M O T E --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/sveh" then
		CancelEvent()
		--------------
		TriggerClientEvent('controlsave', s)
	end
end)