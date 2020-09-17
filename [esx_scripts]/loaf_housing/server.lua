ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local instances = {}
local houses = {}

RegisterServerEvent('loaf_housing:enterHouse')
AddEventHandler('loaf_housing:enterHouse', function(id)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier}, function(result)
        local house = json.decode(result[1].house)
        local furniture = json.decode(result[1]['bought_furniture'])
        if house.houseId == id then
            for k, v in pairs(Config.HouseSpawns) do
                if not v['taken'] then
                    TriggerClientEvent('loaf_housing:spawnHouse', xPlayer.source, v['coords'], furniture)
                    instances[src] = {['id'] = id, ['owner'] = src, ['coords'] = v['coords'], ['housespawn'] = k, ['players'] = {}}
                    instances[src]['players'][src] = src
                    houses[id] = src
                    v['taken'] = true
                    return
                end
            end
        else
            print(('There seems to be some kind of error in the script "%s", #%s tried to enter house %s but he/she doesn\'t own house #%s.'):format(GetCurrentResourceName(), xPlayer.identifier, id, id))
        end
    end)
end)

RegisterServerEvent('loaf_housing:buy_furniture')
AddEventHandler('loaf_housing:buy_furniture', function(category, id)
    local xPlayer = ESX.GetPlayerFromId(source)
    local hadMoney = false
    if Config.Furniture[Config.Furniture['Categories'][category][1]][id] then
        if xPlayer.getAccount('bank').money >= Config.Furniture[Config.Furniture['Categories'][category][1]][id][3] then
            xPlayer.removeAccountMoney('bank', Config.Furniture[Config.Furniture['Categories'][category][1]][id][3])
            hadMoney = true
        else
            if xPlayer.getMoney() >= Config.Furniture[Config.Furniture['Categories'][category][1]][id][3] then
                xPlayer.removeMoney(Config.Furniture[Config.Furniture['Categories'][category][1]][id][3])
                hadMoney = true
            else
                TriggerClientEvent('esx:showNotifciation', xPlayer.source, Strings['no_money'])
            end
        end
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'There seems to be some kind of error in the script, could not buy furniture.')
    end

    if hadMoney then
        MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier}, function(result)
            local furniture = json.decode(result[1]['bought_furniture'])
            if furniture[Config.Furniture[Config.Furniture['Categories'][category][1]][id][2]] then 
                furniture[Config.Furniture[Config.Furniture['Categories'][category][1]][id][2]]['amount'] = furniture[Config.Furniture[Config.Furniture['Categories'][category][1]][id][2]]['amount'] + 1
            else
                furniture[Config.Furniture[Config.Furniture['Categories'][category][1]][id][2]] = {['amount'] = 1, ['name'] = Config.Furniture[Config.Furniture['Categories'][category][1]][id][1]}
            end
            MySQL.Async.execute("UPDATE users SET bought_furniture=@bought_furniture WHERE identifier=@identifier", {['@identifier'] = xPlayer.identifier, ['@bought_furniture'] = json.encode(furniture)}) 
            TriggerClientEvent('esx:showNotification', xPlayer.source, (Strings['Bought_Furniture']):format(Config.Furniture[Config.Furniture['Categories'][category][1]][id][1], Config.Furniture[Config.Furniture['Categories'][category][1]][id][3]))
        end)
    end
end)

RegisterServerEvent('loaf_housing:leaveHouse')
AddEventHandler('loaf_housing:leaveHouse', function(house)
    local src = source
    if instances[houses[house]]['players'][src] then
        local oldPlayers = instances[houses[house]]['players']
        local newPlayers = {}
        for k, v in pairs(oldPlayers) do
            if v ~= src then
                newPlayers[k] = v
            end
        end
        instances[houses[house]]['players'] = newPlayers
    end
end)

RegisterServerEvent('loaf_housing:deleteInstance')
AddEventHandler('loaf_housing:deleteInstance', function()
    local src = source
    if instances[src] then
        Config.HouseSpawns[instances[src]['housespawn']]['taken'] = false
        for k, v in pairs(instances[src]['players']) do
            TriggerClientEvent('loaf_housing:leaveHouse', v, instances[src]['id'])
        end
        instances[src] = {}
    end
end)

RegisterServerEvent('loaf_housing:letIn')
AddEventHandler('loaf_housing:letIn', function(plr, storage)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if instances[src] then
        if not instances[src]['players'][plr] then 
            instances[src]['players'][plr] = plr

            local spawnpos = instances[src]['housecoords']
            local furniture = instances[src]['furniture']
            TriggerClientEvent('loaf_housing:knockAccept', plr, instances[src]['coords'], instances[src]['id'], storage, spawnpos, furniture, src)
        end
    end
end)

