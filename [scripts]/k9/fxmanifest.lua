--[[
    Scripted by: Xander Harrison [X. Cross]
--]]

fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'



ui_page("html/index.html")

files {
    "html/index.html",
    "html/libraries/axios.min.js",
    "html/libraries/vue.min.js",
    "html/libraries/vuetify.js",
    "html/libraries/vuetify.css",
    "html/style.css",
    "html/script.js",
    "html/images/dog_left.png",
    "html/images/dog_right.png",
    "html/images/husky.png",
    "html/images/rottweiler.png",
    "html/images/shepherd.png",
    "html/images/retriever.png"
}

server_script "version.lua"
server_script "config.lua"
server_script "server.lua"
client_script "client.lua"