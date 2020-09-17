client_script "client.lua"

files {
  'index.html',
  '1.css',
  'logo.png',
  'music/music.ogg',
  'app.js',
  'background.jpg',
}

loadscreen_manual_shutdown "yes"
loadscreen 'index.html'

fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
