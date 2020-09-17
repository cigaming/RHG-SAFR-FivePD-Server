--[[

		DUFX Mod Rexzooly(BadKiaPanda)

]]--

fx_version 'adamant'
games { 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description "DUFX Mod, Fox's Fix"

-- Disable this with -- if you want to use this stand alone.
--dependency 'essentialmode' -- Uncomment this to enable Essentialmode
ui_page('client/index.html')

files({
	"client/index.html",
	"client/sounds/drill.ogg"
})

server_scripts {
	'config.lua',
	'server/server.lua',
}
client_scripts {
	'config.lua',
	'client/dialog.lua',
	'client/client.lua'
}