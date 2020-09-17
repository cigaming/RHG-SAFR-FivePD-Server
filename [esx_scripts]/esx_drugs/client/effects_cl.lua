--Coke
RegisterNetEvent('esx_drugs:onCoke')
AddEventHandler('esx_drugs:onCoke', function()
  if not IsAnimated then
    IsAnimated = true
    local playerPed = PlayerPedId()
    
    Citizen.CreateThread(function()
      
      RequestAnimDict('move_p_m_two_idles@generic')
      while not HasAnimDictLoaded('move_p_m_two_idles@generic') do
        Wait(0)
      end
      TaskPlayAnim(playerPed, 'move_p_m_two_idles@generic', 'fidget_sniff_fingers', 5.0, -8, -1, 49, 0, 0, 0, 0)
      Wait(2000)
      IsAnimated = false
      ClearPedSecondaryTask(playerPed)
      AddArmourToPed(playerPed, 100)
    end)

    local player = PlayerId()
         
   SetTimecycleModifier("drug_flying_base")
   SetTimecycleModifierStrength(1.0)
   
   StartScreenEffect("DMT_flight", 120, 1)


	  Stamina(player)
      SetRunSprintMultiplierForPlayer(player, 1.35)

      Citizen.Wait(15000)
	  SetTimecycleModifierStrength(0.8)
	  

      Wait(30000)

      SetRunSprintMultiplierForPlayer(player, 1.0)
      ResetPlayerStamina(player)
      ClearTimecycleModifier()
      StopScreenEffect("DMT_flight")
  end
end)

-- Weed Effect
RegisterNetEvent('esx_drugs:onPot')
AddEventHandler('esx_drugs:onPot', function()
	RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
	while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
		Citizen.Wait(0)
	end
	TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
  Citizen.Wait(5000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	SetTimecycleModifier("AmbientPUSH")
	SetTimecycleModifierStrength(1.2)
	SetPedMotionBlur(GetPlayerPed(-1), true)
	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
  SetPedIsDrunk(GetPlayerPed(-1), true)


  Citizen.Wait(60000)
	ClearTimecycleModifier()
	ResetScenarioTypesEnabled()
	ResetPedMovementClipset(GetPlayerPed(-1), 0)
	SetPedIsDrunk(GetPlayerPed(-1), false)
  SetPedMotionBlur(GetPlayerPed(-1), false)
end)

--LSD
RegisterNetEvent('esx_drugs:onLsd')
AddEventHandler('esx_drugs:onLsd', function()
  
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  
    RequestAnimSet("move_m@drunk@moderatedrunk") 
    while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
      Citizen.Wait(0)
	end
	
	  SetTimecycleModifier("spectator5")
	  SetTimecycleModifierStrength(0.65)
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
    SetPedIsDrunk(playerPed, true)
    
    --Efects
    local player = PlayerId()
    SetRunSprintMultiplierForPlayer(player, 1.2)
    SetSwimMultiplierForPlayer(player, 1.3)

    Wait(45000)
    SetRunSprintMultiplierForPlayer(player, 1.0)
    SetSwimMultiplierForPlayer(player, 1.0)

    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
 end)


 function Stamina(player)
  
	Citizen.CreateThread( function()
	  while true do
		Citizen.Wait(0)
		RestorePlayerStamina(player, 1.0)
	  end
	end)
  end



RegisterNetEvent('esx_drugs:onSpice')
AddEventHandler('esx_drugs:onSpice', function()

  TriggerEvent('esx:showNotification', "~r~ITS ~g~SPICE ~y~TIME!")

  RequestAnimSet("move_m@drunk@moderatedrunk") 
  while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
    Citizen.Wait(0)
  end
  
  local playerPed = GetPlayerPed(-1)
  
  TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
	Citizen.Wait(5000)
	ClearPedTasksImmediately(GetPlayerPed(-1))

  TaskWanderStandard(playerPed, 10.0, 10)
  SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
  SetTimecycleModifier("DRUG_gas_huffin")
  SetTimecycleModifierStrength(1.0)

  StartScreenEffect("DrugsDrivingIn", 120, 1)

  ShakeGameplayCam('DRUNK_SHAKE', 0.5)
  Citizen.Wait(15000)
  SetPedMotionBlur(playerPed, true)
  ShakeGameplayCam('DRUNK_SHAKE', 1.5)

  Wait(60000)

  ClearTimecycleModifier()
  ResetScenarioTypesEnabled()
  ResetPedMovementClipset(GetPlayerPed(-1), 0)
  SetPedIsDrunk(GetPlayerPed(-1), false)
  SetPedMotionBlur(GetPlayerPed(-1), false)
  ShakeGameplayCam('DRUNK_SHAKE', 0.0)
  ClearPedTasksImmediately(GetPlayerPed(-1))
  StopScreenEffect("DrugsDrivingIn")
end)



RegisterNetEvent('esx_drugs:onVodka')
AddEventHandler('esx_drugs:onVodka', function()

  RequestAnimSet("move_m@drunk@verydrunk") 
  while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
    Citizen.Wait(0)
  end

  RequestAnimSet("move_m@drunk@moderatedrunk") 
  while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
    Citizen.Wait(0)
  end

  local playerPed = GetPlayerPed(-1)
 
  TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_DRINKING", 0, true)
	Citizen.Wait(5000)
  ClearPedTasksImmediately(GetPlayerPed(-1))

  SetPedMotionBlur(playerPed, true)
  ShakeGameplayCam('DRUNK_SHAKE', 3.0)
  SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
  Citizen.Wait(15000)
  ShakeGameplayCam('DRUNK_SHAKE', 4.0)
  SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
  Citizen.Wait(10000)
  ShakeGameplayCam('DRUNK_SHAKE', 5.5)
  SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)

  Wait(60000)

  ClearTimecycleModifier()
  ResetScenarioTypesEnabled()
  ResetPedMovementClipset(GetPlayerPed(-1), 0)
  SetPedIsDrunk(GetPlayerPed(-1), false)
  SetPedMotionBlur(GetPlayerPed(-1), false)
  ShakeGameplayCam('DRUNK_SHAKE', 0.0)
end)



RegisterNetEvent('esx_drugs:onBeer')
AddEventHandler('esx_drugs:onBeer', function()

  RequestAnimSet("move_m@drunk@verydrunk") 
  while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
    Citizen.Wait(0)
  end

  RequestAnimSet("move_m@drunk@moderatedrunk") 
  while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
    Citizen.Wait(0)
  end

  local playerPed = GetPlayerPed(-1)
 
  TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_DRINKING", 0, true)
	Citizen.Wait(5000)
  ClearPedTasksImmediately(GetPlayerPed(-1))

  SetPedMotionBlur(playerPed, true)
  ShakeGameplayCam('DRUNK_SHAKE', 0.5)
  SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
  Citizen.Wait(15000)
  ShakeGameplayCam('DRUNK_SHAKE', 1.5)
  SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
  Citizen.Wait(10000)
  ShakeGameplayCam('DRUNK_SHAKE', 2.0)
  SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)


  Wait(60000)

  ClearTimecycleModifier()
  ResetScenarioTypesEnabled()
  ResetPedMovementClipset(GetPlayerPed(-1), 0)
  SetPedIsDrunk(GetPlayerPed(-1), false)
  SetPedMotionBlur(GetPlayerPed(-1), false)
  ShakeGameplayCam('DRUNK_SHAKE', 0.0)
end)