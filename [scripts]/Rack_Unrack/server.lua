RegisterCommand('urr', function(source, args, user)
    local name = GetPlayerName(source)
    TriggerClientEvent("unrackrifle", -1, source, name)
end, false)

RegisterCommand('rr', function(source, args, user)
    local name = GetPlayerName(source)
    TriggerClientEvent("rackrifle", -1, source, name)
end, false)

RegisterCommand('ursg', function(source, args, user)
    local name = GetPlayerName(source)
    TriggerClientEvent("unracksg", -1, source, name)
end, false)

RegisterCommand('rsg', function(source, args, user)
    local name = GetPlayerName(source)
    TriggerClientEvent("racksg", -1, source, name)
end, false)