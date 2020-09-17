ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('global:advert')
AddEventHandler('global:advert', function(args)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Los Santos News', 'Advert', table.concat(args, " "), 'CHAR_LIFEINVADER', 1)
	end
end)



RegisterServerEvent('wait:advert')
AddEventHandler('wait:advert', function()
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx:showAdvancedNotification', source, 'Los Santos News', 'Error', 'Please wait before sending a new ad.', 'CHAR_LIFEINVADER', 1)
end)

RegisterServerEvent('job:advert')
AddEventHandler('job:advert', function()
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx:showAdvancedNotification', source, 'Los Santos News', 'Error', 'you must be a taxi driver.', 'CHAR_LIFEINVADER', 1)
end)