fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'ESX License'

version '1.0.1'

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua'
}
