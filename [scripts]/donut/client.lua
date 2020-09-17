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

RegisterNetEvent('esx_donut:onEat')
AddEventHandler('esx_donut:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_donut_01'
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

RegisterNetEvent('esx_donut2:onEat')
AddEventHandler('esx_donut2:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_donut_02'
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


RegisterNetEvent('esx_taco4:onEat')
AddEventHandler('esx_taco4:onEat', function(prop_name)
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


				SetPedMotionBlur(playerPed, true)
				local player = PlayerId()
				SetRunSprintMultiplierForPlayer(player, 1.3)
				SetSwimMultiplierForPlayer(player, 1.3)
			  
				Citizen.Wait(3000)
				IsAnimated = false
				DeleteObject(prop)

				Wait(60000)
				ResetScenarioTypesEnabled()
				ResetPedMovementClipset(GetPlayerPed(-1), 0)
				SetPedIsDrunk(GetPlayerPed(-1), false)
				SetPedMotionBlur(GetPlayerPed(-1), false)
				ClearPedTasksImmediately(GetPlayerPed(-1))
				SetRunSprintMultiplierForPlayer(player, 1.0)
				SetSwimMultiplierForPlayer(player, 1.0)
			end)
		end)

	end
end)

RegisterNetEvent('esx_monster:onDrink')
AddEventHandler('esx_monster:onDrink', function(prop_name)
	if not IsAnimated then
		local prop_name = prop_name or 'ng_proc_sodacan_01a'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)			
	        AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Wait(0)
			end
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)
			Wait(3000)
	        IsAnimated = false
	        ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)

			local player = PlayerId()
			SetRunSprintMultiplierForPlayer(player, 1.2)
			SetSwimMultiplierForPlayer(player, 1.2)

			Wait(5000)

			SetRunSprintMultiplierForPlayer(player, 1.0)
			SetSwimMultiplierForPlayer(player, 1.0)
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