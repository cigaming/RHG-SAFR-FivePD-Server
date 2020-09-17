ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('gcPhone:getCars', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return; end
    MySQL.Async.fetchAll("SELECT plate, vehicle, stored FROM owned_vehicles WHERE owner = @cid and type = @type", {
        ["@cid"] = xPlayer.identifier,
        ["@type"] = "car"
    }, function(responses)
        local playerVehicles = {}

        for key, vehicleData in ipairs(responses) do
            table.insert(playerVehicles, {
                ["garage"] = vehicleData["stored"],
                ["plate"] = vehicleData["plate"],
                ["props"] = json.decode(vehicleData["vehicle"])
            })
        end

        cb(playerVehicles)
    end)
end)

RegisterServerEvent('gcPhone:finish')
AddEventHandler('gcPhone:finish', function(plate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx:showNotification', _source, _U('vale_get'))
	xPlayer.removeAccountMoney('bank', Config.ValePrice)
end)

RegisterServerEvent('gcPhone:valet-car-set-outside')
AddEventHandler('gcPhone:valet-car-set-outside', function(plate)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer then
        MySQL.Async.insert('UPDATE owned_vehicles SET stored = @stored WHERE plate = @plate', {
            ['@plate'] = plate,
            ['@stored'] = 0
        })
    end
end)

--====================================================================================
-- EXTRA LEAKS | https://discord.gg/extraleaks
--====================================================================================