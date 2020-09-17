ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('silencieux', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('silencieux', 1)
    TriggerClientEvent('nfw_wep:silencieux', source)
end)

ESX.RegisterUsableItem('flashlight', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('flashlight', 1)
    TriggerClientEvent('nfw_wep:flashlight', source)
end)

ESX.RegisterUsableItem('grip', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('grip', 1)
    TriggerClientEvent('nfw_wep:grip', source)
end)

ESX.RegisterUsableItem('yusuf', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('yusuf', 1)
    TriggerClientEvent('nfw_wep:yusuf', source)
end)

ESX.RegisterUsableItem('SmallArmor', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('SmallArmor', 1)
    TriggerClientEvent('nfw_wep:SmallArmor', source)
end)

ESX.RegisterUsableItem('MedArmor', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('MedArmor', 1)
    TriggerClientEvent('nfw_wep:MedArmor', source)
end)

ESX.RegisterUsableItem('HeavyArmor', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('HeavyArmor', 1)
    TriggerClientEvent('nfw_wep:HeavyArmor', source)
end)

ESX.RegisterUsableItem('HeavyArmor', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('HeavyArmor', 1)
    TriggerClientEvent('nfw_wep:HeavyArmor', source)
end)

ESX.RegisterUsableItem('lowrider', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('lowrider', 1)
    TriggerClientEvent('nfw_wep:lowrider', source)
end)

ESX.RegisterUsableItem('pAmmo', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pAmmo', 1)
    TriggerClientEvent('nfw_wep:pAmmo', source)
end)

ESX.RegisterUsableItem('mgAmmo', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('mgAmmo', 1)
    TriggerClientEvent('nfw_wep:mgAmmo', source)
end)

ESX.RegisterUsableItem('arAmmo', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('arAmmo', 1)
    TriggerClientEvent('nfw_wep:arAmmo', source)
end)

ESX.RegisterUsableItem('sgAmmo', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('sgAmmo', 1)
    TriggerClientEvent('nfw_wep:sgAmmo', source)
end)

RegisterNetEvent('returnItem')
AddEventHandler('returnItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(item, 1)
end)