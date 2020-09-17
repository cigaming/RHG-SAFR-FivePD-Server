fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
description 'ESX Drugs'

version '2.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fr.lua',	
	'locales/sv.lua',
	'config.lua',
	'server/main/weed.lua',
	'server/main/coke.lua',
	'server/main/spice.lua',
	'server/effects_sv.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fr.lua',	
	'locales/sv.lua',
	'config.lua',
	'client/main/weed.lua',
	'client/drugs/weed.lua',
	'client/effects_cl.lua',
	'client/drugs/coke.lua',
	'client/drugs/spice.lua'
}

dependencies {
	'es_extended'
}
