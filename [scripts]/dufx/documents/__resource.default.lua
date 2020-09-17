--[[

		DUFX Mod Rexzooly(BadKiaPanda)

]]--

resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'
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