----------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------/ W A R  M E N U \-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	local player = GetPlayerPed(-1)
	
    WarMenu.CreateMenu('PIS:main', 'PIS Menu')
	WarMenu.SetTitleBackgroundColor('PIS:main', 15, 60, 125, 255)
	WarMenu.SetTitleColor('PIS:main', 255, 255, 255, 255)
	
	WarMenu.CreateSubMenu('PIS:wep', 'PIS:main', 'Weapons')
	WarMenu.SetTitleBackgroundColor('PIS:wep', 15, 60, 125, 255)
	WarMenu.SetTitleColor('PIS:wep', 255, 255, 255, 255)
	
	WarMenu.CreateSubMenu('PIS:arr', 'PIS:main', 'Arrests (WIP)')
	WarMenu.SetTitleBackgroundColor('PIS:arr', 15, 60, 125, 255)
	WarMenu.SetTitleColor('PIS:arr', 255, 255, 255, 255)
	
	WarMenu.CreateSubMenu('PIS:int', 'PIS:main', 'Interactions')
	WarMenu.SetTitleBackgroundColor('PIS:int', 15, 60, 125, 255)
	WarMenu.SetTitleColor('PIS:int', 255, 255, 255, 255)
	
	WarMenu.CreateSubMenu('PIS:rdo', 'PIS:main', 'Interactions')
	WarMenu.SetTitleBackgroundColor('PIS:rdo', 15, 60, 125, 255)
	WarMenu.SetTitleColor('PIS:rdo', 255, 255, 255, 255)
	
	WarMenu.CreateSubMenu('PIS:misc', 'PIS:main', 'Other')
	WarMenu.SetTitleBackgroundColor('PIS:misc', 15, 60, 125, 255)
	WarMenu.SetTitleColor('PIS:misc', 255, 255, 255, 255)
	
	
	

	
    WarMenu.CreateSubMenu('closeMenu', 'PIS:main', 'Are you sure?')

    while true do
        if WarMenu.IsMenuOpened('PIS:main') then
			if WarMenu.MenuButton('Arrests', 'PIS:arr') then
			elseif WarMenu.MenuButton('Interactions', 'PIS:int') then
			elseif WarMenu.MenuButton('Radio', 'PIS:rdo') then
			elseif WarMenu.MenuButton('Weapons', 'PIS:wep') then
			elseif WarMenu.MenuButton('Services', 'PIS:misc') then
            elseif WarMenu.MenuButton('Exit', 'closeMenu') then
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('closeMenu') then
            if WarMenu.Button('Yes') then
                WarMenu.CloseMenu()
            elseif WarMenu.MenuButton('No', 'PIS:main') then
            end
		
		
		
			WarMenu.Display()
        elseif WarMenu.IsMenuOpened('PIS:wep') then
            if WarMenu.Button('Equip Loadout') then
				TriggerEvent("ldt:cop")
			elseif IsPedInAnyPoliceVehicle(player) then
				if WarMenu.Button('Equip Carbine') then
					TriggerEvent("ldt:carbine")
			elseif WarMenu.Button('Equip Shotgun') then
					TriggerEvent("ldt:shotgun")
			end
            end
			
			WarMenu.Display()
        elseif WarMenu.IsMenuOpened('PIS:arr') then
            if WarMenu.Button('Handcuff') then
				TriggerEvent("pis:arr:handcuff")
			elseif WarMenu.Button('Grab') then
				TriggerEvent("pis:arr:grab")
			elseif WarMenu.Button('Kneel') then
				TriggerEvent("pis:arr:kneel")
			elseif WarMenu.Button('Unsecure') then					
				TriggerEvent("pis:arr:unsecure")
			elseif WarMenu.Button('Book') then
				TriggerEvent("pis:arr:book")
			end
			
			WarMenu.Display()
        elseif WarMenu.IsMenuOpened('PIS:int') then
			if WarMenu.Button('Breathalyze') then
				TriggerEvent("pis:breath")
			elseif WarMenu.Button('Drugalyze') then
				TriggerEvent("pis:drug")
			elseif WarMenu.Button('Get ID') then
			TriggerEvent("pis:footid")
			elseif WarMenu.Button('Search') then
				TriggerEvent("pis:search")
			elseif WarMenu.Button('Do you know why I stopped you?') then
				TriggerEvent('pis:stop:q')
			elseif WarMenu.Button('Where are you coming from?') then
				TriggerEvent("pis:loc:q")
			elseif WarMenu.Button('Where are you heading today?') then
				TriggerEvent("pis:locs:q")
			elseif WarMenu.Button('Have you had anything to drink today?') then
				TriggerEvent("pis:drunk:q")
            elseif WarMenu.Button('Have you took any drugs recently?') then
				TriggerEvent("pis:drug:q")
            elseif WarMenu.Button('Anything illegal in the vehicle?') then
				TriggerEvent("pis:illegal:q")
            elseif WarMenu.Button('Can i search your vehicle?') then
				TriggerEvent("pis:search:q")
            end
			
			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('PIS:rdo') then
			if WarMenu.Button('Run Plate') then
					TriggerEvent("pis:getplate")
					vehPlateNum = tostring(vehPlateNum)
					if vehPlateNum == "nil" then
						numPlate = ""
					else
						numPlate = vehPlateNum
					end
					DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", numPlate, "", "", "", 30)
						while (UpdateOnscreenKeyboard() == 0) do
							DisableAllControlActions(0);
							Wait(0);
						end
						if (GetOnscreenKeyboardResult()) then
							local result = GetOnscreenKeyboardResult()
							plate = result
							plate = string.upper(plate)
							TriggerEvent("pis:runplate")
						end
						WarMenu.Display()
		
			elseif WarMenu.IsMenuOpened('PIS:rdo') then
				if WarMenu.Button('Run ID') then
					driverName = tostring(driverName)
					if driverQuestioned == true then
						name = driverName
					elseif driverName == "nil" then
						name = ""
					elseif driverQuestioned == false then
						name = ""
					end
					DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", tostring(name), "", "", "", 30)
						while (UpdateOnscreenKeyboard() == 0) do
							DisableAllControlActions(0);
							Wait(0);
						end
						if (GetOnscreenKeyboardResult()) then
							local result = GetOnscreenKeyboardResult()
							name = result
							name = string.gsub(name, "(%a)([%w_']*)", titleCase)
							TriggerEvent("pis:runid")
						end
					elseif WarMenu.Button('OnDuty') then
			local play = GetPlayerPed(-1)

			name = GetPlayerName(PlayerId(play))

			playernames = name

			TriggerServerEvent("duty", playernames)
			ShowNotification("You are on duty "..playernames)
			--TriggerServerEvent('duty')
			elseif WarMenu.Button('10-8(Available)') then
			local play = GetPlayerPed(-1)
			local name = GetPlayerName(PlayerId(play))
			local playernames = name
			TriggerServerEvent('108', playernames)
			
			elseif WarMenu.Button('10-6(Busy)') then
			local play = GetPlayerPed(-1)
			local name = GetPlayerName(PlayerId(play))
			local playernames = name
			TriggerServerEvent('106', playernames)
			elseif WarMenu.Button('10-7(Out of Service)') then
			local play = GetPlayerPed(-1)
			local name = GetPlayerName(PlayerId(play))
			local playernames = name
			TriggerServerEvent('107', playernames)
			elseif WarMenu.Button('10-96(EnRoute)') then
			local play = GetPlayerPed(-1)
			local name = GetPlayerName(PlayerId(play))
			local playernames = name
			TriggerServerEvent('1017', playernames)
			elseif WarMenu.Button('10-97(On Scene)') then
			local play = GetPlayerPed(-1)
			local name = GetPlayerName(PlayerId(play))
			local playernames = name
			TriggerServerEvent('1023', playernames)
			elseif WarMenu.Button('10-38(Traffic Stop)') then
			local play = GetPlayerPed(-1)
			local name = GetPlayerName(PlayerId(play))
			local playernames = name
			TriggerServerEvent('1061', playernames)
			elseif WarMenu.Button('Units OnDuty') then
			local play = GetPlayerPed(-1)
			local name = GetPlayerName(PlayerId(play))
			local playernames = name
			TriggerServerEvent('avail', playernames)	
						
						
						
						
						
				end
            end
			
			WarMenu.Display()
        elseif WarMenu.IsMenuOpened('PIS:misc') then
			if WarMenu.Button('Tow Truck') then
				TriggerEvent('pis:spawnTow')
			elseif WarMenu.Button('Prisoner Transport') then
				TriggerEvent("pis:arr:pt")
            end
	
		
            WarMenu.Display()
        elseif IsDisabledControlPressed(1, modifier) and IsDisabledControlJustPressed(1, 303) then
            WarMenu.OpenMenu('PIS:main')
        end

        Citizen.Wait(0)
    end
