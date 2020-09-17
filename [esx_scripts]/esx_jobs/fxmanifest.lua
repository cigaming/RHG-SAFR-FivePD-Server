fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'locales/br.lua',
  'locales/de.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'config.lua',
  'server/esx_jobs_sv.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  'locales/br.lua',
  'locales/de.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'config.lua',
  'jobs/fisherman.lua',
  'jobs/fuel.lua',
  'jobs/lumberjack.lua',
  'jobs/miner.lua',
  'jobs/reporter.lua',
  'jobs/slaughterer.lua',
  'jobs/textil.lua',
  'client/esx_jobs_cl.lua'
}
