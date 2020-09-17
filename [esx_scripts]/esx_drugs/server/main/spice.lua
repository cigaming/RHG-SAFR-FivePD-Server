ESX = nil
local playersProcessingSpice = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_drugs:sellDrug')
AddEventHandler('esx_drugs:sellDrug', function(itemName, amount)
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

ESX.RegisterServerCallback('esx_drugs:buyLicense', function(source, cb, licenseName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local license = Config.LicensePrices[licenseName]

	if license == nil then
		print(('esx_drugs: %s attempted to buy an invalid license!'):format(xPlayer.identifier))
		cb(false)
	end

	if xPlayer.getMoney() >= license.price then
		xPlayer.removeMoney(license.price)

		TriggerEvent('esx_license:addLicense', source, licenseName, function()
			cb(true)
		end)
	else
		cb(false)
	end
end)

RegisterServerEvent('esx_drugs:pickedUpSpice')
AddEventHandler('esx_drugs:pickedUpSpice', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('cannabinoid')

	if xItem.weight ~= -1 and (xItem.count + 1) > xItem.weight then
		TriggerClientEvent('esx:showNotification', _source, _U('spice_inventoryfull'))
	else
		xPlayer.addInventoryItem(xItem.name, math.random(1, 4 ))
	end
end)

ESX.RegisterServerCallback('esx_drugs:canPickUp', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem(item)

	if xItem.weight ~= -1 and xItem.count >= xItem.weight then
		cb(false)
	else
		cb(true)
	end
end)

RegisterServerEvent('esx_drugs:processSpice')
AddEventHandler('esx_drugs:processSpice', function()
	if not playersProcessingSpice[source] then
		local _source = source

		playersProcessingSpice[_source] = ESX.SetTimeout(Config.Delays.SpiceProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xCannabinoid, xSpice = xPlayer.getInventoryItem('cannabinoid'), xPlayer.getInventoryItem('spice')

			if xSpice.weight ~= -1 and (xSpice.count + 1) >= xSpice.weight then
				TriggerClientEvent('esx:showNotification', _source, _U('spice_processingfull'))
			elseif xCannabinoid.count < 1 then
				TriggerClientEvent('esx:showNotification', _source, _U('spice_processingenough'))
			else
				xPlayer.removeInventoryItem('cannabinoid', 1)
				xPlayer.addInventoryItem('spice', math.random(2,4))

				TriggerClientEvent('esx:showNotification', _source, _U('spice_processed'))
			end

			playersProcessingSpice[_source] = nil
		end)
	else
		print(('esx_drugs: %s attempted to exploit spice processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingSpice[playerID] then
		ESX.ClearTimeout(playersProcessingSpice[playerID])
		playersProcessingSpice[playerID] = nil
	end
end

RegisterServerEvent('esx_drugs:cancelProcessing')
AddEventHandler('esx_drugs:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('esx:playerDropped', function(playerID, reason)
	CancelProcessing(playerID)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	CancelProcessing(source)
end)