RegisterServerEvent('loaf_housing:unKnockDoor')
AddEventHandler('loaf_housing:unKnockDoor', function(id)
    local src = source
    if instances[houses[id]] then
        TriggerClientEvent('loaf_housing:removeDoorKnock', instances[houses[id]]['owner'], src)
    end
end)

RegisterServerEvent('loaf_housing:knockDoor')
AddEventHandler('loaf_housing:knockDoor', function(id)
    local src = source
    if instances[houses[id]] then
        TriggerClientEvent('loaf_housing:knockedDoor', instances[houses[id]]['owner'], src)
    else
        TriggerClientEvent('esx:showNotification', src, Strings['Noone_Home'])
    end
end)

RegisterServerEvent('loaf_housing:setInstanceCoords')
AddEventHandler('loaf_housing:setInstanceCoords', function(coords, housecoords, prop, placedfurniture)
    local src = source
    if instances[src] then
        instances[src]['coords'] = coords
        instances[src]['housecoords'] = housecoords
        instances[src]['furniture'] = placedfurniture
    end
end)

RegisterServerEvent('loaf_housing:exitHouse')
AddEventHandler('loaf_housing:exitHouse', function(id)
    local src = source
    if instances[src] then
        for k, v in pairs(instances['players']) do
            TriggerClientEvent('loaf_housing:exitHouse', v, id)
            table.remove(instances, src)
            table.remove(houses, id)
        end
    else
        for k, v in pairs(instances) do
            if v['players'][src] then
                table.remove(v['players'], src)
            end
        end
    end
end)

RegisterServerEvent('loaf_housing:buyHouse')
AddEventHandler('loaf_housing:buyHouse', function(id)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier}, function(result)
        local house = json.decode(result[1].house)
        if house.houseId == 0 then
            MySQL.Async.fetchAll("SELECT * FROM bought_houses WHERE houseid=@houseid", {['@houseid'] = id}, function(result)
                local newHouse = ('{"owns":false,"furniture":[],"houseId":%s}'):format(id)
                if not result[1] then
                    if xPlayer.getAccount('bank').money >= Config.Houses[id]['price'] then
                        xPlayer.removeAccountMoney('bank', Config.Houses[id]['price'])
                        MySQL.Async.execute("UPDATE users SET house=@house WHERE identifier=@identifier", {['@identifier'] = xPlayer.identifier, ['@house'] = newHouse}) 
                        MySQL.Sync.execute("INSERT INTO bought_houses (houseid) VALUES (@houseid)", {['houseid'] = id})
                    else
                        if xPlayer.getMoney() >= Config.Houses[id]['price'] then
                            xPlayer.removeMoney(Config.Houses[id]['price'])
                            MySQL.Sync.execute("INSERT INTO bought_houses (houseid) VALUES (@houseid)", {['houseid'] = id})
                            MySQL.Async.execute("UPDATE users SET house=@house WHERE identifier=@identifier", {['@identifier'] = xPlayer.identifier, ['@house'] = newHouse}) 
                        else
                            TriggerClientEvent('esx:showNotification', xPlayer.source, Strings['No_Money'])
                        end
                    end
                end
            end)
        end
    end)
    Wait(1500)
    TriggerClientEvent('loaf_housing:reloadHouses', -1)
end)

RegisterServerEvent('loaf_housing:sellHouse')
AddEventHandler('loaf_housing:sellHouse', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier}, function(result)
        local house = json.decode(result[1].house)
        if Config.Houses[house.houseId]['price'] then
            xPlayer.addMoney(Config.Houses[house.houseId]['price'] * (Config.SellPercentage/100))
            TriggerClientEvent('esx:showNotification', xPlayer.source, (Strings['Sold_House']):format(math.floor(Config.Houses[house.houseId]['price'] * (Config.SellPercentage/100))))
            MySQL.Async.execute("UPDATE users SET house=@house WHERE identifier=@identifier", {['@identifier'] = xPlayer.identifier, ['@house'] = '{"owns":false,"furniture":[],"houseId":0}'}) 
            MySQL.Async.execute("DELETE FROM bought_houses WHERE houseid=@houseid", {['@houseid'] = house.houseId}) 
        end
    end)
    Wait(1500)
    TriggerClientEvent('loaf_housing:reloadHouses', -1)
end)

RegisterServerEvent('loaf_housing:getOwned')
AddEventHandler('loaf_housing:getOwned', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier}, function(result)
        local house = json.decode(result[1].house)
        MySQL.Async.fetchAll("SELECT * FROM bought_houses", {}, function(result)
            TriggerClientEvent('loaf_housing:setHouse', xPlayer.source, house, result)
        end)
    end)
end)

