RegisterNetEvent('notification')
AddEventHandler('notification', function(text, color, time)
	SendNUIMessage({text = text, color = color or 1 or 2, time = time or 10000})
end)

RegisterNetEvent('DoShortHudText')
AddEventHandler('DoShortHudText', function(text, color, time)
	SendNUIMessage({text = text, color = color or 1, time = time or 1000})
end)
