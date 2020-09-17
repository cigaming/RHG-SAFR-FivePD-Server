ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_pawn:sellDrug')
AddEventHandler('esx_pawn:sellDrug', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.DrugDealerItems[itemName]
	local xItem = xPlayer.getInventoryItem(itemName)



		if not price then
			print(('esx_drugs: %s attempted to sell an invalid drug!'):format(xPlayer.identifier))
			return
		end

		if xItem.count < amount then
			TriggerClientEvent('esx:showNotification', source, _U('dealer_notenough'))
			return
		end

		price = ESX.Math.Round(price * amount)

		if Config.GiveBlack then
			xPlayer.addAccountMoney('black_money', price)
		else
			xPlayer.addMoney(price)
		end

		xPlayer.removeInventoryItem(xItem.name, amount)

		TriggerClientEvent('esx:showNotification', source, _U('dealer_sold', amount, xItem.label, ESX.Math.GroupDigits(price)))
end)
