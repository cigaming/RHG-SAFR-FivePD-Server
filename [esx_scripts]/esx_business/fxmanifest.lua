fx_version 'adamant'

game 'gta5'

client_scripts {
    "client.lua",
    "config.lua"
}
server_scripts {
    "@mysql-async/lib/MySQL.lua",
	"server.lua",
	"config.lua"
}

dependencies {
    "es_extended",
    "cron"
}