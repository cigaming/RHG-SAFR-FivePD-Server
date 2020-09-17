fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server/main.lua",
}

client_scripts {
    "client/main.lua",
}

ui_page {
    'html/ui.html',
}
files {
    'html/ui.html',
    'html/css/main.css',
    'html/js/app.js',
}
