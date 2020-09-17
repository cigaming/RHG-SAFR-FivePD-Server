--------------------------------------------------------
------   DO NOT CHANGE THIS VALUE -----
local cadURL = 'https://therocketcad.com/'
------   Insert Server ID into this variable (Found in Owner Panel > FiveM Integration) ----- 
--------------------------------------------------------
local deferrals1
AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
    deferrals1 = deferrals
    deferrals.defer()
    
    local s = source
	local joined = false
	
    deferrals.update("Please wait, checking whitelist")
	
	Wait(100)
    
    local steamIdentifier = ""

	-- Loop though the player's identifiers
    for myIdx,identifier in pairs(GetPlayerIdentifiers(s)) do
        if string.find(identifier, "steam") then
            steamIdentifier = identifier
            break
        end
    end

    if steamIdentifier == "" then
        deferrals.done("Error: Steam must be started")
        return
    end
    TriggerEvent("WhitelistChecker", steamIdentifier)
end)

AddEventHandler("returnState",function(hex, response)
    print(response)
    if response == true then
        RconPrint(hex.." was found in whitelist, accessed the server\n")
        deferrals1.done()
		return
    end
    RconPrint(hex.." was not found in the whitelist, access denied\n")
	deferrals1.done("You are not whitelisted. Please contact an Administrator")
end)


AddEventHandler("WhitelistChecker", function(hex)
    PerformHttpRequest(cadURL.."/api/1.1/wf/fivem_whitelist", function(err, text, headers)
    if text then
        local data = json.decode(text)
        TriggerEvent("returnState", hex, data.response.Status)
    elseif err then
        RconPrint(err.."\n")
    end
end, 'POST', json.encode({SteamHex = hex, ComCode = config.settings.code}), { ["Content-Type"] = 'application/json' })
        CancelEvent()
end)