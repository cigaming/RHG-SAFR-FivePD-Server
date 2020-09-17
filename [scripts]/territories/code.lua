local ModReady = false
local SqlReady = false
ppprint = function(...)
end
eeerror = function(...)
end
if MySQL and type(MySQL) == "table" and MySQL.ready then
    print("[Territories]", "Found MySQL")
    MySQL.ready(
        function()
            print("[Territories]", "Sql Ready")
            SqlReady = true
        end
    )
end
ItemCheck = function()
    local reqItems = {}
    if not Territories or type(Territories) ~= "table" then
        return false
    end
    if not DrugPrices or type(DrugPrices) ~= "table" then
        return false
    end
    for k, v in pairs(Territories) do
        if not v or type(v) ~= "table" then
            return false
        end
        if not v.actions then
            break
        end
        for k, v in pairs(v.actions) do
            if not v or type(v) ~= "table" then
                return false
            end
            if v.requireItem then
                table.insert(reqItems, v.requireItem)
            end
            if v.rewardItem then
                table.insert(reqItems, v.rewardItem)
            end
        end
    end
    if DrugPrices then
        for k, v in pairs(DrugPrices) do
            if not v then
                return false
            end
            table.insert(reqItems, k)
        end
    end
    local finalRet = false
    MySQL.Async.fetchAll(
        "SELECT * FROM items",
        {},
        function(retData)
            if retData and type(retData) == "table" and retData[1] then
                local missedOne = false
                local lookup = {}
                for k, v in pairs(retData) do
                    lookup[v.name] = true
                end
                if reqItems and type(reqItems) == "table" then
                    for k, v in pairs(reqItems) do
                        if not lookup[v] then
                            missedOne = v
                        end
                    end
                end
                if not missedOne then
                    finalRet = 2
                else
                    finalRet = 1
                end
            else
                finalRet = 1
            end
        end
    )
    while not finalRet do
        Wait(0)
    end
    if finalRet ~= 2 then
        error("Does not have required items in SQL table.")
    end
    return (finalRet == 2)
end
SqlCheck = function()
    local dbconvar = GetConvar("mysql_connection_string", "Empty")
    if dbconvar == "Empty" then
        error("Local dbconvar is empty.")
        return
    end
    local strStart, strEnd = string.find(dbconvar, "database=")
    if not strStart or not strEnd then
        error(
            "Incorrect mysql_connection_string format. Needs 'server=myserver;uid=myuser;password=mypassword;database=mydatabase'"
        )
        return false
    end
    local dbStart, dbEnd = string.find(dbconvar, ";", strEnd)
    local dbName = string.sub(dbconvar, strEnd + 1, (dbEnd and dbEnd - 1 or dbconvar:len()))
    local dbTables = {["items"] = {"name"}}
    if not dbTables then
        return
    end
    for dbTable, columns in pairs(dbTables) do
        local doCont = false
        MySQL.Async.fetchAll(
            "SELECT * FROM INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA=@dbName AND TABLE_NAME=@tabName",
            {["@dbName"] = dbName, ["@tabName"] = dbTable},
            function(rData)
                if rData and type(rData) == "table" and rData[1] then
                    MySQL.Async.fetchAll(
                        "SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA=@dbName AND TABLE_NAME=@tabName",
                        {["@dbName"] = dbName, ["@tabName"] = dbTable},
                        function(retData)
                            if retData and type(retData) == "table" and retData[1] then
                                local lookup = {}
                                for k, v in pairs(retData) do
                                    if not v or type(v) ~= "table" or not v["COLUMN_NAME"] then
                                        error("Something is seriously fucked up with your sql table.")
                                        doCont = 1
                                        return false
                                    else
                                        lookup[v["COLUMN_NAME"]] = true
                                    end
                                end
                                if columns and type(columns) == "table" then
                                    for k, col in pairs(columns) do
                                        if not lookup[col] then
                                            doCont = 1
                                            error(
                                                "Does not have required SQL columns: " ..
                                                    dbName .. "." .. dbTable .. "." .. col
                                            )
                                            return false
                                        end
                                    end
                                    doCont = 2
                                    if DoDebug then
                                        print("Has all required SQL tables and columns.")
                                    end
                                end
                            else
                                error("Does not have required SQL columns: " .. dbName .. "." .. dbTable)
                                doCont = 1
                                return false
                            end
                        end
                    )
                else
                    error("Does not have required SQL table: " .. dbName .. "." .. dbTable)
                    doCont = 1
                    return false
                end
            end
        )
        while not doCont do
            Wait(0)
        end
        if doCont == 1 then
            return false
        else
            return true
        end
    end
