ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('thermalvision', function(source)
    TriggerClientEvent('esx_thermalvision:useThermalVision', source)
end)
