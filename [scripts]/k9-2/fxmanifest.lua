--[[ Scripted By: Xander1998 ]]--

fx_version 'adamant'
game 'gta5'

name 'FiveM K9'
description 'A modular K9 script built for FiveM.'
author 'Xander1998'
url 'https://github.com/xander1998/k9'

-- Shared Base Scripts
shared_script "shared/shared.lua"
shared_script "shared/configs/*.lua"
shared_script "shared/modulemanager.lua"
shared_script "shared/models/*.lua"
shared_script "shared/modules/*.lua"

-- Server Base Scripts
server_script "server/server.lua"

-- Client Base Scripts
client_script "@xmenu/classes/menu.lua"
client_script "@xmenu/classes/submenu.lua"
client_script "client/models/*.lua"
client_script "client/menu/models/*.lua"
client_script "client/utils.lua"
client_script "client/client.lua"