RegisterServerEvent('loaf_housing:furnish')
AddEventHandler('loaf_housing:furnish', function(house, furniture)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.execute("UPDATE users SET house=@house WHERE identifier=@identifier", {['@identifier'] = xPlayer.identifier, ['@house'] = json.encode(house)}) 
    MySQL.Async.execute("UPDATE users SET bought_furniture=@bought_furniture WHERE identifier=@identifier", {['@identifier'] = xPlayer.identifier, ['@bought_furniture'] = json.encode(furniture)}) 
end)

ESX.RegisterServerCallback('loaf_housing:hasGuests', function(source, cb)
    local hasGuest = false
    for k, v in pairs(instances[source]['players']) do
        local playerlist = GetPlayers()
        for id, src in pairs(playerlist) do
            if v ~= source and v == tonumber(src) then
                hasGuest = true
                break
            end
        end
    end
    cb(hasGuest)
end)

ESX.RegisterServerCallback('loaf_housing:hostOnline', function(source, cb, host)
    local online = false
    if instances[host] then
        local playerlist = GetPlayers()
        for id, src in pairs(playerlist) do
            if host == tonumber(src) then
                online = true
                break
            end
        end
        if not online then
            Config.HouseSpawns[instances[host]['housespawn']]['taken'] = false
            instances[host] = {}
        end
    end
    cb(online)
end)

ESX.RegisterServerCallback('loaf_housing:getInventory', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    cb({['items'] = xPlayer.inventory, ['weapons'] = xPlayer.getLoadout()})
end)

ESX.RegisterServerCallback('loaf_housing:getHouseInv', function(source, cb, owner)
	local xPlayer = ESX.GetPlayerFromId(source)
    local items, weapons = {}, {}
    
    if houses[owner] then
        if instances[houses[owner]] then
            local identifier = ESX.GetPlayerFromId(houses[owner])['identifier']

            TriggerEvent('esx_addoninventory:getInventory', 'housing', identifier, function(inventory)
                items = inventory.items
            end)

            TriggerEvent('esx_datastore:getDataStore', 'housing', identifier, function(storage)
                weapons = storage.get('weapons') or {}
            end)

            cb({['items'] = items, ['weapons'] = weapons})
        end
    end
end)

RegisterServerEvent('loaf_housing:withdrawItem')
AddEventHandler('loaf_housing:withdrawItem', function(type, item, amount, owner)
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if houses[owner] then
        if instances[houses[owner]] then
            local identifier = ESX.GetPlayerFromId(houses[owner])['identifier']
            if type == 'item' then

                TriggerEvent('esx_addoninventory:getInventory', 'housing', identifier, function(inventory)
                    if inventory.getItem(item)['count'] >= amount then
                        TriggerClientEvent('esx:showNotification', src, (Strings['You_Withdrew']):format(amount, inventory.getItem(item)['label']))
                        xPlayer.addInventoryItem(item, amount)
                        inventory.removeItem(item, amount)
                    else
                        TriggerClientEvent('esx:showNotification', src, Strings['Not_Enough_House'])
                    end
                end)

            elseif type == 'weapon' then

                TriggerEvent('esx_datastore:getDataStore', 'housing', identifier, function(weapons)
                    local loadout = weapons.get('weapons') or {}

                    for i = 1, #loadout do
                        if loadout[i]['name'] == item then
                            
                            table.remove(loadout, i)
                            weapons.set('weapons', loadout)
                            xPlayer.addWeapon(item, amount)

                            break
                        end
                    end
                end)
            end
        end

    end
    
end)

RegisterServerEvent('loaf_housing:storeItem')
AddEventHandler('loaf_housing:storeItem', function(type, item, amount, owner)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)

    if houses[owner] then
        if instances[houses[owner]] then
            local identifier = ESX.GetPlayerFromId(houses[owner])['identifier']
            if type == 'item' then

                if xPlayer.getInventoryItem(item)['count'] >= amount then
                    TriggerEvent('esx_addoninventory:getInventory', 'housing', identifier, function(inventory)
                        xPlayer.removeInventoryItem(item, amount)
                        inventory.addItem(item, amount)
                        TriggerClientEvent('esx:showNotification', src, (Strings['You_Stored']):format(amount, inventory.getItem(item)['label']))
                    end)
                else
                    TriggerClientEvent('esx:showNotification', src, Strings['Not_Enough'])
                end

            elseif type == 'weapon' then

                local loadout, hasweapon = xPlayer.getLoadout(), false
                for k, v in pairs(loadout) do
                    if v['name'] == item then
                        hasweapon = true
                        break
                    end
                end

                if hasweapon then
                    TriggerEvent('esx_datastore:getDataStore', 'housing', identifier, function(weapons)
                        local storage = weapons.get('weapons') or {}

                        table.insert(storage, {name = item, ammo = amount})

                        weapons.set('weapons', storage)
                        xPlayer.removeWeapon(item)
                    end)
                else
                    TriggerClientEvent('esx:showNotification', src, Strings['No_Weapon'])
                end
            end
        end

	end
end)