end)


function ShowNotification( text )
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(false, false)
end




RegisterNetEvent('she5')
AddEventHandler('she5', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "she5"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
       end
		
		
		veh = CreateVehicle(vehiclehash, -479.1, 6028.1, 30.80, 229.3, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)
RegisterNetEvent('she3')
AddEventHandler('she3', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "she3"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
       end
		
		
		veh = CreateVehicle(vehiclehash, -479.1, 6028.1, 30.80, 229.3, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)
RegisterNetEvent('she2')
AddEventHandler('she2', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "she2"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
       end
		
		
		veh = CreateVehicle(vehiclehash, -479.1, 6028.1, 30.80, 229.3, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)
RegisterNetEvent('she1')
AddEventHandler('she1', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "she1"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
       end
		
		
		veh = CreateVehicle(vehiclehash, -479.1, 6028.1, 30.80, 229.3, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)

RegisterNetEvent('she7')
AddEventHandler('she7', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "she7"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
       end
		
		
		veh = CreateVehicle(vehiclehash, -479.1, 6028.1, 30.80, 229.3, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)
RegisterNetEvent('she8')
AddEventHandler('she8', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "she8"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
		
		
		veh = CreateVehicle(vehiclehash, -479.1, 6028.1, 30.80, 229.3, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)
RegisterNetEvent('she10')
AddEventHandler('she10', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "she10"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
       end
		
		
		veh = CreateVehicle(vehiclehash, -479.1, 6028.1, 30.80, 229.3, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)
RegisterNetEvent('she4')
AddEventHandler('she4', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "she4"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
       end
		
		
		veh = CreateVehicle(vehiclehash, -479.1, 6028.1, 30.80, 229.3, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)
RegisterNetEvent('she11')
AddEventHandler('she11', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "she11"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
		
		
		veh = CreateVehicle(vehiclehash, -479.1, 6028.1, 30.80, 229.3, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)
RegisterNetEvent('dea')
AddEventHandler('dea', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "dea"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
		
		
		veh = CreateVehicle(vehiclehash, -479.1, 6028.1, 30.80, 229.3, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)

RegisterNetEvent('hwy7')
AddEventHandler('hwy7', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "hwy7"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
          end
		
		
		veh = CreateVehicle(vehiclehash, 447.50, -997.28, 25.45, 177.92, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)

RegisterNetEvent('hwy1')
AddEventHandler('hwy1', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "hwy1"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
         end
		
		
		veh = CreateVehicle(vehiclehash, 447.50, -997.28, 25.45, 177.92, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)

RegisterNetEvent('hwy8')
AddEventHandler('hwy8', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "hwy8"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
         end
		
		
		veh = CreateVehicle(vehiclehash, 447.50, -997.28, 25.45, 177.92, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)

RegisterNetEvent('hwy6')
AddEventHandler('hwy6', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "hwy6"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
         end
		
		
		veh = CreateVehicle(vehiclehash, 447.50, -997.28, 25.45, 177.92, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)

RegisterNetEvent('hwy11')
AddEventHandler('hwy11', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "hwy11"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
          end
		
		
		veh = CreateVehicle(vehiclehash, 447.50, -997.28, 25.45, 177.92, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)

RegisterNetEvent('hwy2')
AddEventHandler('hwy2', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "hwy2"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
          end
		
		
		veh = CreateVehicle(vehiclehash, 447.50, -997.28, 25.45, 177.92, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)

RegisterNetEvent('hwy9')
AddEventHandler('hwy9', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "hwy9"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
         end
		
		
		veh = CreateVehicle(vehiclehash, 447.50, -997.28, 25.45, 177.92, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)

RegisterNetEvent('hwy5')
AddEventHandler('hwy5', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "hwy5"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
		
		
		veh = CreateVehicle(vehiclehash, 447.50, -997.28, 25.45, 177.92, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)

RegisterNetEvent('hwy12')
AddEventHandler('hwy12', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "hwy12"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
		
		
		veh = CreateVehicle(vehiclehash, 447.50, -997.28, 25.45, 177.92, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)
RegisterNetEvent('hwy3')
AddEventHandler('hwy3', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "hwy3"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
		
		
		veh = CreateVehicle(vehiclehash, 447.50, -997.28, 25.45, 177.92, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)
RegisterNetEvent('hwy4')
AddEventHandler('hwy4', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "hwy4"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
		
		
		veh = CreateVehicle(vehiclehash, 447.50, -997.28, 25.45, 177.92, 1, 0)
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		end)


end)
RegisterNetEvent('hwy10')
AddEventHandler('hwy10', function()
local player = GetPlayerPed(-1)
	local  hwypos = GetDistanceBetweenCoords(GetEntityCoords(player),441.1, -981.0, 30.00)
	local  shepos = GetDistanceBetweenCoords(GetEntityCoords(player),-1112.84, -848.09, 13.4)
	local dstanceToVe = GetDistanceBetweenCoords(GetEntityCoords(player),198.58, -1646.00, 30.71)



veh = "hwy10"

vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 20000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
		
		
		veh = CreateVehicle(vehiclehash, 447.50, -997.28, 25.45, 177.92, 1, 0)
		
		local player = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(player, veh, -1)
		ShowNotification("Don't crash!!")
		
		
		
		
		end)


end)




Citizen.CreateThread(function()
	local player = GetPlayerPed(-1)
	
	
    WarMenu.CreateMenu('carspawn', 'Fleet Cars')
	WarMenu.SetTitleBackgroundColor('carspawn', 15, 60, 125, 255)
	WarMenu.SetTitleColor('carspawn', 255, 255, 255, 255)
	
	WarMenu.CreateSubMenu('Sheriff', 'carspawn', 'Sheriff')
	WarMenu.SetTitleBackgroundColor('Sheriff', 15, 60, 125, 255)
	WarMenu.SetTitleColor('Sheriff', 255, 255, 255, 255)
	
	WarMenu.CreateSubMenu('hwycar', 'carspawn', 'State Police')
	WarMenu.SetTitleBackgroundColor('hwycar', 15, 60, 125, 255)
	WarMenu.SetTitleColor('hwycar', 255, 255, 255, 255)
	
	WarMenu.CreateSubMenu('civcar', 'carspawn', 'Radio')
	WarMenu.SetTitleBackgroundColor('civcar', 15, 60, 125, 255)
	WarMenu.SetTitleColor('civcar', 255, 255, 255, 255)
	
	WarMenu.CreateSubMenu('emscar', 'carspawn', 'EMS/Fire')
	WarMenu.SetTitleBackgroundColor('emscar', 15, 60, 125, 255)
	WarMenu.SetTitleColor('emscar', 255, 255, 255, 255)
	
	 WarMenu.CreateSubMenu('closeMenu', 'carspawn', 'Are you sure?')
	
	while true do
	Citizen.Wait(0)
	 if WarMenu.IsMenuOpened('carspawn') then
			
			if WarMenu.MenuButton('BCSO', 'Sheriff') then
			elseif WarMenu.MenuButton('LSPD', 'hwycar') then
			elseif WarMenu.MenuButton('EMS/Fire', 'emscar') then
			elseif WarMenu.MenuButton('Radio', 'civcar') then
            elseif WarMenu.MenuButton('Exit', 'closeMenu') then
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('closeMenu') then
            if WarMenu.Button('Yes') then
                WarMenu.CloseMenu()
            elseif WarMenu.MenuButton('No', 'PIS:main') then
            end
			
			
			
	
		
			
		
			
		WarMenu.Display()
		elseif WarMenu.IsMenuOpened('Sheriff') then
			if WarMenu.Button('Deputy I') then
			TriggerEvent('she5')
			elseif WarMenu.Button('Deputy II') then
			TriggerEvent('she7')
			elseif WarMenu.Button('Deputy III') then
			TriggerEvent('she8')
			elseif WarMenu.Button('Senior Deputy') then
			TriggerEvent('she10')
			elseif WarMenu.Button('K9 Unit Probation') then
			TriggerEvent('she1')
			elseif WarMenu.Button('K9 Deputy') then
			TriggerEvent('she2')
			elseif WarMenu.Button('K9 Senior Deputy') then
		TriggerEvent('she3')
		
		end
		
		WarMenu.Display()
		elseif WarMenu.IsMenuOpened('hwycar') then
			if WarMenu.Button('Cadet') then
			TriggerEvent('hwy8')
			elseif WarMenu.Button('Officer') then
			TriggerEvent('hwy1')
			elseif WarMenu.Button('Officer 1') then
			TriggerEvent('hwy7')
			elseif WarMenu.Button('Officer 2') then
			TriggerEvent('hwy5')
			elseif WarMenu.Button('Senior Officer') then
			TriggerEvent('hwy11')
			elseif WarMenu.Button('Corporal') then
			TriggerEvent('hwy12')
			elseif WarMenu.Button('Sergeant') then
			TriggerEvent('hwy10')
			elseif WarMenu.Button('K9 Probation') then
			TriggerEvent('hwy10')
			elseif WarMenu.Button('K9 Officer') then
			TriggerEvent('hwy2')
			
		
		end
		
		WarMenu.Display()
		elseif WarMenu.IsMenuOpened('emscar') then
			if WarMenu.Button('Ambul1') then
			
			elseif WarMenu.Button('Ambul2') then
			
			elseif WarMenu.Button('Engine1') then
			
			elseif WarMenu.Button('Engine2') then
			
			elseif WarMenu.Button('Ladder1') then
			
			elseif WarMenu.Button('Ladder2') then
			
			elseif WarMenu.Button('Rescue1') then
		
		
		end
		
		WarMenu.Display()
		elseif WarMenu.IsMenuOpened('civcar') then
			if WarMenu.Button('OnDuty') then
			local play = GetPlayerPed(-1)

			name = GetPlayerName(PlayerId(play))

			playernames = name

			TriggerServerEvent("duty", playernames)
			ShowNotification("You are on duty "..playernames)
			--TriggerServerEvent('duty')
			elseif WarMenu.Button('10-8(Available)') then
			TriggerServerEvent('108')
			elseif WarMenu.Button('10-6(Busy)') then
			TriggerServerEvent('106')
			elseif WarMenu.Button('10-7(Out of Service)') then
			TriggerServerEvent('107')
			elseif WarMenu.Button('10-17(EnRoute)') then
			TriggerServerEvent('1017')
			elseif WarMenu.Button('10-23(On Scene)') then
			TriggerServerEvent('1023')
			elseif WarMenu.Button('10-61(Traffic Stop)') then
			TriggerServerEvent('1061')
			elseif WarMenu.Button('Units OnDuty') then
			TriggerServerEvent('avail')
		
		
		end
	
	
	
	
	
	
	end
	
	
	end
	
	
	
	
	end)


RegisterCommand('cars', function()
	
	WarMenu.Display()
	WarMenu.OpenMenu('carspawn')
end)

Citizen.CreateThread(function()
	--local player = GetPlayerPed(-1)
	local speechType = {"Normal", "Aggressive"}
	local prices = { "$50", "$100", "$150", "$200", "$250", "$500", "$1000"  }
	local currentItemIndex = 1
    local selectedItemIndex = 1
	
    WarMenu.CreateMenu('PIS:trfc', 'Traffic Stop')
	WarMenu.SetTitleBackgroundColor('PIS:trfc', 15, 60, 125, 255)
	WarMenu.SetTitleColor('PIS:trfc', 255, 255, 255, 255)
	
	WarMenu.CreateSubMenu('trfc:qstn', 'PIS:trfc','Traffic Stop')
	WarMenu.SetTitleBackgroundColor('trfc:qstn', 15, 60, 125, 255)
	WarMenu.SetTitleColor('trfc:qstn', 255, 255, 255, 255)
	
	WarMenu.CreateSubMenu('trfc:tkt', 'PIS:trfc','Traffic Stop')
	WarMenu.SetTitleBackgroundColor('trfc:tkt', 15, 60, 125, 255)
	WarMenu.SetTitleColor('trfc:tkt', 255, 255, 255, 255)

    while true do		
        if WarMenu.IsMenuOpened('PIS:trfc') then
				if WarMenu.ComboBox('Speech', speechType, currentItemIndex, selectedItemIndex, function(currentIndex, selectedIndex)
						currentItemIndex = currentIndex
						selectedItemIndex = selectedIndex
						speech = speechType[selectedItemIndex]
					end) then
				elseif WarMenu.Button('Hello') then
					TriggerEvent("pis:hello")
				elseif WarMenu.Button('Ask for Identification') then
					TriggerEvent("pis:footid")
				elseif WarMenu.MenuButton('Question Driver', "trfc:qstn") then
				elseif WarMenu.MenuButton('Issue Ticket', "trfc:tkt") then
				elseif WarMenu.Button('Issue Warning') then
					TriggerEvent("pis:warn")
				elseif IsPedInAnyVehicle(stoppedDriver) then
					if WarMenu.Button('Order out of vehicle') then
						TriggerEvent("pis:exit")
					elseif WarMenu.Button('Release') then
						TriggerEvent("pis:release")
					end
				elseif not IsPedInAnyVehicle(stoppedDriver) then
					if WarMenu.Button('Order back in vehicle') then
						TriggerEvent("pis:mount")
					elseif WarMenu.Button('Release') then
						TriggerEvent("pis:release")
					end
				end
		
			WarMenu.Display()
        elseif WarMenu.IsMenuOpened('trfc:qstn') then
			if WarMenu.Button('Do you know why I stopped you?') then
			TriggerEvent('pis:stop:q')
			elseif WarMenu.Button('Where are you coming from?') then
			TriggerEvent("pis:loc:q")
			elseif WarMenu.Button('Where are you heading today?') then
			TriggerEvent("pis:locs:q")
			elseif WarMenu.Button('Have you had anything to drink today?') then
			TriggerEvent("pis:drunk:q")
			elseif WarMenu.Button('Have you took any drugs recently?') then
			TriggerEvent("pis:drug:q")
			elseif WarMenu.Button('Anything illegal in the vehicle?') then
			TriggerEvent("pis:illegal:q")
			elseif WarMenu.Button('Can i search your vehicle?') then
			TriggerEvent("pis:search:q")
			end
			
			WarMenu.Display()
        elseif WarMenu.IsMenuOpened('trfc:tkt') then
            if WarMenu.ComboBox('Price', prices, currentItemIndex, selectedItemIndex, function(currentIndex, selectedIndex)
                    currentItemIndex = currentIndex
                    selectedItemIndex = selectedIndex
					price = prices[selectedItemIndex]
                end) then
					ShowNotification("You have selected:~g~ " .. price .. "~w~.")
			elseif WarMenu.Button('Reason') then
				DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
					while (UpdateOnscreenKeyboard() == 0) do
						DisableAllControlActions(0);
						Wait(0);
					end
					if (GetOnscreenKeyboardResult()) then
						local result = GetOnscreenKeyboardResult()
						reason = result
					end
			elseif WarMenu.Button('Ticket') then
				local myname = NetworkPlayerGetName(PlayerId())
				if reason == nil or price == nil then
					ShowNotification("~r~Please select a reason and a price!")
				else
				TriggerEvent('pis:ticket')
				end
            end
			
            WarMenu.Display()
		elseif IsDisabledControlPressed(1, modifier) and IsDisabledControlJustPressed(1, trfmnu) and stopped == true and GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(stoppedDriver)) < 3 then --E
            WarMenu.OpenMenu('PIS:trfc')
		
       end

        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
	local player = GetPlayerPed(-1)
	local speechType = {"Normal", "Aggressive"}
	local currentItemIndex = 1
    local selectedItemIndex = 1
	
    WarMenu.CreateMenu('PIS:trfc:veh', 'Traffic Stop')
	WarMenu.SetTitleBackgroundColor('PIS:trfc:veh', 15, 60, 125, 255)
	WarMenu.SetTitleColor('PIS:trfc:veh', 255, 255, 255, 255)
	

    while true do
        if WarMenu.IsMenuOpened('PIS:trfc:veh') then
			if WarMenu.Button('Mimic') then
				TriggerEvent("pis:mimic")
            elseif WarMenu.Button('Follow') then
				TriggerEvent("pis:follow")
            end
		
            WarMenu.Display()
		elseif IsDisabledControlPressed(1, modifier) and IsDisabledControlJustPressed(1, trfcveh) and stopped == true then
            WarMenu.OpenMenu('PIS:trfc:veh')
		end

        Citizen.Wait(0)
	end
end)

function titleCase(first, rest)
   return first:upper()..rest:lower()
end

RegisterCommand("callouts", function()
	WarMenu.OpenMenu('PIS:call:mnu')
end)

Citizen.CreateThread(function()
	local player = GetPlayerPed(-1)
	local speechType = {"Normal", "Aggressive"}
	local currentItemIndex = 1
    local selectedItemIndex = 1
	
    WarMenu.CreateMenu('PIS:call:mnu', 'Callouts (WIP)')
	WarMenu.SetTitleBackgroundColor('PIS:call:mnu', 15, 60, 125, 255)
	WarMenu.SetTitleColor('PIS:call:mnu', 255, 255, 255, 255)
	

    while true do
        if WarMenu.IsMenuOpened('PIS:call:mnu') then
			if WarMenu.Button('Armed Subject (Interaction Menu)') then
				TriggerEvent('pis:weapon:spawn', s)
					Wait(2000)
				TriggerEvent('pis:weapon', -1)
				TriggerEvent('pis:notification', -1)
			elseif WarMenu.Button('Shots Fired') then
				TriggerEvent('pis:shots:spawn', s)
					Wait(2000)
				TriggerEvent('pis:shots', -1)
				TriggerEvent('pis:notification', -1)
			elseif WarMenu.Button('Shots Fired v2') then
				TriggerEvent('pis:crazy:spawn', s)
					Wait(2000)
				TriggerEvent('pis:crazy', -1)
				TriggerEvent('pis:notification', -1)
			elseif WarMenu.Button('Knife') then
				TriggerEvent('pis:knifeCallout', s)
					Wait(1000)
				TriggerEvent('pis:notification', -1)
			elseif WarMenu.Button('Shoplifting') then
				TriggerEvent('pis:shoplifting:spawn', s)
					Wait(2000)
				TriggerEvent('pis:shoplifting', -1)
				TriggerEvent('pis:notification', -1)
			elseif WarMenu.Button('Fight') then
				TriggerEvent('pis:fight:spawn', s)
					Wait(2000)
				TriggerEvent('pis:fight', -1)
				TriggerEvent('pis:notification', -1)
            end	
            WarMenu.Display()
		end
        Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	local player = GetPlayerPed(-1)
	local speechType = {"Normal", "Aggressive"}
	local currentItemIndex = 1
    local selectedItemIndex = 1
	
    WarMenu.CreateMenu('PIS:call', 'Callout Menu')
	WarMenu.SetTitleBackgroundColor('PIS:call', 15, 60, 125, 255)
	WarMenu.SetTitleColor('PIS:call', 255, 255, 255, 255)
	
	WarMenu.CreateSubMenu('call:cd4', 'PIS:call' ,'Are you sure?')
	WarMenu.SetTitleBackgroundColor('call:cd4', 15, 60, 125, 255)
	WarMenu.SetTitleColor('call:cd4', 255, 255, 255, 255)
	

    while true do
        if WarMenu.IsMenuOpened('PIS:call') then
			if callID == "weapon" then
				if WarMenu.ComboBox('Speech', speechType, currentItemIndex, selectedItemIndex, function(currentIndex, selectedIndex)
                    currentItemIndex = currentIndex
                    selectedItemIndex = selectedIndex
					speech = speechType[selectedItemIndex]
				end) then
				elseif WarMenu.Button('Drop the weapon!') then
					TriggerEvent("pis:weapon:drop:q")
				elseif WarMenu.Button('Face away from me!') then
					TriggerEvent("pis:weapon:face:q")
				elseif WarMenu.Button('Get on the ground!') then
					TriggerEvent("pis:weapon:knees:q")
				elseif WarMenu.Button('Threaten') then
					TriggerEvent("pis:weapon:threat:q")
				elseif WarMenu.MenuButton('Code 4', 'call:cd4') then
				end
				
			elseif	callID == "fight" then
				if WarMenu.Button('Fight Call') then
				elseif WarMenu.MenuButton('Code 4', 'call:cd4') then
				end
			end

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('call:cd4') then
			if WarMenu.Button('Yes') then
				callID = nil
				ShowNotification("Situation is ~g~Code 4~w~.")
				TriggerEvent("pis:code4")
				WarMenu.CloseMenu('call:cd4')
			elseif WarMenu.Button('No') then
				WarMenu.CloseMenu('call:cd4')
			end
		
            WarMenu.Display()
		elseif IsDisabledControlPressed(1, modifier) and IsControlJustPressed(0, trfcveh) and callID ~= nil then --E
            WarMenu.OpenMenu('PIS:call')
       end

        Citizen.Wait(0)
    end
end)