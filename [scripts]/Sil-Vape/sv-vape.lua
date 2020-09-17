


RegisterNetEvent("Vape:Failure")
RegisterServerEvent("eff_smokes")

if Config.VapePermission == true then
	RegisterCommand("vape", function(source, args, rawCommand)
		if IsPlayerAceAllowed(source, Config.PermissionsGroup) then
			if (tostring(args[1]) == "start") then
				TriggerClientEvent("Vape:StartVaping", source, 0)
			elseif (tostring(args[1]) == "stop") then
				TriggerClientEvent("Vape:StopVaping", source, 0)
			elseif (tostring(args[1])) ~= nil then
				TriggerClientEvent("chatMessage", source, "^1 Vaping: Error, Wrong Command must use /vape <start/stop>")
			end
			if Config.Debug then
				if (tostring(args[1]) == "fix") then
					TriggerClientEvent("Vape:VapeAnimFix", source, 0)
				elseif (tostring(args[1]) == "drag") then
					TriggerClientEvent("Vape:Drag", source, 0)
				end
			end
		else
			TriggerClientEvent("chatMessage", source, Config.InsufficientMessage)
		end
	end)
else
	RegisterCommand("vape", function(source, args, rawCommand)
		if (tostring(args[1]) == "start") then
			TriggerClientEvent("Vape:StartVaping", source, 0)
		elseif (tostring(args[1]) == "stop") then
			TriggerClientEvent("Vape:StopVaping", source, 0)
		elseif (tostring(args[1])) ~= nil then
			TriggerClientEvent("chatMessage", source, "^1 Vaping: Error, Wrong Command must use /vape <start/stop>")
		end
		if Config.Debug then
			if (tostring(args[1]) == "fix") then
				TriggerClientEvent("Vape:VapeAnimFix", source, 0)
			elseif (tostring(args[1]) == "drag") then
				TriggerClientEvent("Vape:Drag", source, 0)
			end
		end
	end)
end

AddEventHandler("Vape:Failure", function()
	_s = source
	Player = GetPlayerName(_s)
	TriggerClientEvent("chatMessage", -1, " ^3>>> ^2Well, it seems that ^4@"..Player.."^2's vape has exploded in their face, The odds of that are ^31 ^2in ^310,594")
end)
AddEventHandler("eff_smokes", function(entity)
	TriggerClientEvent("c_eff_smokes", -1, entity)
end)
