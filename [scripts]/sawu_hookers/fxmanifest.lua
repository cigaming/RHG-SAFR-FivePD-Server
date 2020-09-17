fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name 'SAWU Hookers'
description 'This is the most ridiculous and useless thing i have ever made'
owner 'saNhje / stianhje on fivem forums'

server_scripts {
	'server/main.lua',
	'config.lua'
}

client_scripts {
	'client/main.lua',
	'config.lua'
}

ui_page 'ui/index.html'

files {
	'ui/index.html',
	'ui/libraries/axios.min.js',
	'ui/libraries/vue.min.js',
	'ui/libraries/vuetify.css',
	'ui/libraries/vuetify.js',
	'ui/script.js',
	'ui/style.css',
	-- images
	'ui/img/Vennesa.png',
	'ui/img/Cathrine.png',
	'ui/img/Tatiana.png',
	'ui/img/Bootylicious.png',
	'ui/img/blowjob.png',
	'ui/img/sex.png',
}

dependencies {
    'mythic_notify',
}
