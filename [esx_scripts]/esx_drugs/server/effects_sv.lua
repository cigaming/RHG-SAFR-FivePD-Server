ESX.RegisterUsableItem('marijuana', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('marijuana', 1)

	TriggerClientEvent('esx_drugs:onPot', _source)
	TriggerClientEvent('esx_status:remove', source, 'hunger', 20000)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_weed'))
end)

ESX.RegisterUsableItem('coke', function(source)
        
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('coke', 1)

	TriggerClientEvent('esx_drugs:onCoke', source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_coke'))
end)

ESX.RegisterUsableItem('lsd', function(source)
        
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('lsd', 1)

	TriggerClientEvent('esx_drugs:onLsd', source)
end)

ESX.RegisterUsableItem('spice', function(source)
        
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('spice', 1)

	TriggerClientEvent('esx_drugs:onSpice', source)
end)

ESX.RegisterUsableItem('taco', function(source)
        
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('taco', 1)

	TriggerClientEvent('esx_drugs:onCoke', source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_coke'))
end)


ESX.RegisterUsableItem('vodka', function(source)
        
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('vodka', 1)

	TriggerClientEvent('esx_drugs:onVodka', source)
	TriggerClientEvent('esx_status:remove', source, 'thirst', 20000)
	TriggerClientEvent('esx_status:remove', source, 'hunger', 20000)
end)

ESX.RegisterUsableItem('beer', function(source)
        
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('beer', 1)

	TriggerClientEvent('esx_drugs:onBeer', source)
	TriggerClientEvent('esx_status:remove', source, 'thirst', 20000)
	TriggerClientEvent('esx_status:remove', source, 'hunger', 20000)
end)