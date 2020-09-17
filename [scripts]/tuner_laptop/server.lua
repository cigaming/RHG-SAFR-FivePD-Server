ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem("tuning_laptop",function(source)
    local _source = source
    TriggerClientEvent("tuning:useLaptop",source)
end)

RegisterServerEvent("tuning:removeItem")
AddEventHandler("tuning:removeItem", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    --xPlayer.removeInventoryItem('tuning_laptop', 1)
end)