end
Init = function()
    if not Config then
        return
    end
    while not ESX do
        Wait(0)
    end
    print("[Territories]", "Got ESX")
    if not ESX or type(ESX) ~= "table" then
        error("Could not find ESX.")
        return
    end
    while not SqlReady do
        Wait(0)
    end
    print("[Territories]", "Sql Ready")
    while not MySQL or not type(MySQL) == "table" or not MySQL.Async or not MySQL.Async.fetchAll or
        type(MySQL.Async.fetchAll) ~= "function" do
        Wait(0)
    end
    Wait(1000)
    local doCont = true
    doCont = (doCont and SqlCheck() or false)
    doCont = (doCont and ItemCheck() or false)
    Start()
    if doCont then
        MySQL.Async.fetchAll(
            "SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME=@tableName",
            {["@tableName"] = "territories"},
            function(data)
                if data and type(data) == "table" then
                    MySQL.Async.fetchAll(
                        "SELECT * FROM territories",
                        {},
                        function(retData)
                            if retData and type(retData) == "table" and retData[1] then
                                for k, v in pairs(retData) do
                                    if v and v.zone and v.control and v.influence and Territories[v.zone] then
                                        Territories[v.zone].control = v.control
                                        Territories[v.zone].influence = v.influence
                                    end
                                end
                            end
                            ModReady = doCont
                            if ModReady then
                                Update()
                            end
                        end
                    )
                else
                    ModReady = doCont
                    if ModReady then
                        Update()
                    end
                end
            end
        )
    end
end
Start = function()
    if Territories and type(Territories) == "table" then
        for k, v in pairs(Territories) do
            Territories[k].players = {}
        end
    end
end

Update = function()
    while true do
        local now = GetGameTimer()
        if (not lastTime) or (now - lastTime > (Config and Config.InfluenceTick or 5000)) then
            lastTime = now
            TallyUp()
        end
        if (not lastSave) or (now - lastSave > (Config and Config.SqlSaveTimer or 5) * 60 * 1000) then
            lastSave = now
            MySQL.Async.fetchAll(
                "SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME=@territories",
                {["@territories"] = "territories"},
                function(retData)
                    if retData and type(retData) == "table" and retData[1] then
                        if Territories and type(Territories) == "table" then
                            for k, v in pairs(Territories) do
                                if v and type(v) == "table" and v.control and v.influence then
                                    MySQL.Async.execute(
                                        "UPDATE territories SET control=@control,influence=@influence WHERE zone=@zone",
                                        {["@control"] = v.control, ["@influence"] = v.influence, ["@zone"] = k}
                                    )
                                end
                            end
                        end
                    end
                end
            )
        end
        Wait(0)
    end
end
MarketAccess = {}
MarketCheck = function()
    local controlling = {}
    if Territories and type(Territories) == "table" then
        for k, v in pairs(Territories) do
            if v and type(v) == "table" and v.control then
                controlling[v.control] = (controlling[v.control] or 0) + 1
            end
        end
        for k, v in pairs(controlling) do
            if v >= 2 then
                if not MarketAccess[k] then
                    MarketAccess[k] = true
                    TriggerClientEvent("Territories:GotMarketAccess", -1, k)
                end
            else
                if MarketAccess[k] then
                    MarketAccess[k] = false
                    TriggerClientEvent("Territories:LostMarketAccess", -1, k)
                end
            end
        end
    end
end

