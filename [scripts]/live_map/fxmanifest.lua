
fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


dependency "yarn"
dependency "webpack"
webpack_config "webpack.config.js"

client_scripts{
    "client/client.lua",
    "client/reverse_weapon_hashes.lua",
    "client/reverse_car_hashes.lua",
    "client/reverse_location_hashes.lua",
    "client/blips_client.lua"
}

exports {
    "reverseWeaponHash",
    "reverseVehicleHash",
    "reverseStreetHash",
    "reverseZoneHash",
    "reverseAreaHash"
}

server_scripts{
    "dist/livemap.js",
    "server/update_check.lua"
}
