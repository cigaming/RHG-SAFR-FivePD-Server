-- W A R N I N G ! --
--THIS SCRIPT OFTEN DOESN'T WORK WHEN YOU HAVE MORE THAN 1 PERSON ON THE SERVER (probably something to do with player's relationship group... and most of the stuff being clientside)

-- common issues (most of them to do with the game not properly syncing the script for all of the players)
--   * the script glitches out in unpredictable ways
--   * /book won't work sometimes
--   * some animations (walking with cuffs) may not be seen by other players
--   * peds making surprised gestures while being detained
--   * peds deciding to just run away from you
--   * (rare, when spamming e) peds will run away in fear, you won't be able to arrest them again.
--   * peds will enter the second seat (instead of sitting in the backseat)
--   * /secure freezes players inside the vehicle (can be fixed, just need to check if the ped is a player or not)

local spawnDistance = 50 	--	Default 50
							---								---
local drivingStyle = 1074528293 --	**c  - "Normal"**
								--	**1074528293 - "Rushed"**
								--	**2883621 - "Ignore Lights" - Default**
								--	**5 - "Sometimes Overtake Traffic"**
								--	**Customize Driving Style: https://vespura.com/drivingstyle/

local distanceToCheck = 5.0

enroute = false
onscene = false
cleartask = false

isPedCuffed = false
backSeatOnly = true

--Zones
local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }

AddRelationshipGroup("arrested")
AddRelationshipGroup("hostile")

SetRelationshipBetweenGroups(5, GetHashKey("hostile"), GetHashKey("PLAYER"))
SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("hostile"))

SetRelationshipBetweenGroups(2, GetHashKey("arrested"), GetHashKey("PLAYER"))
SetRelationshipBetweenGroups(2, GetHashKey("PLAYER"), GetHashKey("arrested"))

-- Animation Dictionary
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Wait( 0 )
    end
end

