fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


description 'ESX Speedcamera'

version '0.0.2'

server_scripts {
  'server/main.lua'
}

client_scripts {
  'client/main.lua'
}

ui_page('html/index.html')

files {
    'html/index.html'
}