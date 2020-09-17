ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


local models = {
	"prop_cheetah_covered",
	"prop_entityxf_covered",
	"prop_jb700_covered"
}

RegisterNetEvent('esx_stash:stash')
AddEventHandler('esx_stash:stash', function()
	
	local vehicle, closestDistance = ESX.Game.GetClosestVehicle()
	local x, y, z = table.unpack(GetEntityCoords(vehicle, true))
	local heading = GetEntityHeading(vehicle)
	
	model = models[math.random(1, #models)]
	model = string.upper(model)

	if vehicle then 
		if closestDistance < 1.5 then
			if not IsPedInAnyVehicle(GetPlayerPed(-1), true) and not hid then
				SetEntityCollision(vehicle, true, true)
				SetEntityInvincible(vehicle, true)
				SetEntityVisible(vehicle, false, 0)

            	ESX.Game.SpawnObject(model, {
					x = x,
					y = y,
					z = z
			  	}, function(obj)
					SetEntityHeading(obj, heading)
					PlaceObjectOnGroundProperly(obj)
					SetEntityAsMissionEntity(obj, true, true)
					SetEntityCollision(obj, false, true)
				end)

				hid = true
			else
				local prop, closestDistance = ESX.Game.GetClosestObject()
				ESX.Game.DeleteObject(prop)

				SetEntityCollision(vehicle, true, true)
				SetEntityInvincible(vehicle, false)
				SetEntityVisible(vehicle, true, 0)

				hid = false
			end
		elseif IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			ESX.ShowNotification("You need to exit the vehicle")
		else
		ESX.ShowNotification("Not close enough")
		end
	else
		ESX.ShowNotification("No vehicle found")
	end
end)
