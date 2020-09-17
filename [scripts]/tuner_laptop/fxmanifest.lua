fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_script "client.lua"
server_script "server.lua"

files {
	"html/index.html",
	"html/index.js",
	"html/config.js",
	"html/index.css",
	"html/bg.jpg",
	"html/bg-dark.jpg",
	"html/icons/filemgr.jpg",
	"html/icons/firefox.png",
	"html/icons/menu.png",
	"html/icons/tuner.png"
}

ui_page "html/index.html"

dependency "es_extended"