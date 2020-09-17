	--[[
		Antilag & 2-Step Script
			By Silence & Samuel_
		But Server stuff...
	]]

RegisterServerEvent("eff_flames")

AddEventHandler("eff_flames", function(entity)
	TriggerClientEvent("c_eff_flames", -1, entity)
end)

RegisterCommand("antilag", function(source, args, rawCommand)
	TriggerClientEvent("2step:Anti-lag", source, 0)
end)