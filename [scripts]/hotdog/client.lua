	ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

--
--prop_cs_hotdog_01
--prop_cs_hotdog_02

RegisterNetEvent('esx_hotdog:onEat')
AddEventHandler('esx_hotdog:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_hotdog_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_taco:onEat')
AddEventHandler('esx_taco:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_taco_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)


RegisterNetEvent('esx_taco2:onEat')
AddEventHandler('esx_taco2:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_taco_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				TaskWanderStandard(playerPed, 10.0, 10)
				SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
				SetTimecycleModifier("spectator4")
				SetTimecycleModifierStrength(0.89)
				ShakeGameplayCam('DRUNK_SHAKE', 5.0)
				Citizen.Wait(15000)
				SetPedMotionBlur(playerPed, true)
				ShakeGameplayCam('DRUNK_SHAKE', 10.0)

				local player = PlayerId()
				SetRunSprintMultiplierForPlayer(player, 1.3)
				SetSwimMultiplierForPlayer(player, 1.3)
			  
				Citizen.Wait(3000)
				IsAnimated = false
				DeleteObject(prop)



			
				Wait(60000)
				ClearTimecycleModifier()
				ResetScenarioTypesEnabled()
				ResetPedMovementClipset(GetPlayerPed(-1), 0)
				SetPedIsDrunk(GetPlayerPed(-1), false)
				SetPedMotionBlur(GetPlayerPed(-1), false)
				ShakeGameplayCam('DRUNK_SHAKE', 0.0)
				ClearPedTasksImmediately(GetPlayerPed(-1))
				SetRunSprintMultiplierForPlayer(player, 1.0)
				SetSwimMultiplierForPlayer(player, 1.0)
			end)
		end)

	end
end)

RegisterNetEvent('esx_taco3:onEat')
AddEventHandler('esx_taco3:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_taco_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				TaskWanderStandard(playerPed, 10.0, 10)
				SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
				SetTimecycleModifier("spectator4")
				SetTimecycleModifierStrength(0.89)
				ShakeGameplayCam('DRUNK_SHAKE', 20.0)
				Citizen.Wait(15000)
				SetPedMotionBlur(playerPed, true)
				ShakeGameplayCam('DRUNK_SHAKE', 30.0)

				local player = PlayerId()
				SetRunSprintMultiplierForPlayer(player, 1.3)
				SetSwimMultiplierForPlayer(player, 1.3)
			  
				Citizen.Wait(3000)
				IsAnimated = false
				DeleteObject(prop)



			
				Wait(60000)
				ClearTimecycleModifier()
				ResetScenarioTypesEnabled()
				ResetPedMovementClipset(GetPlayerPed(-1), 0)
				SetPedIsDrunk(GetPlayerPed(-1), false)
				SetPedMotionBlur(GetPlayerPed(-1), false)
				ShakeGameplayCam('DRUNK_SHAKE', 0.0)
				ClearPedTasksImmediately(GetPlayerPed(-1))
				SetRunSprintMultiplierForPlayer(player, 1.0)
				SetSwimMultiplierForPlayer(player, 1.0)
			end)
		end)

	end
end)

function Stamina(player)
  
	Citizen.CreateThread( function()
	  while true do
		Citizen.Wait(0)
		RestorePlayerStamina(player, 1.0)
	  end
	end)
  end