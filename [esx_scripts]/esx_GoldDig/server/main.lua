ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('esx_GoldDig:pickedUpCannabis')
AddEventHandler('esx_GoldDig:pickedUpCannabis', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.canCarryItem('gold_o', 1) then
		xPlayer.addInventoryItem('gold_o', 1)
	else
		xPlayer.showNotification(_U('gold_inventoryfull'))
	end
end)



ESX.RegisterServerCallback('esx_GoldDig:canPickUp', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)

	--cb(xPlayer.canCarryItem(item, 1))

	if xPlayer.canCarryItem(item, 1) then
		cb(true)
	else
		cb(false)
	end
end)
