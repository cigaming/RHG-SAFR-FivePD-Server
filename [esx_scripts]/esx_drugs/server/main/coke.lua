ESX = nil
local playersProcessingCoke = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterServerCallback('esx_drugs:anycops',function(source, cb)
	local xPlayers = ESX.GetPlayers()
	local cops = 0
	for i=1, #xPlayers, 1 do
	 local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	 if xPlayer.job.name == 'police' then
			cops = cops + 1
		end
	end
	cb(cops)
end)

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

RegisterServerEvent('esx_drugs:pickedUpCoke')
AddEventHandler('esx_drugs:pickedUpCoke', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('crack')

	if xItem.weight ~= -1 and (xItem.count + 1) > xItem.weight then
		TriggerClientEvent('esx:showNotification', _source, _U('coke_inventoryfull'))
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

RegisterServerEvent('esx_drugs:processCoke')
AddEventHandler('esx_drugs:processCoke', function()
	if not playersProcessingCoke[source] then
		local _source = source

		playersProcessingCoke[_source] = ESX.SetTimeout(Config.Delays.CokeProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xCrack, xCoke = xPlayer.getInventoryItem('crack'), xPlayer.getInventoryItem('coke')

			if xCoke.weight ~= -1 and (xCoke.count + 1) >= xCoke.weight then
				TriggerClientEvent('esx:showNotification', _source, _U('coke_processingfull'))
			elseif xCrack.count < 1 then
				TriggerClientEvent('esx:showNotification', _source, _U('coke_processingenough'))
			else
				xPlayer.removeInventoryItem('crack', 1)
				xPlayer.addInventoryItem('coke', math.random(2,4))

				TriggerClientEvent('esx:showNotification', _source, _U('coke_processed'))
			end

			playersProcessingCoke[_source] = nil
		end)
	else
		print(('esx_drugs: %s attempted to exploit coke processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingCoke[playerID] then
		ESX.ClearTimeout(playersProcessingCoke[playerID])
		playersProcessingCoke[playerID] = nil
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
