--[[-------------------------------------------------------------------------
    Author: Lucifer
    Last Edit: 13/10/2019
    Description: Simple locking system made for SOSAY Nation
    Notes: You cannot release or remove this text, enjoy!
--]]-------------------------------------------------------------------------

fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_script "client.lua"

server_script "server.lua"

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/sounds/lock.ogg',
    'html/sounds/unlock.ogg',
	'html/sounds/lock2.ogg'
}