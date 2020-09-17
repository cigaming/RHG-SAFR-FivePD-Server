-----------------------------------
-- Area of Patrol, Made by FAXES --
-----------------------------------

--[[
    IMPORTANT INFORMATION!

    - By using this script you agree to the license (License.md file)
    - Please use the config.lua file to configure the script
    

    HELPFUL LINKS:

    - Variable Docs: https://github.com/FAXES/Area-of-Patrol/wiki/Variable-Docs
    - FAXES Discord: http://faxes.zone/discord
    - Github: https://github.com/FAXES/Area-of-Patrol
    - Online License Copy: https://github.com/FAXES/Area-of-Patrol/blob/master/License.md

--]]

fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_script "config.lua"
client_script "client.lua"
server_script "config.lua"
server_script "server.lua"

-- Made by FAXES