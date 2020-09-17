ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('global:advert')
AddEventHandler('global:advert', function(args)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Los Santos News', 'Annonce', table.concat(args, " "), 'CHAR_LIFEINVADER', 1)
	end
end)



RegisterServerEvent('wait:advert')
AddEventHandler('wait:advert', function()
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx:showAdvancedNotification', source, 'Los Santos News', 'Erreur', 'Merci de bien vouloir patienter avant de pouvoir refaire une annonce.', 'CHAR_LIFEINVADER', 1)
end)

RegisterServerEvent('job:advert')
AddEventHandler('job:advert', function()
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx:showAdvancedNotification', source, 'Los Santos News', 'Erreur', 'Merci de bien vouloir passer par un journaliste pour vos annonces.', 'CHAR_LIFEINVADER', 1)
end)