version '1.0.2'
fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
client_script('client.lua')

server_script "@mysql-async/lib/MySQL.lua"
server_script "server.lua"

ui_page('html/index.html')

files({
  'html/index.html',
  'html/script.js',
  'html/style.css',
  'html/cursor.png',
})

exports {
  'openRegistry'
}