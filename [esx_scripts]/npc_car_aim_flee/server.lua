ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("keys:checkMoneyDrop")
AddEventHandler("keys:checkMoneyDrop", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if Config.give_cash then
        if math.random()<=Config.give_cash_chance/100 then
            local cash = math.random(Config.give_cash_min,Config.give_cash_max)
            TriggerClientEvent('esx:showNotification', _source, Config.give_cash_msg:format(tostring(cash)))
            xPlayer.addMoney(tonumber(cash))
        end
    end
end)