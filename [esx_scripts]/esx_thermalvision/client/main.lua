RegisterNetEvent('esx_thermalvision:useThermalVision')
AddEventHandler('esx_thermalvision:useThermalVision', function()
	if IsNightvisionActive() then
		SetNightvision(false)
		SetSeethrough(false)
	else
		SetNightvision(true)
		SetSeethrough(true)
	end
end)
