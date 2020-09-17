ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('cburger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cburger', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 2500000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 2500000)
	TriggerClientEvent('esx_cburger:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'you have used 1x cheese burger')
end)

ESX.RegisterUsableItem('dcburger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('dcburger', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 5000000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 5000000)
	TriggerClientEvent('esx_dcburger:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'you have used 1x double cheese burger')
end)

ESX.RegisterUsableItem('fries', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fries', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 2500000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 2500000)
	TriggerClientEvent('esx_fries:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'you have used 1x small fries')
end)

ESX.RegisterUsableItem('fries2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fries2', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 5000000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 5000000)
	TriggerClientEvent('esx_fries2:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'you have used 1x large fries')
end)

ESX.RegisterUsableItem('sprite', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sprite', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 4500000)
	TriggerClientEvent('esx_sprite:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'you have used 1x sprite')
end)

ESX.RegisterUsableItem('cola', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cola', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 5000000)
	TriggerClientEvent('esx_cola:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'you have used 1x cola')
end)