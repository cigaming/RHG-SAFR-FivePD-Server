 

ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


    ESX.RegisterServerCallback('Lenzh_chopshop:anycops',function(source, cb)
        local xPlayers = ESX.GetPlayers()
		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end
        cb(cops)
    end)

    RegisterServerEvent("lenzh_chopshop:rewards")
    AddEventHandler("lenzh_chopshop:rewards", function(rewards)
        --Rewards()
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
        if not xPlayer then return; end
        for k,v in pairs(Config.Items) do
            local randomCount = math.random(1, 3)
            if xPlayer.getInventoryItem(v).count >= xPlayer.getInventoryItem(v).weight then
                TriggerClientEvent('esx:showNotification', source, '~r~You cant carry anymore!')
            else
                xPlayer.addInventoryItem(v, randomCount)
            end
        end

    end)


    RegisterServerEvent('chopNotify')
    AddEventHandler('chopNotify', function()
        TriggerClientEvent("chopEnable", source)
    end)


    RegisterServerEvent('ChopInProgress')
    AddEventHandler('ChopInProgress', function()
        TriggerClientEvent("outlawChopNotify", -1, "")
    end)

    RegisterServerEvent('ChoppingInProgressPos')
    AddEventHandler('ChoppingInProgressPos', function(gx, gy, gz)
        TriggerClientEvent('Choplocation', -1, gx, gy, gz)
    end)


    RegisterServerEvent('lenzh_chopshop:sell')
    AddEventHandler('lenzh_chopshop:sell', function(itemName, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
        local price = Config.Itemsprice[itemName]
        local xItem = xPlayer.getInventoryItem(itemName)


        if xItem.count < amount then
            TriggerClientEvent('esx:showNotification', source, _U('not_enough'))
            return
        end

        price = ESX.Math.Round(price * amount)

        if Config.GiveBlack then
            xPlayer.addAccountMoney('black_money', price)
        else
            xPlayer.addMoney(price)
        end

        xPlayer.removeInventoryItem(xItem.name, amount)

        TriggerClientEvent('esx:showNotification', source, _U('sold', amount, xItem.label, ESX.Math.GroupDigits(price)))
    end)


    ESX.RegisterUsableItem('turbo', function(source)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
    
        xPlayer.removeInventoryItem('turbo', 1)
    
        TriggerClientEvent('esx_scrap:t', _source)
        TriggerClientEvent('esx:showNotification', _source, _U('used_one_turbo'))
    end)