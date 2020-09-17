ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_pd:buy')
AddEventHandler('esx_pd:buy', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.ShopItems[itemName]
	
	price = ESX.Math.Round(price * amount)

	xPlayer.removeMoney(price)

	xPlayer.addInventoryItem(itemName, amount)
end)
