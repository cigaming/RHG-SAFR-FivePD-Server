fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

server_scripts {

'@es_extended/locale.lua',
'locales/en.lua',
'config.lua',
'server/esx_wash_sv.lua'
}

client_scripts {
'@es_extended/locale.lua',
'locales/en.lua',
'config.lua',
'client/esx_wash_cl.lua'
}

ui_page 'html/ui.html'

files {
'html/ui.html',
'html/pdown.ttf',
'html/img/cursor.png',
'html/css/app.css',
'html/scripts/app.js'
}
