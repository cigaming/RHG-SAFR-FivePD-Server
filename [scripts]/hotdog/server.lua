ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('hotdog', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hotdog', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_hotdog:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'you have used 1x hotdog')
end)

ESX.RegisterUsableItem('taco', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('taco', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_taco:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'you have used 1x taco')
end)

ESX.RegisterUsableItem('taco2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('taco2', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_taco2:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'you have used 1x taco')
end)

ESX.RegisterUsableItem('taco3', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('taco3', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_taco3:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'you have used 1x taco')
end)