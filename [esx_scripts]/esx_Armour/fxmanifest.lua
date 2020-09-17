fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'armour'

version '1.0.0'

server_scripts {
  'server/sv_armour.lua'
}

client_scripts {
  'client/cl_armour.lua'
}
