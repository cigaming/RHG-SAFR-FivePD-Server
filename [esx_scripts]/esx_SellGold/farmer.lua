
local golds = {}
local isPickingUp, isProcessing = false, false
local IsRiding = false
local Tractor = false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, config.zones.process.coords, true) < 1 then
			if not isProcessing then
				ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to ~g~Process")
			end

			if IsControlJustReleased(0, 38) and not isProcessing then
					Process()
			end
		else
			Citizen.Wait(500)
		end
	end
end)

function Process()
	isProcessing = true
    TriggerEvent("mythic_progbar:client:progress", {
						 
							name = "unique_action_name",
							duration = 10000,
							label = "MELTING GOLD BARS....",
							useWhileDead = false,
							canCancel = true,
							controlDisables = {
								disableMovement = true,
								disableCarMovement = true,
								disableMouse = false,
								disableCombat = true,
								},
								
							}, function(status)
								if not status then
									-- Do Something If Event Wasn't Cancelled
								end
						end)
	TriggerServerEvent('esx_SellGold:process')
	local timeLeft = 10000 / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1
		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), config.zones.process.coords, false) > 4 then
			TriggerServerEvent('esx_SellGold:cancelProcessing')
			break
		end
	end

	isProcessing = false
end


AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(golds) do
			ESX.Game.DeleteObject(v)
		end
	end
end)


function GetCoordZ(x, y)
	local groundCheckHeights = { 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 43.0
end