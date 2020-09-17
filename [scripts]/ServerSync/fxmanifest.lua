--ServerSync Resource made by Wyste for Fivem--
--Repository: https://github.com/Wyste/ServerSync --

fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


name 'ServerSync'
description 'Syncronizes Time/Weather/Wind and more.'
author 'Wyste (https://github.com/Wyste) | (https://discordapp.com/invite/byNc6wA)'
version 'v1.0'
url 'https://github.com/Wyste/ServerSync'

client_scripts {
    'ss_shared_functions.lua',
    'config/Keybinds.lua',
    'config/ServerSync.lua',
    'ss_cli_indicators.lua',
    'ss_cli_windows.lua',
    'ss_cli_traffic_crowd.lua',
    'ss_cli_weather.lua',
    'ss_cli_time.lua'
}

server_scripts {
    'ss_shared_functions.lua',
    'config/ServerSync.lua',
    'ss_srv_indicators.lua',
    'ss_srv_windows.lua',
    'ss_srv_weather.lua',
    'ss_srv_time.lua'
}