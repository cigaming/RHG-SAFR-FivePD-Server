ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_test:revive', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getAccount('bank').money >= Config.Price then
		xPlayer.removeAccountMoney('bank', Config.Price)
		TriggerClientEvent('esx:showNotification', source, _U('you_paid', Config.Price))
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('esx_test:test')
AddEventHandler('esx_test:test', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	TriggerClientEvent('esx_ambulancejob:revive', target)
end)