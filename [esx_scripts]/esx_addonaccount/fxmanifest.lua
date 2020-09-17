fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'ESX AddonAccount'

version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/classes/addonaccount.lua',
	'server/main.lua'
}
