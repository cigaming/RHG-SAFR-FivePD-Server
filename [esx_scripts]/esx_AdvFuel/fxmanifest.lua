fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


client_script 'config.lua'
server_script 'config.lua'


ui_page 'notifs/index.html'

files {
	'notifs/index.html',
	'notifs/hotsnackbar.css',
	'notifs/hotsnackbar.js'
}


client_scripts {
	'notifs.lua',
	'map.lua',
	'client.lua',
	'GUI.lua',
	'models_c.lua'
}

server_scripts {
	'server.lua'
}