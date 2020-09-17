fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
	"@es_extended/locale.lua",
    "client.lua",
	'@mysql-async/lib/MySQL.lua'
}

server_scripts {
	"serveren.lua",
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua'
	
}

dependencies {
	'es_extended'
}
