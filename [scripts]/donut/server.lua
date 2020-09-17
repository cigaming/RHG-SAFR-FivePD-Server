ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('donut', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('donut', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_donut:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'you have used 1x donut')
end)

ESX.RegisterUsableItem('donut2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('donut2', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 5000000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 5000000)
	TriggerClientEvent('esx_donut2:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'you have used 1x donut')
end)

ESX.RegisterUsableItem('taco4', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('taco4', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 5000000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 5000000)
	TriggerClientEvent('esx_taco4:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'you have used 1x taco')
end)

ESX.RegisterUsableItem('monster', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('monster', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_monster:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'you have used 1x taco')
end)