fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

version '1.0.1'

ui_page "nui/meter.html"

files {
	"nui/digital-7.regular.ttf",
	"nui/meter.html",
	"nui/meter.css",
	"nui/meter.js"
}

client_scripts{
  'config.lua',
  'client/main.lua'
}

server_scripts{
  'config.lua',
  'server/main.lua'
}
