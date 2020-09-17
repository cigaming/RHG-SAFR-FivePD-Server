fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'ESX DMV School'

version '1.0.3'

server_scripts {
  '@es_extended/locale.lua',
  'locales/fr.lua',
  'locales/en.lua',
  'config.lua',
  'server/main.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  'locales/fr.lua',
  'locales/en.lua',
  'config.lua',
  'client/main.lua'
}

ui_page 'html/ui.html'

files {
  'html/ui.html',
  'html/logo.png',
  'html/dmv.png',
  'html/cursor.png',
  'html/styles.css',
  'html/questions.js',
  'html/scripts.js',
  'html/debounce.min.js'
}
