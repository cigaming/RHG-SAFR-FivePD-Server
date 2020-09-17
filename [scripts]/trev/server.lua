RegisterCommand("trev", function(from)
	TriggerClientEvent("TrevLol", from)
end, false)

RegisterCommand("ld", function(from)
	TriggerClientEvent("LamarLol", from)
end, false)

RegisterServerEvent("TrevNotify")
AddEventHandler('TrevNotify', function(inputText)
TriggerClientEvent('TrevNotifyText', -1, inputText)
end)

RegisterServerEvent("LamarNotify")
AddEventHandler('LamarNotify', function(inputText)
TriggerClientEvent('LamarNotifyText', -1, inputText)
end)