TallyUp = function()
    local doUpdate = false
    if not Territories or not type(Territories) == "table" then
        return
    end
    for k, v in pairs(Territories) do
        if v and type(v) == "table" and v.control and v.influence then
            local mostMembers, memberCount, isDraw = GetActiveMembers(v)
            if mostMembers then
                if isDraw then
                    if v.control == mostMembers or v.control == isDraw then
                    else
                        doUpdate = true
                        v.influence = math.max(0.0, v.influence - 1.0)
                    end
                else
                    if v.control == mostMembers then
                        doUpdate = true
                        v.influence = math.min(100.0, v.influence + 1.0)
                    else
                        doUpdate = true
                        v.influence = math.max(0.0, v.influence - 1.0)
                        if v.influence <= 0.0 then
                            v.control = mostMembers
                        end
                    end
                end
            end
        end
    end
    if doUpdate then
        TriggerClientEvent("Territories:Sync", -1, Territories)
    end
end

GetActiveMembers = function(tab)
    local scores = {}
    if not tab or type(tab) ~= "table" or not tab.players or type(tab.players) ~= "table" then
        return
    end
    for k, v in pairs(tab.players) do
        if v then
            if not scores[v] then
                scores[v] = 1
            else
                scores[v] = scores[v] + 1
            end
        end
    end
    local isDraw = false
    local highest, highestScore
    for k, v in pairs(scores) do
        if not highestScore or v >= highestScore then
            if not highestScore or v > highestScore then
                highestScore = v
                highest = k
                isDraw = false
            else
                isDraw = k
            end
        end
    end
    return highest, highestScore, isDraw
end

EnterZone = function(zone, job)
    local _source = source
    while not ModReady do
        Wait(0)
    end
    if
        not Territories or type(Territories) ~= "table" or not Territories[zone] or type(Territories[zone]) ~= "table" or
            not Territories[zone].players
     then
        return
    end
    Territories[zone].players[_source] = job
end

LeaveZone = function(zone, job)
    local _source = source
    while not ModReady do
        Wait(0)
    end
    if
        not Territories or type(Territories) ~= "table" or not Territories[zone] or type(Territories[zone]) ~= "table" or
            not Territories[zone].players
     then
        return
    end
    Territories[zone].players[_source] = nil
end
GetPlayer = function(player)
    while not ModReady do
        Wait(0)
    end
    local xPlayer = ESX.GetPlayerFromId(player)
    while not xPlayer do
        xPlayer = ESX.GetPlayerFromId(player)
        Wait(0)
    end
    return xPlayer
end

GetPlayerGang = function(source)
    local xPly = GetPlayer(_source)
    local job = xPly.job.name
    local job2 = (xPly.job2 and xPly.job2.name or false)
    if GangLookup[job] then
        return job.name
    elseif GangLookup[job2] then
        return job2.name
    else
        return false
    end
end
PlayerKilled = function(killer, zone)
    while not ModReady do
        Wait(0)
    end
    local _source = source
    local slayer = killer
    local sourceGang = GetPlayerGang(source)
    local killerGang = GetPlayerGang(killer)
    if not sourceGang or not killerGang then
        return
    end
    local doSync = false
    local influencer = false
    if GangLookups and sourceGang and killerGang then
        local v = Territories[zone]
        if not v or type(v) ~= "table" or not v.control or not v.influence then
            return
        end
        if v.control == sourceGang then
            v.influence = math.max(0, v.influence - 10)
            doSync = true
            influencer = v.control
        elseif v.control == killerGang then
            v.influence = math.min(100, v.influence + 10)
            doSync = true
            influencer = v.control
        end
    elseif killerGang then
        local v = Territories[zone]
        if not v then
            return
        end
        if v.control == killerGang then
            v.influence = math.min(100, v.influence + 5)
            doSync = true
            influencer = v.control
        end
    elseif sourceGang then
        local v = Territories[zone]
        if not v then
            return
        end
        if v.control == sourceGang then
            v.influence = math.max(0, v.influence - 5)
            doSync = true
            influencer = v.control
        end
    end
    if doSync then
        TriggerClientEvent("Territories:Sync", -1, Territories)
    end
end

