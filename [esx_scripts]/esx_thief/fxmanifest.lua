fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
description 'ESX THIEF'

version '1.0.1'

client_scripts {
    '@es_extended/locale.lua',
	'locales/pl.lua',
    'locales/en.lua',
    'locales/fr.lua',
    'config.lua',
    'client/main.lua'
}

server_scripts {
    '@es_extended/locale.lua',
	'locales/pl.lua',
    'locales/en.lua',
    'locales/fr.lua',
    'config.lua',
	'server/main.lua'
}