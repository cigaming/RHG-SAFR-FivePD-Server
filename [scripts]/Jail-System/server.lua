ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("updateJailTime")
AddEventHandler("updateJailTime", function(minutes)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    MySQL.Async.execute("UPDATE `users` SET `jail` = '" .. minutes .. "' WHERE `identifier` = '" .. xPlayer["identifier"] .. "'")
end)

RegisterServerEvent("jail:firstSpawn")
AddEventHandler("jail:firstSpawn", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local showalert = alert

    MySQL.Async.fetchAll("SELECT `jail` FROM `users` WHERE identifier = '" .. xPlayer.getIdentifier() .. "'", {}, function(result)
        if result[1] and result[1].jail and tonumber(result[1].jail) > 0 then
            TriggerClientEvent("beginJail", src, tonumber(result[1].jail))
        end
	end)
end)

RegisterServerEvent("checkJailTime")
AddEventHandler("checkJailTime", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    MySQL.Async.fetchAll("SELECT `jail` FROM `users` WHERE identifier = '" .. xPlayer.getIdentifier() .. "'", {}, function(result)
        if result[1] and result[1].jail then
            TriggerClientEvent("TimeRemaining", src, tonumber(result[1].jail), tonumber(result[1].jail) and tonumber(result[1].jail) <= 0)
        end
	end)
end)

RegisterServerEvent("jail:saveItems")
AddEventHandler("jail:saveItems", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local data = { inventory = {}, loadout = {} }

    for k,v in pairs(xPlayer.inventory) do
        if v.count > 0 then
            xPlayer.setInventoryItem(v.name, 0)
            table.insert(data.inventory, { name = v.name, amount = v.count })
        end
    end

    for k,v in pairs(xPlayer.loadout) do
        xPlayer.removeWeapon(v.name)
        table.insert(data.loadout, v.name)
    end

    MySQL.Async.execute("UPDATE `users` SET `jailitems` = '" .. json.encode(data) .. "' WHERE `identifier` = '" .. xPlayer["identifier"] .. "'")
end)

RegisterServerEvent("jail:reclaimPossessions")
AddEventHandler("jail:reclaimPossessions", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    MySQL.Async.fetchAll("SELECT `jailitems` FROM `users` WHERE identifier = '" .. xPlayer["identifier"] .. "'", {}, function(result)
        if result[1] and result[1].jailitems then
            local jailitems = json.decode(result[1].jailitems)

            for k,v in pairs(jailitems.inventory) do
                local oldItem = xPlayer.getInventoryItem(v.name)
                if oldItem and oldItem["count"] > 0 then
                    xPlayer.removeInventoryItem(oldItem["name"], oldItem["count"])
                end

                xPlayer.addInventoryItem(v.name, v.amount)
            end
        
            for k,v in pairs(jailitems.loadout) do
                xPlayer.addWeapon(v)
            end

            MySQL.Async.execute("UPDATE `users` SET `jailitems` = '" .. json.encode({}) .. "' WHERE `identifier` = '" .. xPlayer["identifier"] .. "'") 
        end
    end)
end)

RegisterCommand('unjail', function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
        if args[1] and ESX.GetPlayerFromId(args[1]) then
            TriggerClientEvent("endJailTime", args[1])
        else
            TriggerClientEvent("notification", src, 'There are no player with this ID.', 2)
        end
    end
end)

RegisterCommand('jail', function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
        if args[1] and ESX.GetPlayerFromId(args[1]) then
            if args[2] then
                TriggerClientEvent("beginJail", args[1], args[2])
            else
                TriggerClientEvent("notification", src, 'Invaild jail time. wtf?', 2)
            end
        else
            TriggerClientEvent("notification", src, 'There are no player with this ID.', 2)
        end
    end
end)