RewardPlayer = function(action)
    local _source = source
    while not ModReady do
        Wait(0)
    end
    if not InventoryChecked or InventoryChecked == 1 then
        return
    end
    local xPlayer = GetPlayer(_source)
    if not xPlayer then
        error("Could not find xPlayer.")
        return
    end
    if action and type(action) == "table" then
        local tookRequired, requiredItem = false, false
        if action.requireItem and action.requireRate and action.requireRate > 0 then
            local itemData = xPlayer.getInventoryItem(action.requireItem, action.requireRate)
            if itemData and itemData.count and itemData.count >= action.requireRate then
                xPlayer.removeInventoryItem(action.requireItem, action.requireRate)
                tookRequired = true
            end
            requiredItem = true
        elseif action.requireCash and action.requireCash > 0 then
            local itemData = xPlayer.getAccount(Config.DirtyAccount)
            if itemData and itemData.money and itemData.money >= action.requireCash then
                xPlayer.removeAccountMoney(Config.DirtyAccount, action.requireCash)
                tookRequired = true
            end
            requiredItem = true
        end
        if (requiredItem and tookRequired) or (not requiredItem) then
            if action.rewardItem and action.rewardRate then
                local canContinue = true
                local giveCount = (action.rewardRate or 1)
                if Config.UsingItemLimit then
                    canContinue = false
                    local itemData = xPlayer.getInventoryItem(action.rewardItem)
                    if itemData and itemData.limit then
                        canContinue = (((itemData.count or 0) + giveCount) <= itemData.limit)
                    end
                elseif Config.UsingWeightLimit then
                    if type(xPlayer.canCarryItem) == "table" or type(xPlayer.canCarryItem) == "function" then
                        canContinue = xPlayer.canCarryItem(action.rewardItem, giveCount)
                    end
                end
                if canContinue then
                    xPlayer.addInventoryItem(action.rewardItem, giveCount)
                else
                    TriggerClientEvent("esx:showNotification", _source, "~r~You can't carry this much of this item.~s~")
                end
            elseif action.rewardCash and action.rewardCash > 0 then
                xPlayer.addMoney(action.rewardCash)
            end
        else
            print(
                "[" ..
                    _source ..
                        "] : " .. GetPlayerName(_source) .. " - Tried cheating during drug processing at territories."
            )
            if Config.SmackCheaters then
                TriggerClientEvent("Territories:Smacked", _source)
            end
        end
    end
end

SoldDrugs = function(drug, count, zone)
    local _source = source
    while not ModReady do
        Wait(0)
    end
    if not InventoryChecked or InventoryChecked == 1 then
        return
    end
    local _source = source
    local xPlayer = GetPlayer(_source)
    if not xPlayer then
        error("Could not find xPlayer.")
        return
    end
    local item = xPlayer.getInventoryItem(drug)
    if item.count < count then
        count = item.count
        print(
            "Someone is cheating: " ..
                _source .. ", did not have the same amount of items in inventory as expected. Probably trying to dupe."
        )
    end
    if not DrugPrices or not DrugPrices[drug] then
        error("Drug Prices not set correctly in config.lua.")
        return
    end
    xPlayer.removeInventoryItem(drug, count)
    if
        Territories and type(Territories) == "table" and Territories[zone] and type(Territories[zone]) == "table" and
            Territories[zone].influence
     then
        Territories[zone].influence = math.min(100, Territories[zone].influence + 1)
        TriggerClientEvent("Territories:Sync", -1, Territories)
    end
    local payout = math.floor(DrugPrices[drug] * count)
    if Config and type(Config) == "table" and Config.DirtyReward and Config.DirtyAccount then
        local accounts = xPlayer.getAccounts()
        if accounts and type(accounts) == "table" then
            for k, v in pairs(accounts) do
                if v and v.name and Config.DirtyAccount and v.name == Config.DirtyAccount then
                    xPlayer.addAccountMoney(v.name, payout)
                    return
                end
            end
        end
        error("Could not find DirtyAccount in config.lua.")
        return
    else
        xPlayer.addMoney(payout)
    end