--On Key Press
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
		if IsControlJustPressed(0, 323) or IsControlJustPressed(0, 51) then --Press X or E
            player = GetPlayerPed(-1)
			_ , target = GetEntityPlayerIsFreeAimingAt(PlayerId()) -- get the ped you're aiming at
			if GetEntityType(target) == 1 and GetPedType(target) ~= 28  then
			distanceToTarget = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(target)) -- get the distance between peds.
				if distanceToTarget <= 15 then
					RequestAnimDict("mp_arresting") --Cuff Animation
					loadAnimDict( "random@arrests" ) --Kneeling Animations
					loadAnimDict( "random@arrests@busted" )
					if IsPedInAnyVehicle(target) then -- if the target ped is in a vehicle...
						SetBlockingOfNonTemporaryEvents(target, true)
						if target == stoppedDriver then -- and if the ped is a driver during a pullover...
							ShowNotification("~o~Officer:~w~ Out of the vehicle! Now!")
							local resistExitChance = math.random(-5,30) -- random chance of the guy resisting.
							if drunk then
								resistExitChance = math.random(15,29)
							end
							if isStolen then
								resistExitChance = math.random(25,29)
							end
							if resistExitChance > 25 then
								stopped = false
								mimicking = false
								lockedin = false
								SetVehicleEngineOn(stoppedVeh, true, false, true)
								Citizen.Wait(500)
								local driverResponseResist = {"No way!","Fuck off!","Not today!","Shit!","Uhm.. Nope.","Get away from me!","Pig!","No.","Never!"}
								ShowNotification("~b~Driver:~w~ ".. driverResponseResist[math.random(#driverResponseResist)])
								Citizen.Wait(5000)
								TriggerEvent("po:flee")
							else
								while IsPedInAnyVehicle(target) do
									TaskLeaveAnyVehicle(target)
									Citizen.Wait(100)
								end
								TriggerEvent("arresting")
							end
						else -- .. but if it's just a random guy driving by (not in a pullover)
							while IsPedInAnyVehicle(target) do
								TaskLeaveAnyVehicle(target) -- make him exit the vehicle.
								Citizen.Wait(100)
							end
							TriggerEvent("arresting")
						end
					elseif target == sus1ab or target == sus2ab then --if the target is part of a callout then do nothing.
					-- if the guy is currently doing animations - do nothing.
					elseif IsEntityPlayingAnim(target, "random@arrests", "idle_2_hands_up", 3) or IsEntityPlayingAnim(target, "random@arrests", "kneeling_arrest_idle", 3) or IsEntityPlayingAnim(target, "random@arrests@busted", "enter", 3) or IsEntityPlayingAnim(target, "random@arrests@busted", "exit", 3) or IsEntityPlayingAnim(target, "random@arrests", "kneeling_arrest_get_up", 3) then
					-- if the guy is kneeling, ready to be handcuffed, free him.
					elseif IsEntityPlayingAnim(target, "random@arrests@busted", "idle_a", 3) then

						TriggerEvent("freeing")

					else -- otherwise, make him kneel and put his hands up.


						TriggerEvent("arresting")

					end
				end
			elseif true then
			

			end
		end
	end
end)
RegisterNetEvent('pis:arr:pt')
AddEventHandler('pis:arr:pt', function()
	local spawnDistance = math.random(spawnDistance, spawnDistance + 25)
	local player = GetPlayerPed(-1)
    local playerPos = GetEntityCoords(player)
    local pmodels = {"s_m_y_sheriff_01"}
    local vehicles = {"pvan"}
    local driver = GetHashKey(pmodels[math.random(#pmodels)])
    local vehiclehash = GetHashKey(vehicles[math.random(#vehicles)])
    local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(player, 0.0, distanceToCheck, 0.0)
    RequestModel(vehiclehash)
    RequestModel(driver)

		while not HasModelLoaded(vehiclehash) and RequestModel(driver) do
			RequestModel(vehiclehash)
			RequestModel(driver)
			Citizen.Wait(0)
		end
		
		if DoesEntityExist(vehicle) then
			SetEntityAsMissionEntity(driver)
			SetEntityAsMissionEntity(vehicle)
			
			DeleteEntity(driver)
			DeleteEntity(vehicle)
			
			while DoesEntityExist(driver) do
				Wait(0)
				DeleteEntity(driver)
			end
		end
	
		local targetPed = cuffingPed
	
		if DoesEntityExist(targetPed) then
			TriggerEvent('radio')
			
			
			local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
			local heading, vector = GetNthClosestVehicleNode(x, y, z, spawnDistance, 0, 0, 0)
			local sX, sY, sZ = table.unpack(vector)	
			vehicle = CreateVehicle(vehiclehash, sX, sY, sZ, heading, true, true)
			
			ShowNotification('~o~Officer: ~w~Dispatch, requesting Prisoner Trasport to my 20.')
			
			Wait(5000)

			local driver = CreatePedInsideVehicle(vehicle, 26, driver, -1, true, false)
			local pedPos = GetEntityCoords(targetPed)
			TaskVehicleDriveToCoord(driver, vehicle, pedPos.x, pedPos.y, pedPos.z, 17.0, 0, vehiclehash, drivingStyle, 1.0, true)
			SetVehicleFixed(vehicle)
			SetVehicleOnGroundProperly(vehicle)
			if DoesEntityExist(driver) and DoesEntityExist(vehicle) then
			SetEntityAsMissionEntity(driver, true, true)
			vanBlip = AddBlipForEntity(vehicle)
			SetBlipColour(vanBlip, 29)
			SetBlipFlashes(vanBlip, true)

			local distanceToVan = GetDistanceBetweenCoords(GetEntityCoords(vehicle), GetEntityCoords(targetPed))

			if distanceToVan < 100 then
			  eta = '~g~1 Mike'
			elseif distanceToVan < 300 then
			  eta = '~g~2 Mikes'
			elseif distanceToVan < 500 then
			  eta = '~o~3 Mikes'
			elseif distanceToVan > 500 then
			  eta = '~r~5 Mikes'
			end

			ShowNotification('~o~Dispatch: ~w~A prisoner transport van has been dispatched to your location. ~w~\nETA: ' .. eta)
			enroute = true
			while (enroute) do
			Citizen.Wait(300)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(vehicle), GetEntityCoords(targetPed), 1)
			SetEntityInvincible(vehicle, true)
			if distanceToVeh <= 25 then
			local isopen = GetVehicleDoorAngleRatio(vehicle,2)
				
				SetEntityInvincible(vehicle, false)
					
				SetVehicleIndicatorLights(vehicle, 1, true)
				SetVehicleIndicatorLights(vehicle, 2, true)
				
				TaskVehicleTempAction(driver, vehicle, 27, 5000)
				SetVehicleSiren(vehicle, true)
					
					if GetEntitySpeed(vehicle) < 5 then
						TaskLeaveVehicle(driver, vehicle, 256)
						TaskOpenVehicleDoor(driver, vehicle, -1, 1, 2.0)
							Wait(1000)
						TaskGoToEntity(driver, targetPed, -1, 3, 1.0, 0, 0)
					end
							
						if isopen ~= 0 then
							RemovePedFromGroup(cuffingPed)
							TaskEnterVehicle(targetPed, vehicle, 10000, 1, 2.0, 1, 0)
							ShowNotification("~o~Officer: ~w~Don't drop the soap!")
							
							
							if IsPedInVehicle(targetPed, vehicle, false) then
								TaskEnterVehicle(driver, vehicle, -1, -1, 2.0, 1, 0)
								SetDriveTaskDrivingStyle(vehicle, 786603)
								SetVehicleDoorShut(vehicle,2,0)
								SetVehicleDoorShut(vehicle,3,0)
								TaskVehicleDriveWander(driver, vehicle, 15.0, drivingStyle)
											
								ShowNotification("~o~Van Driver:~w~ I've got it from here.")
								enroute = false
								vanBlip = RemoveBlip(vanBlip)
								SetVehicleIndicatorLights(vehicle, 1, false)
								SetVehicleIndicatorLights(vehicle, 2, false)
								Wait(30000)
								dofade(vehicle)
								dofade(driver)
								dofade(targetPed)
							end
						--end
					end
				end
			end
		end
		else
		ShowNotification("No ped found!")
	end
end)


RegisterNetEvent('pis:arr:handcuff')
AddEventHandler('pis:arr:handcuff', function()	-- on /handcuff
	Citizen.CreateThread(function()
	local player = GetPlayerPed(-1)
	local playerPos = GetEntityCoords( player )
    local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( player, 0.0, 5.0, 0.0 ) -- get the ped DIRECTLY IN FRONT OF THE PLAYER (can be hard to get right, need some other way to do this. Maybe get the closest ped to the player)
    cuffingPed = GetPedInDirection( playerPos, inFrontOfPlayer )
	if DoesEntityExist(cuffingPed) then -- if the ped exits in front of the player.
		--ShowNotification("~g~It exists.")
	else
		--ShowNotification("~o~Nope.")
	end
	if IsEntityPlayingAnim(cuffingPed, "random@arrests@busted", "idle_a", 3) then -- if the person is doing "kneeling, hands behind head" animation, put him under arrest.
		ShowNotification("~g~Cuffing...")
		local player = GetPlayerPed(-1) --Player
		local playerGroupId = GetPedGroupIndex(player)
		isPedCuffed = true
		-- make him stand up and enable handcuff animations.
		TaskPlayAnim(player, "mp_arresting", "a_uncuff", 8.0, -8, -1, 49, 0, 0, 0, 0)
		TaskPlayAnim(cuffingPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(cuffingPed, player, 11816, 0, 0.3, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		Citizen.Wait (2000)
		DetachEntity(cuffingPed, true, false)
		ClearPedSecondaryTask(player)
		TaskPlayAnim( cuffingPed, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
		Citizen.Wait (1000)
		TaskPlayAnim( cuffingPed, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
		-- join player's relationship group (make him follow you)
		SetPedAsGroupMember(cuffingPed, playerGroupId)
		SetEnableHandcuffs(cuffingPed, true)
		SetPedCanTeleportToGroupLeader(cuffingPed,GetPlayerGroup(player),true) -- may not work in mp.      
	elseif DoesEntityExist(cuffingPed) then -- if the person in front of you exists, and isn't kneeling, unhandcuff him.
		ShowNotification("~g~Uncuffing...")
		isPedCuffed = false
		TaskPlayAnim(player, "mp_arresting", "a_uncuff", 8.0, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(cuffingPed, player, 11816, 0, 0.65, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		Citizen.Wait (2000)
		RemovePedFromGroup(cuffingPed)
		DetachEntity(cuffingPed, true, false)
		ClearPedSecondaryTask(cuffingPed)
		ClearPedSecondaryTask(player)
		ClearPedTasks(cuffingPed)
		SetPedCanRagdoll(suspect, true) -- make him able to ragdoll
		SetBlockingOfNonTemporaryEvents(suspect, false) -- makes him react to scary things (gunshots etc)
	else
		ShowNotification("~r~You must be looking at the suspect.")
	while isPedCuffed do
	Citizen.Wait(0)
		if not IsEntityDead(cuffingPed) and IsPedCuffed == true then
				TaskPlayAnim(cuffingPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
		end
	end
	end
	end)
end)

function GetPedInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 12, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

RegisterNetEvent('arresting')
AddEventHandler('arresting', function()
	Citizen.CreateThread(function()
	local suspect = target
	SetBlockingOfNonTemporaryEvents(suspect, true) --makes him ingore anything that could potentially scare him.
	--SetPedCanPlayGestureAnims(suspect, false)
	SetPedCanRagdoll(suspect, true) -- make him unable to ragdoll
	TaskPlayAnim(suspect, "random@arrests", "idle_2_hands_up", 8.0, 2.0, -1, 2, 0, 0, 0, 0 )
		Citizen.Wait (4000)
	TaskPlayAnim(suspect, "random@arrests", "kneeling_arrest_idle", 8.0, 2.0, -1, 2, 0, 0, 0, 0 )
	GetWeaponObjectFromPed(suspect,false)
	RemoveAllPedWeapons(suspect)

	TaskPlayAnim(suspect, "random@arrests@busted", "enter", 8.0, 3.0, -1, 2, 0, 0, 0, 0 )
		Citizen.Wait (500)
	TaskPlayAnim(suspect, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
	end)
end)

RegisterNetEvent('freeing')
AddEventHandler('freeing', function()
	local suspect = target
	Citizen.CreateThread(function()
	TaskPlayAnim( suspect, "random@arrests@busted", "exit", 8.0, 2.0, -1, 2, 0, 0, 0, 0 )
	Citizen.Wait (2000)
	TaskPlayAnim( suspect, "random@arrests", "kneeling_arrest_get_up", 8.0, 2.0, -1, 128, 0, 0, 0, 0 )
	Citizen.Wait (3000)
	ClearPedSecondaryTask(suspect)
	SetPedCanRagdoll(suspect, true)
	--SetPedCanPlayGestureAnims(suspect, true) -- idk what this does.
	end)
end)

RegisterNetEvent('secure')
AddEventHandler('secure', function()
if IsPedInAnyVehicle(player) then -- if player is in a vehicle.
	local player = GetPlayerPed(-1) --Player
		Citizen.CreateThread(function()
		for n =0,GetVehicleMaxNumberOfPassengers(GetVehiclePedIsIn(player)),1 do -- make everyone sitting in the car frozen (unable to move/exit the car)
			Citizen.Wait(0)
			if IsPedAPlayer(GetPedInVehicleSeat(GetVehiclePedIsIn(player),n)) == false then
				SetPedConfigFlag(GetPedInVehicleSeat(GetVehiclePedIsIn(player),n),292,true)
			end
		end
	end)
end
end)

RegisterNetEvent('pis:arr:unsecure')
AddEventHandler('pis:arr:unsecure', function()
		Citizen.CreateThread(function()
			for n =0,GetVehicleMaxNumberOfPassengers(GetVehiclePedIsIn(player,true)),1 do
			Citizen.Wait(0)
			SetPedConfigFlag(GetPedInVehicleSeat(GetVehiclePedIsIn(player,true),n),292,false)
			TaskLeaveAnyVehicle(GetPedInVehicleSeat(GetVehiclePedIsIn(player,true),n))
			Citizen.Wait(100)
			SetPedConfigFlag(GetPedInVehicleSeat(GetVehiclePedIsIn(player,true),n),292,false)
			end
	end)
end)

isPedBeingGrabbed = false
RegisterNetEvent('pis:arr:grab')
AddEventHandler('pis:arr:grab', function()
    local player = GetPlayerPed(-1)
    local playerPos = GetEntityCoords(player)
    local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords (player, 0.0, 5.0, 0.0)
    local infrontPed = GetPedInDirection(playerPos, inFrontOfPlayer)
    arrestedPed = infrontPed
    local player = GetPlayerPed(-1)
        if isPedBeingGrabbed == false then
            AttachEntityToEntity(arrestedPed, player, 11816, -0.3, 0.4, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
			SetBlockingOfNonTemporaryEvents(arrestedPed, true)
            grabbedPed = arrestedPed
            isPedBeingGrabbed = true
        elseif isPedBeingGrabbed == true then
            DetachEntity(grabbedPed, true, false)
            isPedBeingGrabbed = false
        end
end)

isPedKneeling = false
RegisterNetEvent('pis:arr:kneel')
AddEventHandler('pis:arr:kneel', function()
	local playerPos = GetEntityCoords( player )
	local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( player, 0.0, 5.0, 0.0 )
	local kneelPed = GetPedInDirection( playerPos, inFrontOfPlayer )
	
	if DoesEntityExist(kneelPed) then
		if GetPedGroupIndex(kneelPed) == GetPlayerGroup(player) then
			if isPedKneeling == false then
				TaskPlayAnim(kneelPed, "random@arrests", "idle_2_hands_up", 8.0, 2.0, -1, 2, 0, 0, 0, 0 )
				Citizen.Wait (4000)
				TaskPlayAnim(kneelPed, "random@arrests@busted", "enter", 8.0, 3.0, -1, 2, 0, 0, 0, 0 )
				Citizen.Wait (500)
				TaskPlayAnim(kneelPed, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
				isPedKneeling = true
			else
				TaskPlayAnim(kneelPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
				Citizen.Wait (2000)
				TaskPlayAnim(kneelPed, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
				Citizen.Wait (2000)
				TaskPlayAnim(kneelPed, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
				isPedKneeling = false
			end
		end
	else
		ShowNotification("~r~You must be looking at the suspect.")
	end
end)

Citizen.CreateThread(function()
	while backSeatOnly do -- this is super glitchy when there are people other than you on the server.
        Citizen.Wait(1000)
			distanceToPed = GetDistanceBetweenCoords(GetPlayerPed(-1), target)
			if IsPedInAnyVehicle(player) then
				for i=0,GetGroupSize(GetPlayerGroup(player)),1 do
					Citizen.Wait(0)
					if IsPedInVehicle(GetPedAsGroupMember(GetPlayerGroup(player),i),GetVehiclePedIsIn(player),false) then
					TriggerEvent("secure")
					Citizen.Wait(500)
					else
						if IsVehicleSeatFree(GetVehiclePedIsIn(player),1) then
							TaskEnterVehicle(GetPedAsGroupMember(GetPlayerGroup(player),i), GetVehiclePedIsIn(player), -1, 1, 2.0, 1, 0)
						else
							TaskEnterVehicle(GetPedAsGroupMember(GetPlayerGroup(player),i), GetVehiclePedIsIn(player), -1, 2, 2.0, 3, 0)
						end
					end
				end
			end
		end
	end)

RegisterNetEvent('pis:arr:book')
AddEventHandler('pis:arr:book', function()
	local player = GetPlayerPed(-1) --Player
		Citizen.CreateThread(function()
		if GetPedGroupIndex(target) == GetPlayerGroup(player) then -- if the ped is in player's group, it's gonna do something. (doesn't work, maybe i'm checking for the wrong relationship group)
		SetEntityAsMissionEntity(target, true, true)
		DeleteEntity(target)
		end

		local playerPos = GetEntityCoords( player )
		local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( player, 0.0, 5.0, 0.0 )
		local bookingPed = GetPedInDirection( playerPos, inFrontOfPlayer )

		if GetPedGroupIndex(bookingPed) == GetPlayerGroup(player) then
		SetEntityAsMissionEntity(bookingPed, true, true)
		DeleteEntity(bookingPed)
		end
	end)
end)

function dofade(vehicle)
    Citizen.CreateThread(function()
    local fadeouttim = 0
    local alpha = 255
    SetEntityAlpha(vehicle,alpha)

    while alpha > 5 and DoesEntityExist(vehicle) and fadeouttim < 3 do
        alpha = alpha - 25
        Citizen.Wait(30)
        SetEntityAlpha(vehicle,alpha)
        if alpha <= 5 then
            while alpha < 255 do
                alpha = alpha + 25
                Citizen.Wait(10)
                SetEntityAlpha(vehicle,alpha)
            end
            fadeouttim = fadeouttim + 1
        end
    end
    SetEntityAsMissionEntity(vehicle)
    DeleteEntity(vehicle)
end)
end