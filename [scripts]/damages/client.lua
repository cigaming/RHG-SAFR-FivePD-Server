
Citizen.CreateThread(function()
	while true do
		Wait(0)

		local ped = GetPlayerPed(-1)
		local inWater = IsPedSwimmingUnderWater(ped)

		SetPedMinGroundTimeForStungun(ped, Config.TaserTime)
		SetPlayerVehicleDamageModifier(ped, Config.VehicleDamage)

		SetAiMeleeWeaponDamageModifier(Config.AiMeleeDamage)
		SetPlayerMeleeWeaponDamageModifier(ped, Config.AiMeleeDamage)
		SetPlayerWeaponDamageModifier(ped, Config.AiMeleeDamage)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), Config.AiMeleeDamage) 
	
		if inWater then
			SetEnableScuba(ped, true)
			SetPedMaxTimeUnderwater(ped, Config.UnderWaterStam)
		end
		
		if Config.SeperateDamage then
			SetPlayerMeleeWeaponDamageModifier(ped, Config.MeleeDamage)
			SetPlayerWeaponDamageModifier(ped, Config.WepDamage)
		end
	end
end)