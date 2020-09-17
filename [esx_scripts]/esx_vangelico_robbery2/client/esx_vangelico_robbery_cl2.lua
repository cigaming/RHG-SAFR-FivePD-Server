local holdingup = false
local store = ""
local blipRobbery = nil

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_vangelico_robbery2:currentlyrobbing')
AddEventHandler('esx_vangelico_robbery2:currentlyrobbing', function(robb)
	holdingup = true
	store = robb
end)

RegisterNetEvent('esx_vangelico_robbery2:killblip')
AddEventHandler('esx_vangelico_robbery2:killblip', function()
    RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_vangelico_robbery2:setblip')
AddEventHandler('esx_vangelico_robbery2:setblip', function(position)
    blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blipRobbery , 161)
    SetBlipScale(blipRobbery , 2.0)
    SetBlipColour(blipRobbery, 3)
    PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_vangelico_robbery2:toofarlocal')
AddEventHandler('esx_vangelico_robbery2:toofarlocal', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_cancelled'))
	robbingName = ""
	incircle = false
end)


RegisterNetEvent('esx_vangelico_robbery2:robberycomplete')
AddEventHandler('esx_vangelico_robbery2:robberycomplete', function(robb)
	holdingup = false

		TriggerEvent('skinchanger:getSkin', function(skin)
	
		if skin.sex == 0 then

		local clothesSkin = {
		['bags_1'] = 41, ['bags_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		else

		local clothesSkin = {
		['bags_1'] = 41, ['bags_2'] = 0
		}
	    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

	    end
	    end)
	ESX.ShowNotification(_U('robbery_complete'))
	store = ""
	incircle = false
end)

Citizen.CreateThread(function()
	for k,v in pairs(Stores)do
		local ve = v.position

		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 439)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('shop_robbery'))
		EndTextCommandSetBlipName(blip)
	end
end)


incircle = false

hasrobbed = false
hasrobbed2 = false
hasrobbed3 = false
hasrobbed4 = false
hasrobbed5 = false
hasrobbed6 = false
hasrobbed7 = false
hasrobbed8 = false
hasrobbed9 = false
hasrobbed10 = false
hasrobbed11 = false
hasrobbed12 = false

function loadAnimDict( dict )  
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

Citizen.CreateThread(function()
      
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(Stores)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				if not holdingup then
					DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
						if (incircle == false) then
							DisplayHelpText(_U('press_to_rob'))
						end
						incircle = true
						if IsPedShooting(GetPlayerPed(-1)) then

							gioielli1 = AddBlipForCoord(-211.054, -728.414, 33.587)
							SetBlipSprite(gioielli1,1)
							SetBlipColour(gioielli1,16742399)
							SetBlipScale(gioielli1,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli1)

							gioielli2 = AddBlipForCoord(-208.679, -727.663, 33.587)
							SetBlipSprite(gioielli2,1)
							SetBlipColour(gioielli2,16742399)
							SetBlipScale(gioielli2,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli2)

							gioielli3 = AddBlipForCoord(-207.943, -726.305, 33.572)
							SetBlipSprite(gioielli3,1)
							SetBlipColour(gioielli3,16742399)
							SetBlipScale(gioielli3,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli3)

							gioielli4 = AddBlipForCoord(-208.81, -724.689, 33.572)
							SetBlipSprite(gioielli4,1)
							SetBlipColour(gioielli4,16742399)
							SetBlipScale(gioielli4,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli4)


							gioielli5 = AddBlipForCoord(-209.936, -724.103, 33.572)
							SetBlipSprite(gioielli5,1)
							SetBlipColour(gioielli5,16742399)
							SetBlipScale(gioielli5,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli5)

							gioielli6 = AddBlipForCoord(-206.246, -729.9, 33.572)
							SetBlipSprite(gioielli6,1)
							SetBlipColour(gioielli6,16742399)
							SetBlipScale(gioielli6,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli6)

							gioielli7 = AddBlipForCoord(-204.686, -730.272, 33.572)
							SetBlipSprite(gioielli7,1)
							SetBlipColour(gioielli7,16742399)
							SetBlipScale(gioielli7,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli7)

							gioielli8 = AddBlipForCoord(-203.835, -731.867, 33.587)
							SetBlipSprite(gioielli8,1)
							SetBlipColour(gioielli8,16742399)
							SetBlipScale(gioielli8,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli8)

							gioielli9 = AddBlipForCoord(-202.381, -732.702, 33.587)
							SetBlipSprite(gioielli9,1)
							SetBlipColour(gioielli9,16742399)
							SetBlipScale(gioielli9,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli9)

							gioielli10 = AddBlipForCoord(-199.874, -732.024, 33.572)
							SetBlipSprite(gioielli10,1)
							SetBlipColour(gioielli10,16742399)
							SetBlipScale(gioielli10,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli10)

							gioielli11 = AddBlipForCoord(-206.291, -733.459, 33.587)
							SetBlipSprite(gioielli11,1)
							SetBlipColour(gioielli11,16742399)
							SetBlipScale(gioielli11,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli11)

							gioielli12 = AddBlipForCoord(-208.184, -733.59, 33.572)
							SetBlipSprite(gioielli12,1)
							SetBlipColour(gioielli12,16742399)
							SetBlipScale(gioielli12,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli12)
							
							TriggerServerEvent('esx_vangelico_robbery2:rob', k)
                        end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end
				end
			end
		end

		if holdingup then
							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -211.054, -728.414, 33.587, true) < 0.5 ) then
								if (hasrobbed == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -211.054, -728.414, 33.587, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli1)
								TriggerServerEvent('esx_vangelico_robbery2:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -208.679, -727.663, 33.587, true) < 0.5 ) then
								if (hasrobbed2 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -208.679, -727.663, 33.587, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli2)
								TriggerServerEvent('esx_vangelico_robbery2:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed2 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -207.943, -726.305, 33.572, true) < 0.5 ) then
								if (hasrobbed3 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -207.943, -726.305, 33.572, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli3)
								TriggerServerEvent('esx_vangelico_robbery2:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed3 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -208.81, -724.689, 33.572, true) < 0.5 ) then
								if (hasrobbed4 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -208.81, -724.689, 33.572, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli4)
								TriggerServerEvent('esx_vangelico_robbery2:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed4 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -209.936, -724.103, 33.572, true) < 0.5 ) then
								if (hasrobbed5 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -209.936, -724.103, 33.572, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli5)
								TriggerServerEvent('esx_vangelico_robbery2:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed5 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -206.246, -729.9, 33.572, true) < 0.5 ) then
								if (hasrobbed6 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -206.246, -729.9, 33.572, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli6)
								TriggerServerEvent('esx_vangelico_robbery2:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed6 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -204.686, -730.272, 33.572, true) < 0.5 ) then
								if (hasrobbed7 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -204.686, -730.272, 33.572, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli7)
								TriggerServerEvent('esx_vangelico_robbery2:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed7 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -203.835, -731.867, 33.587, true) < 0.5 ) then
								if (hasrobbed8 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -203.835, -731.867, 33.587, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli8)
								TriggerServerEvent('esx_vangelico_robbery2:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed8 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -202.381, -732.702, 33.587, true) < 0.5 ) then
							if (hasrobbed9 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -202.381, -732.702, 33.587, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli9)
								TriggerServerEvent('esx_vangelico_robbery2:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed9 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -199.874, -732.024, 33.572, true) < 0.5 ) then
							if (hasrobbed10 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -199.874, -732.024, 33.572, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli10)
								TriggerServerEvent('esx_vangelico_robbery2:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed10 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -206.291, -733.459, 33.587, true) < 0.5 ) then
							if (hasrobbed11 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -206.291, -733.459, 33.587, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli11)
								TriggerServerEvent('esx_vangelico_robbery2:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed11 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -208.184, -733.59, 33.572, true) < 0.5 ) then
							if (hasrobbed12 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -208.184, -733.59, 33.572, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli12)
								TriggerServerEvent('esx_vangelico_robbery2:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed12 = true
							end
							end
							end

							if (hasrobbed == true) and (hasrobbed2 == true) and (hasrobbed3 == true) and (hasrobbed4 == true) and (hasrobbed5 == true) and (hasrobbed6 == true) and (hasrobbed7 == true) and (hasrobbed8 == true) and (hasrobbed9 == true) and (hasrobbed10 == true) and (hasrobbed11 == true) and (hasrobbed12 == true) then
							holdingup = false
							
							hasrobbed = false
                            hasrobbed2 = false
                            hasrobbed3 = false
                            hasrobbed4 = false
                            hasrobbed5 = false
                            hasrobbed6 = false
                            hasrobbed7 = false
                            hasrobbed8 = false
                            hasrobbed9 = false
                            hasrobbed10 = false
                            hasrobbed11 = false
							hasrobbed12 = false
							
							TriggerServerEvent('esx_vangelico_robbery2:endrob', store)
							ESX.ShowNotification(_U('lester'))
							TriggerEvent('skinchanger:getSkin', function(skin)
	
		                       if skin.sex == 0 then

		                              local clothesSkin = {
		                              ['bags_1'] = 41, ['bags_2'] = 0
		                              }
		                          TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		                        else

		                              local clothesSkin = {
		                              ['bags_1'] = 41, ['bags_2'] = 0
		                              }
	                              TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

	                           end
	                        end)
							end	

			local pos2 = Stores[store].position

			if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -209.19,-730.686,33.587, true) > 11.5 ) then
				TriggerServerEvent('esx_vangelico_robbery2:toofar', store)
				holdingup = false
				RemoveBlip(gioielli1)
				RemoveBlip(gioielli2)
				RemoveBlip(gioielli3)
				RemoveBlip(gioielli4)
				RemoveBlip(gioielli5)
				RemoveBlip(gioielli6)
				RemoveBlip(gioielli7)
				RemoveBlip(gioielli8)
				RemoveBlip(gioielli9)
				RemoveBlip(gioielli10)
				RemoveBlip(gioielli11)
				RemoveBlip(gioielli12)
				
				hasrobbed = false
                hasrobbed2 = false
                hasrobbed3 = false
                hasrobbed4 = false
                hasrobbed5 = false
                hasrobbed6 = false
                hasrobbed7 = false
                hasrobbed8 = false
                hasrobbed9 = false
                hasrobbed10 = false
                hasrobbed11 = false
                hasrobbed12 = false
			end
		end

		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_vangelico_robbery2:togliblip')
AddEventHandler('esx_vangelico_robbery2:togliblip', function(robb)
	RemoveBlip(gioielli1)
	RemoveBlip(gioielli2)
	RemoveBlip(gioielli3)
	RemoveBlip(gioielli4)
	RemoveBlip(gioielli5)
	RemoveBlip(gioielli6)
	RemoveBlip(gioielli7)
	RemoveBlip(gioielli8)
	RemoveBlip(gioielli9)
	RemoveBlip(gioielli10)
	RemoveBlip(gioielli11)
	RemoveBlip(gioielli12)
end)

--[[
RegisterNetEvent("lester:createBlip")
AddEventHandler("lester:createBlip", function(type, x, y, z)
	local blip = AddBlipForCoord(x, y, z)
	SetBlipSprite(blip, type)
	SetBlipColour(blip, 1)
	SetBlipScale(blip, 0.8)
	SetBlipAsShortRange(blip, true)
	if(type == 77)then
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Lester")
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
		TriggerEvent('lester:createBlip', 77, 706.669, -966.898, 30.413)

    while true do
       Citizen.Wait(0)
       playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		
		if pos then
				
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 706.669, -966.898, 30.413, true) <= 5 then
					TriggerServerEvent('lester:vendita')
                    Citizen.Wait(4000)
                    TriggerEvent('skinchanger:getSkin', function(skin)
	
		                       if skin.sex == 0 then

		                              local clothesSkin = {
		                              ['bags_1'] = 0, ['bags_2'] = 0
		                              }
		                          TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		                        else

		                              local clothesSkin = {
		                              ['bags_1'] = 0, ['bags_2'] = 0
		                              }
	                              TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

	                           end
	                end)
				end	
		end
    end
end)
]]