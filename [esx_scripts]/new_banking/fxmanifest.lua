fx_version 'bodacious'
games { 'gta5' }

client_script('client/client.lua') --your NUI Lua File
server_script "@mysql-async/lib/MySQL.lua"
server_script 'server.lua'
ui_page('client/html/UI.html') --THIS IS IMPORTENT

--[[The following is for the files which are need for you UI (like, pictures, the HTML file, css and so on) ]]--
files {
    'client/html/UI.html',
    'client/html/style.css',
	'client/html/img/user.png',
	'client/html/img/phone.png',
	'client/html/img/clock.png',
	'client/html/img/receipt.png',
	'client/html/img/knife.png'

}
