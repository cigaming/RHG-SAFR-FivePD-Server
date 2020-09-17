ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('esx_blackmoney:washMoney')
AddEventHandler('esx_blackmoney:washMoney', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local accountMoney = 0
	
	accountMoney = xPlayer.getAccount('black_money').money

	if accountMoney < 99 then
		notification('You do not have enough ~r~dirty money~s~ to wash')
	else
		xPlayer.removeAccountMoney('black_money', 100)
		xPlayer.addMoney(100)
		notification('You ~g~washed~s~ 100 ~r~dirty money')
	end
end)

function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end