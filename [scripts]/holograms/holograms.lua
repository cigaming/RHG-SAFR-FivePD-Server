--[[

	Holograms / Floating text Script by Meh
	
	Just put in the coordinates you get when standing on the ground, it's above the ground then
	By default, you only see the hologram when you are within 10m of it, to change that, edit the 10.0 infront of the "then"
	The Default holograms are at the Observatory.
	
	If you want to add a line to the hologram, just make a new Draw3DText line with the same coordinates, and edit the vertical offset.
	
	Formatting:
			Draw3DText( x, y, z  vertical offset, "text", font, text size, text size)
			
			
	To add a new hologram, copy paste this example under the existing ones, and put coordinates and text into it.
	
		if GetDistanceBetweenCoords( X, Y, Z, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( X, Y, Z,  -1.400, "TEXT", 4, 0.1, 0.1)
			Draw3DText( X, Y, Z,  -1.600, "TEXT", 4, 0.1, 0.1)
			Draw3DText( X, Y, Z,  -1.800, "TEXT", 4, 0.1, 0.1)		
		end


]]--

Citizen.CreateThread(function()
    Holograms()
end)

function Holograms()
		while true do
			Citizen.Wait(0)			
				-- LEO Training Facility - Gate 1
				if GetDistanceBetweenCoords( -2319.18, 3399.4, 38.0, GetEntityCoords(GetPlayerPed(-1))) < 200.0 then
				Draw3DText( -2319.18, 3399.4, 38.0  -0.800, "State of San Andreas", 1, 0.7, 0.7)
				Draw3DText( -2319.18, 3399.4, 38.0  -2.000, "SAFR DOCJT Facility", 1, 0.7, 0.7)
				Draw3DText( -2319.18, 3399.4, 38.0  -3.200, "Main Gate", 1, 0.7, 0.7)
			end
	
					-- LEO Training Facility - Gate 2
			if GetDistanceBetweenCoords( -1576.73, 2780.74, 24.89, GetEntityCoords(GetPlayerPed(-1))) < 200.0 then
				Draw3DText( -1576.73, 2780.74, 24.89  -0.800, "State of San Andreas", 1, 0.7, 0.7)
				Draw3DText( -1576.73, 2780.74, 24.89  -2.000, "SAFR DOCJT Facility", 1, 0.7, 0.7)
				Draw3DText( -1576.73, 2780.74, 24.89  -3.200, "Back Gate", 1, 0.7, 0.7)
			end
	
					-- LEO Training Facility - Weapons Training Room
			if GetDistanceBetweenCoords( -2145.72, 3244.33, 65.0, GetEntityCoords(GetPlayerPed(-1))) < 200.0 then
				Draw3DText( -2145.72, 3244.33, 65.0  -0.800, "San Andreas", 1, 0.7, 0.7)
				Draw3DText( -2145.72, 3244.33, 65.0  -2.000, "Weapons Training Facility", 1, 0.7, 0.7)		
			end
	
					-- LEO Weapons Facility - Range 2
			if GetDistanceBetweenCoords( -2119.82, 3268.78, 33.0, GetEntityCoords(GetPlayerPed(-1))) < 20.0 then
				Draw3DText( -2119.82, 3268.78, 33.0  -0.800, "Range 2", 1, 0.1, 0.1)		
			end
	
					-- LEO Weapons Facility - Range 1
			if GetDistanceBetweenCoords( -2130.32, 3275.01, 33.0, GetEntityCoords(GetPlayerPed(-1))) < 20.0 then
				Draw3DText( -2130.32, 3275.01, 33.0  -0.800, "Range 1", 1, 0.1, 0.1)		
			end
	
					-- LEO Weapons Facility - Exit
			if GetDistanceBetweenCoords( -2133.5, 3304.14, 34.50, GetEntityCoords(GetPlayerPed(-1))) < 60.0 then
				Draw3DText( -2133.5, 3304.14, 34.50  -0.800, "EXIT HERE", 1, 0.3, 0.3)		
			end
	
					-- LEO Weapons Facility - Enter
			if GetDistanceBetweenCoords( -2150.13, 3235.76, 34.50, GetEntityCoords(GetPlayerPed(-1))) < 60.0 then
				Draw3DText( -2150.13, 3235.76, 34.50  -0.800, "ENTER HERE", 1, 0.3, 0.3)		
			end
	
					-- LEO Weapons Facility - Enter
			if GetDistanceBetweenCoords( -2340.2, 3264.95, 34.50, GetEntityCoords(GetPlayerPed(-1))) < 60.0 then
				Draw3DText( -2340.2, 3264.95, 34.50  -0.600, "SAFR RTT & SERVE TRAINING", 1, 0.3, 0.3)	
				Draw3DText( -2340.2, 3264.95, 34.50  -1.200, "FACILITY", 1, 0.3, 0.3)	
		end	
	end
end

-------------------------------------------------------------------------------------------------------------------------
function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
         local px,py,pz=table.unpack(GetGameplayCamCoords())
         local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
         local scale = (1/dist)*20
         local fov = (1/GetGameplayCamFov())*100
         local scale = scale*fov   
         SetTextScale(scaleX*scale, scaleY*scale)
         SetTextFont(fontId)
         SetTextProportional(1)
         SetTextColour(250, 250, 250, 255)		-- You can change the text color here
         SetTextDropshadow(1, 1, 1, 1, 255)
         SetTextEdge(2, 0, 0, 0, 150)
         SetTextDropShadow()
         SetTextOutline()
         SetTextEntry("STRING")
         SetTextCentre(1)
         AddTextComponentString(textInput)
         SetDrawOrigin(x,y,z+2, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
        end