end
vDist = function(v1, v2)
    if not v1 or not v2 or not v1.x or not v2.x or not v1.z or not v2.z then
        return 0
    end
    return math.sqrt(
        ((v1.x - v2.x) * (v1.x - v2.x)) + ((v1.y - v2.y) * (v1.y - v2.y)) + ((v1.z - v2.z) * (v1.z - v2.z))
    )
end
Handcuffed = function(target)
    local _source = source
    local sourceGang = GetPlayerGang(_source)
    local targetGang = GetPlayerGang(target)
    if not sourceGang or not targetGang then
        return
    end
    if sourceGang and PoliceLookup[sourceGang] == true then
        if targetGang then
            TriggerClientEvent("Territories:GotCuffed", target)
        end
    end
end
CuffSuccess = function(zone)
    local _source = source
    local sourceGang = GetPlayerGang(_source)
    if not sourceGang then
        return
    end
    local v = Territories[zone]
    if not v or type(v) ~= "table" or not v.control or not v.influence then
        return
    end
    if v.control == sourceGang then
        v.influence = math.max(0, v.influence - 10)
        TriggerClientEvent("Territories:Sync", -1, Territories)
    elseif PoliceLookup and type(PoliceLookup) == "table" and PoliceLookup[v.control] then
        v.influence = math.min(100, v.influence + 10)
        TriggerClientEvent("Territories:Sync", -1, Territories)
    end
end
PlayerLogin = function()
    local _source = source
    while not ModReady do
        Wait(0)
    end
    if InventoryChecked then
        TriggerClientEvent("Territories:StartRet", _source, (InventoryChecked == 2 and true or false), Territories)
        return
    end
    local xPlayer = GetPlayer(_source)
    local inventory = xPlayer.getInventory()
    local inventoryLookup = {}
    local reqItems = {}
    if not inventory or type(inventory) ~= "table" then
        return
    end
    for k, v in pairs(inventory) do
        inventoryLookup[v.name] = true
    end
    if not Territories or type(Territories) ~= "table" then
        return
    end
    for k, v in pairs(Territories) do
        if not v or type(v) ~= "table" or not v.actions then
            return false
        end
        for k, v in pairs(v.actions) do
            if v and type(v) == "table" and v.requireItem then
                table.insert(reqItems, v.requireItem)
            end
            if v and type(v) == "table" and v.rewardItem then
                table.insert(reqItems, v.rewardItem)
            end
        end
    end
    if not DrugPrices or type(DrugPrices) ~= "table" then
        return
    end
    for k, v in pairs(DrugPrices) do
        if not k or not v then
            return false
        end
        table.insert(reqItems, k)
    end
    if not reqItems or type(reqItems) ~= "table" then
        return
    end
    for k, v in pairs(reqItems) do
        if not inventoryLookup or not inventoryLookup[v] then
            error("Could not find inventory item: " .. tostring(v))
            InventoryChecked = 1
            TriggerClientEvent("Territories:StartRet", _source, false, Territories)
            return
        end
    end
    InventoryChecked = 2
    TriggerClientEvent("Territories:StartRet", _source, true, Territories)
end
Reported = function(pos)
    TriggerClientEvent("Territories:PlayerReported", -1, pos)
end
PlayerDropped = function()
    for zone, territory in pairs(Territories) do
        for server_id, gang in pairs(territory.players) do
            if server_id == source then
                Territories[zone].players[server_id] = nil
                return
            end
        end
    end
end
Utils.event(1, EnterZone, "Territories:EnterZone")
Utils.event(1, LeaveZone, "Territories:LeaveZone")
Utils.event(1, PlayerKilled, "Territories:GotMurdered")
Utils.event(1, RewardPlayer, "Territories:RewardPlayer")
Utils.event(1, SoldDrugs, "Territories:SoldDrugs")
Utils.event(1, CuffSuccess, "Territories:CuffSuccess")
Utils.event(1, PlayerLogin, "Territories:PlayerLogin")
Utils.event(1, Reported, "Territories:Reported")
Utils.event(1, Handcuffed, "esx_policejob:handcuff")
Utils.event(1, PlayerDropped, "playerDropped")
Citizen.CreateThread(Init)
