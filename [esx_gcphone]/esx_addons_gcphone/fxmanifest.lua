client_script {
	"client.lua"
}

server_script {
	'@mysql-async/lib/MySQL.lua',
	"server.lua"
}


-- {
-- 	"display": "Police",
-- 	"subMenu": [
-- 		{
-- 			"title": "Envoyer un message",
-- 			"eventName": "esx_addons_gcphone:call",
-- 			"type": {
-- 				"number": "police"
-- 			}
-- 		}
-- 	]
-- }

fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'