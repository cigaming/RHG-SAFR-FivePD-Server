local dbReady = false
local tableQuery = "CREATE TABLE IF NOT EXISTS `criminal_records` ( `id` int(11) NOT NULL UNIQUE auto_increment, `offence` varchar(250) NOT NULL ,`user_id` varchar(250) NOT NULL, `officer_id` varchar(250) NOT NULL, `jail` int(11), `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY(`id`))"
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('onMySQLReady', function ()
	MySQL.Async.execute(tableQuery, {}, function() end)
	print("Executed Criminal records table query")
	Wait(100)
	dbReady = true
end)

RegisterServerEvent('esx_police_cad:search-plate')
AddEventHandler('esx_police_cad:search-plate', function(plate)
    MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE plate = @plate", {['@plate'] = plate},
        function (result)
            if (result[1] ~= nil) then
                MySQL.Async.fetchAll('SELECT identifier,firstname,lastname FROM users WHERE identifier = @identifier', {['@identifier'] = result[1].owner},
                       function (result2)
                           if (result2[1] ~= nil) then
                              TriggerClientEvent('esx_police_cad:showdataplate', -1, result[1].plate,result[1].modelname ,result2[1].firstname,result2[1].lastname)
                           else
                               TriggerClientEvent('esx_police_cad:showdateplateNotFound', -1)
                           end
                   end)
            else
                TriggerClientEvent('esx_police_cad:showdateplateNotFound', -1)
            end
    end)
end)

RegisterServerEvent('esx_police_cad:search-players')
AddEventHandler('esx_police_cad:search-players', function(search)
        MySQL.Async.fetchAll("SELECT * FROM users WHERE CONCAT(firstname, ' ', lastname) LIKE @search COLLATE utf8_general_ci", {['@search'] = '%'..search..'%'},
               function (result)
                   if (result ~= nil) then
                      TriggerClientEvent('esx_police_cad:returnsearch', -1, result)
                   else
                       TriggerClientEvent('esx_police_cad:noresults', -1)
                   end
           end)
end)


RegisterServerEvent('esx_police_cad:add-cr')
AddEventHandler('esx_police_cad:add-cr', function(data, officer)
    MySQL.Async.execute("INSERT INTO criminal_records SET offence = @offence, user_id = @user_id, officer_id = @officer_id, jail = @jail", {
        ['@offence'] = data.offence,
        ['@user_id'] = data.playerid,
        ['@officer_id'] = officer,
        ['@jail'] = data.jail
    },
        function (result)
            if (result ~= nil) then

            end
    end)
end)

RegisterServerEvent('esx_police_cad:get-cr')
AddEventHandler('esx_police_cad:get-cr', function(playerid)
    MySQL.Async.fetchAll("SELECT * FROM criminal_records WHERE user_id = @user_id", {['@user_id'] = playerid},
        function (result)
            if (result[1] ~= nil) then
                for key,value in pairs(result) do
                    result[key] = value
                    MySQL.Async.fetchAll("SELECT * FROM criminal_records WHERE user_id = @user_id", {['@user_id'] = playerid},
                            function (result)
--                                result['officer'] = result[1].firstname .. ' ' .. result[1].lastname
                        end)
                end
                TriggerClientEvent('esx_police_cad:show-cr', -1, result)
        end
    end)
end)

RegisterServerEvent('esx_police_cad:get-license')
AddEventHandler('esx_police_cad:get-license', function(playerid)
    MySQL.Async.fetchAll("SELECT * FROM user_licenses WHERE owner = @user_id", {['@user_id'] = playerid},
        function (result)
            if (result[1] ~= nil) then
                TriggerClientEvent('esx_police_cad:show-license', -1, result)
        end
    end)
end)

