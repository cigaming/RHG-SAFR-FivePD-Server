fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_script 'client/tattoosList/list.lua'
client_script 'client/config.lua'
client_script 'client/client.lua'


server_script '@mysql-async/lib/MySQL.lua'
server_script 'server/server.lua'