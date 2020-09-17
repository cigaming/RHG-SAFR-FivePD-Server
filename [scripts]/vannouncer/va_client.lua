local m = {} -- <<< Don't touch this!
-----------[ SETTINGS ]---------------------------------------------------

-- Delay in minutes between messages
m.delay = 10

-- Prefix appears in front of each message. 
-- Suffix appears on the end of each message.
-- Leave a prefix/suffix empty ( '' ) to disable them.
m.prefix = '^1[AutoMessage] '
m.suffix = '^1.'

-- You can make as many messages as you want.
-- You can use ^0-^9 in your messages to change text color.
m.messages = {   
    '^0Join us on ^5 Discord @ https://discord.gg/jaHXFFV',
    '^0First Responder Roles (LEOS, Fire, & EMS) are Application Only, ALL DEPARTMENTS ARE RECRUITING - JOIN TODAY!',
    '^0Register on our CAD for Multiple CIV Charcters @ https://therocketcad.com/invite?code=SAFR',
    '^0Press Tilda Key ( ~ ) to access VMENU',
    '^0Press PageDown to access in game tablet for LAWS, RP RUELS, & In Game CAD access',
    '^0Press Open Bracket ( [ ) to access in game phone',
    '^0Press Open Bracket ( [ ) to access in game phone',
    '^0Press Open Bracket ( [ ) to access in game phone',
    '^0Visit /postal 3206 to go to the job center',
    '^0Visit /postal 3212 to buy a car',
    '^0Type /help for basic commands, /helpv for vehicle commands, /helpc for character commands',
}

-- Player identifiers on this list will not receive any messages.
-- Simply remove all identifiers if you don't want an ignore list.
m.ignorelist = { 
 --   'ip:127.0.1.5',
   -- 'steam:123456789123456',
     --'license:1654687313215747944131321',
}
--------------------------------------------------------------------------


















-----[ CODE, DON'T TOUCH THIS ]-------------------------------------------
local playerIdentifiers
local enableMessages = true
local timeout = m.delay * 1000 * 60 -- from ms, to sec, to min
local playerOnIgnoreList = false
RegisterNetEvent('va:setPlayerIdentifiers')
AddEventHandler('va:setPlayerIdentifiers', function(identifiers)
    playerIdentifiers = identifiers
end)
Citizen.CreateThread(function()
    while playerIdentifiers == {} or playerIdentifiers == nil do
        Citizen.Wait(1000)
        TriggerServerEvent('va:getPlayerIdentifiers')
    end
    for iid in pairs(m.ignorelist) do
        for pid in pairs(playerIdentifiers) do
            if m.ignorelist[iid] == playerIdentifiers[pid] then
                playerOnIgnoreList = true
                break
            end
        end
    end
    if not playerOnIgnoreList then
        while true do
            for i in pairs(m.messages) do
                if enableMessages then
                    chat(i)
                    print('[vAnnouncer] Message #' .. i .. ' sent.')
                end
                Citizen.Wait(timeout)
            end
            
            Citizen.Wait(0)
        end
    else
        print('[vAnnouncer] Player is on ignorelist, no announcements will be received.')
    end
end)
function chat(i)
    TriggerEvent('chatMessage', '', {255,255,255}, m.prefix .. m.messages[i] .. m.suffix)
end
RegisterCommand('automessage', function()
    enableMessages = not enableMessages
    if enableMessages then
        status = '^2enabled^5.'
    else
        status = '^1disabled^5.'
    end
    TriggerEvent('chatMessage', '', {255, 255, 255}, '^5[vAnnouncer] automessages are now ' .. status)
end, false)
--------------------------------------------------------------------------
