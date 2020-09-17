local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

ESX                           = nil
local PlayerData                = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	
	Citizen.Wait(5000)

end)

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(10)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		if (GetDistanceBetweenCoords(coords, Config.CoffeeMachine.x, Config.CoffeeMachine.y, Config.CoffeeMachine.z, true) < 1.2)  then
			
			ESX.Game.Utils.DrawText3D({ x = 261.48, y = -820.676, z = 29.438 }, '~y~[E] ~w~Make a coffee', 0.6)
			
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Wait(0)
		
		local coords = GetEntityCoords(GetPlayerPed(-1))


		if(GetDistanceBetweenCoords(coords, Config.CoffeeMachine.x, Config.CoffeeMachine.y, Config.CoffeeMachine.z, true) < 2.0) then


			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil
			local zaplata = 0
		
			
			if IsControlJustReleased(0, Keys['E']) then
				TriggerServerEvent('coffeeshop:test')
			end
		end
	end
end)

