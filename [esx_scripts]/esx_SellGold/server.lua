ESX = nil
local playersProcessing = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_SellGold:sell')
AddEventHandler('esx_SellGold:sell', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = config.items[itemName]
	local xItem = xPlayer.getInventoryItem(itemName)

	if not price then
		return
	end

	if xItem.count < amount then
		return
	end

	price = ESX.Math.Round(price * amount)
	xPlayer.addMoney(price)

	xPlayer.removeInventoryItem(xItem.name, amount)

end)


RegisterServerEvent('esx_SellGold:process')
AddEventHandler('esx_SellGold:process', function()
	if not playersProcessing[source] then
		local _source = source

		playersProcessing[_source] = ESX.SetTimeout(10000, function()

			local xPlayer = ESX.GetPlayerFromId(_source)
			local xCannabis, xMarijuana = xPlayer.getInventoryItem('gold_o'), xPlayer.getInventoryItem('gold_t')

			if xCannabis.count >= 1000 then
				if xPlayer.canSwapItem('gold_o', 1000, 'gold_t', 1) then
					xPlayer.removeInventoryItem('gold_o', 1000)
					xPlayer.addInventoryItem('gold_t', 1)

					xPlayer.showNotification(_U('gold_processed'))
				else
					xPlayer.showNotification(_U('gold_processingfull'))
				end
			else
				xPlayer.showNotification(_U('gold_processingenough'))
			end

			playersProcessing[_source] = nil
		end)
	else
		print(('esx_drugs: %s attempted to exploit gold processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)



function CancelProcessing(playerID)
	if playersProcessing[playerID] then
		ESX.ClearTimeout(playersProcessing[playerID])
		playersProcessing[playerID] = nil
	end
end

RegisterServerEvent('esx_SellGold:cancelProcessing')
AddEventHandler('esx_SellGold:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('esx:playerDropped', function(playerID, reason)
	CancelProcessing(playerID)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	CancelProcessing(source)
end)
