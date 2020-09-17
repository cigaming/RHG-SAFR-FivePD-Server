fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'esx_plasticsurgery'

version '1.0.1'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'locales/br.lua',
    'locales/de.lua',
    'locales/en.lua',
    'locales/fr.lua',
    'locales/es.lua',
    'config.lua',
    'server/main.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'locales/br.lua',
    'locales/de.lua',
    'locales/en.lua',
    'locales/fr.lua',
    'locales/es.lua',
    'config.lua',
    'client/main.lua'
}
