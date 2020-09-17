fx_version 'bodacious'

game 'gta5'

ui_page 'html/index.html'

files {
    'Newtonsoft.Json.dll',
	'html/index.html',
	'html/static/css/app.css',
	'html/static/js/app.js',
	'html/static/js/manifest.js',
	'html/static/js/vendor.js',
	'html/static/js/0.js',

	'html/static/config/config.json',
	'html/static/config/haberler.json',
	
	-- Coque
	'html/static/img/coque/*.png',


	
	-- Background
	'html/static/img/background/*.jpg',
	'html/static/img/background/*.png',

	
	'html/static/img/icons_app/*.png',
	'html/static/img/icons_app/*.jpg',
	
	'html/static/img/app_bank/*.png',
	'html/static/img/app_bank/*.jpg',

	'html/static/img/app_tchat/*.png',

	'html/static/img/twitter/*.png',

	'html/static/sound/Twitter_Sound_Effect.ogg',

	'html/static/img/*.png',
	'html/static/img/2048/*.png',
	'html/static/img/fatura/*.png',
	'html/static/img/instagram/*.png',
	'html/static/img/yellowpages/*.png',
	'html/static/img/*.gif',
	'html/static/img/giphy.webp',
	'html/static/fonts/fontawesome-webfont.eot',
	'html/static/fonts/fontawesome-webfont.ttf',
	'html/static/fonts/fontawesome-webfont.woff',
	'html/static/fonts/fontawesome-webfont.woff2',

	'html/static/sound/*.ogg',

}

client_script {
	"@es_extended/locale.lua",
	"client/ServerIP_Client.net.dll",
	"locales/en.lua",
	"locales/es.lua",
	"config.lua",
	"client/animation.lua",
	"client/client.lua",
	"client/photo.lua",
	"client/app_tchat.lua",
	"client/bank.lua",
	"client/twitter.lua",
	"client/yellow.lua",
	"client/fatura.lua",
	"client/instagram.lua",
	"client/reddit.lua",
	"client/market.lua",
	"client/valet.lua"
}

server_script {
	"@mysql-async/lib/MySQL.lua",
	"@es_extended/locale.lua",
	"server/ServerIP_Server.net.dll",
	"locales/en.lua",
	"locales/es.lua",
	"config.lua",
	"server/server.lua",
	"server/app_tchat.lua",
	"server/twitter.lua",
    "server/yellow.lua",
	"server/bank.lua",
	"server/fatura.lua",
	"server/instagram.lua",
    "server/market.lua",
	"server/reddit.lua",
	"server/valet.lua"
}
