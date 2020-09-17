fx_version 'adamant'
games {'gta5'}

description 'Activates the Radar while driving'		-- Resource Description

client_script {										-- Client Scripts
			   'CLIENT/MinimapValues.lua',
			   'CLIENT/RadarWhileDriving.lua',
			  }

server_script {										-- Server Scripts
			   'SERVER/UpdateCheck.lua',
}

-- MinimapValues.lua	By		glitchdetector						[ https://forum.fivem.net/u/glitchdetector ] 	[ https://forum.fivem.net/t/release-utility-minimap-anchor-script/81912 ] 	[ https://github.com/glitchdetector/fivem-minimap-anchor ]
-- RadarWhileDriving	By		FlatracerMOD (aka Flatracer)		[ https://forum.fivem.net/u/Flatracer ] 		[ https://forum.fivem.net/t/release-radar-only-while-driving/16368 ] 		[ https://github.com/Flatracer/RadarWhileDriving ]
