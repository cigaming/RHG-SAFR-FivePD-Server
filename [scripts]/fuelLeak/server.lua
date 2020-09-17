ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		local vehicle, closestDistance = ESX.Game.GetClosestVehicle()

		if vehicle then
			SetVehiclePetrolTankHealth(vehicle, 650)
			SetDisableVehiclePetrolTankDamage(vehicle, false)
			SetDisableVehiclePetrolTankFires(vehicle, false)
		end
	end
end)
