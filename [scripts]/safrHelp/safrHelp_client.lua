------- CHANGE THESE SETTINGS TO FIT YOUR NEEDS -------

-- Recommended total number of lines is ~13
local helpMessage = {
    'Press ~ or Tilda Key - brings up in game trainer',
    'Press [ or Open Bracket - to use cell phone',
    'Press 3 or Number 3 - to access personal inventory',
	'Type /helpv in chat for vehicle commands',
	'Type /helpc in chat for character commands and emotes',
	'Type /postal (postal number) without brackets to use gps to go to a specific postal',
    'Press Pge Down or Page Down - to access in game tablet & CAD',
	'Type /discord in chat to be linked to our discord - join us here for questions or help',
	'Type /ems - If your dead and NO EMS IS ONLINE - AI EMS WILL COME SAVE YOU',
}

-- Recommended total number of lines is ~13
local helpvMessage = {
	'Type /save to save your vehilce, then type/l to lock/unlock your vehicle.',
	'Type /eng to turn your engine on/off.',
	'Type /hood to open/close hood.',
	'Type /trunk to open/close trunk.',
	'Type /shuff to change seat possition in a vehicle',
    'Press UP ARROW and DOWN ARROW to roll windows up and down',
    'Press - and + to turn on vehilce turn signals, and BACKSPACE to turn on hazard lights ',
}

-- Recommended total number of lines is ~13
local helpcMessage = {
    'Type /emotes for  a list of playable chacter emotes',
    'Type /e (emote name) without the bracktes for your chacter to play an emote',
    'Type /hu in chat to put your hands up.',
    'Type /huk to put your hands up and get on your knees.',
    'Press B to point.',
}

-- Recommended total number of lines is ~13
local jobMessage = {
    'Civilian Jobs can be obtained at postal 3206',
    'Law Enforcement, Fire, and EMS are hiring. Join our discord today to apply!',
}

-- Recommended total number of lines is ~13
local discordMessage = {
    'Join us on Discord for questions or help',
    'https://discord.gg/jaHXFFV',
}
-- Recommended total number of lines is ~13
local rulesMessage = {
    'Role-play every situation out, there is no "Out of Character" in server.',
    'No RDM or VDM.',
    'No Cop Baiting.',
    'Use Common Sense',
    'Dont log off or enter an apartment or garage to avoid role play.',
    'Players can not kill or attack other players without role-play.',
    'Players can not intentionally use aerial vehicles to collide into other players or vehicles.',
    'Players can not abuse or exploit bugs.',
    'See our discord for rules and polices in our server.',
}

-- Prefixes will be displayed before each line,
local helpPrefix = '^7'
local helpSuffix = '^7.'
local helpvPrefix = '^7'
local helpvSuffix = '^7.'
local helpcPrefix = '^7'
local helpcSuffix = '^7.'
local jobPrefix = '^7.'
local jobSuffix = '^7.'
local discordPrefix = '^7'
local discordSuffix = '^7.'
local rulesPrefix = '^7'
local rulesSuffix = '7.'

-- Customize your /help and /rules command, if you wish.
local helpCommand = 'help' -- don't add a "/" here!
local helpvCommand = 'helpv' -- don't add a "/" here!
local helpcCommand = 'helpc' -- don't add a "/" here!
local jobCommand = 'job' -- don't add a "/" here!
local discordCommand = 'discord' -- don't add a "/" here!
local rulesCommand = 'rules' -- don't add a "/" here!
-------------------------------------------------------


















------- CODE, DON'T TOUCH THIS!!! -------
RegisterCommand(helpCommand, function()
    for i in pairs(helpMessage) do
        TriggerEvent('chatMessage', '', {255, 255, 255}, helpPrefix .. helpMessage[i] .. helpSuffix)
    end
end, false)

RegisterCommand(helpvCommand, function()
    for i in pairs(helpvMessage) do
        TriggerEvent('chatMessage', '', {255, 255, 255}, helpvPrefix .. helpvMessage[i] .. helpvSuffix)
    end
end, false)

RegisterCommand(helpcCommand, function()
    for i in pairs(helpcMessage) do
        TriggerEvent('chatMessage', '', {255, 255, 255}, helpcPrefix .. helpcMessage[i] .. helpcSuffix)
    end
end, false)

RegisterCommand(jobCommand, function()
    for i in pairs(jobMessage) do
        TriggerEvent('chatMessage', '', {255, 255, 255}, jobPrefix .. jobMessage[i] .. jobSuffix)
    end
end, false)

RegisterCommand(discordCommand, function()
    for i in pairs(discordMessage) do
        TriggerEvent('chatMessage', '', {255, 255, 255}, discordPrefix .. discordMessage[i] .. discordSuffix)
    end
end, false)

RegisterCommand(rulesCommand, function()
    for i in pairs(rulesMessage) do
        TriggerEvent('chatMessage', '', {255, 255, 255}, rulesPrefix .. rulesMessage[i] .. rulesSuffix)
    end
end, false)
TriggerEvent('chat:addSuggestion', '/' .. helpCommand, 'Displays a help message.')
TriggerEvent('chat:addSuggestion', '/' .. helpvCommand, 'Displays vehicle commands.')
TriggerEvent('chat:addSuggestion', '/' .. helpcCommand, 'Displays character commands and emotes.')
TriggerEvent('chat:addSuggestion', '/' .. jobCommand, 'Displays Job Information.')
TriggerEvent('chat:addSuggestion', '/' .. discordCommand, 'Displays Discord Link.')
TriggerEvent('chat:addSuggestion', '/' .. rulesCommand, 'Displays the server rules.')