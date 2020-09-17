fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name 'Monster Vault'
description 'An Vault script built for Monster ESX Framework - A Monster ESX Framework built for MonsterSrRP NOHD Nightmare'
author 'TaerAttO'
version 'v1.0.0'
url 'https://facebook.com/surapun.khongthong'

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua'
}

dependencies {
	'es_extended',
	'esx_addonaccount',
	'esx_addoninventory',
	'esx_datastore'
}

exports {
	"getMonsterVaultLicense"
}