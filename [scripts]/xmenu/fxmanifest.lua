fx_version 'adamant'
game 'gta5'

name 'FiveM NUI Menu Manager'
description 'An NUI menu manager for FiveM'
author 'Xander1998'
url 'https://github.com/xander1998/xmenu'

ui_page("html/index.html")
files {
  "html/index.html",
  "html/events.js",
  "html/script.js",
  "html/style.css"
}

client_script "classes/*.lua"
client_script "utils.lua"
client_script "menu.lua"
client_script "client.lua"
client_script "example.lua"