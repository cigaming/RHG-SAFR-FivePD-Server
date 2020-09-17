fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
	'config.lua',
	'client/client.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/server.lua',
}

ui_page 'ui/index.html'

files {
	'ui/index.html',
	'ui/css/style.css',
	'ui/scripts/app.js',
	'ui/scripts/jquery.js',
	'ui/images/LSPD_logo_GTA_V.png',
}
