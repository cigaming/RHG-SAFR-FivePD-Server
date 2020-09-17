fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

server_scripts {
  '@es_extended/locale.lua',
  'translation/sv.lua',
  'translation/en.lua',
  'translation/pl.lua',
  'config.lua',
  'server/main.lua',
  '@mysql-async/lib/MySQL.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  'translation/sv.lua',
  'translation/en.lua',
  'translation/pl.lua',
  'config.lua',
  'client/main.lua',
}