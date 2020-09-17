-- the postal map to read from
-- change it to whatever model you want that is in this directory
local postalFile = 'old-postals.json'

--[[
WHAT EVER YOU DO, DON'T TOUCH ANYTHING BELOW UNLESS YOU **KNOW** WHAT YOU ARE DOING
If you just want to change the postal file, **ONLY** change the above variable
--]]
fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
	'config.lua',
	'cl.lua'
}
server_script {
	'config.lua',
	'sv.lua'
}

file(postalFile)
postal_file(postalFile)

file 'version.json'
