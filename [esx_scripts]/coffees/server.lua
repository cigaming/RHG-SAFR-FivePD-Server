ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('coffeeshop:test') 
AddEventHandler('coffeeshop:test', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local milk = xPlayer.getInventoryItem('mleko').count
    if milk > 0 then
        Citizen.Wait(500)
        xPlayer.addInventoryItem('coffee', 1)
    else
        TriggerClientEvent('esx:showNotification', _source, '~y~You dont have any milk')   
    end
end)
