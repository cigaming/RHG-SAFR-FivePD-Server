if FoxFix.Enabled then
	RegisterNetEvent('dufx:dofix')
	AddEventHandler('dufx:dofix', function(CostPrice)
		local thissource = source;
		if (CostPrice == 0) then
			TriggerClientEvent('dufx:actionfix', source, nil);
		else
			dopay = false;
			if FoxFix.Support.essentialmode.Enabled then
				dopay = true;
				TriggerEvent('es:getPlayerFromId', source, function(user)
				local thissource = source
					if user.getMoney() >= CostPrice then
						user.removeMoney(CostPrice);
						TriggerClientEvent('dufx:actionfix', source, true);
					else
						TriggerClientEvent('dufx:actionfix', source, 404);
					end	
				end);
			end
			if not dopay then
				TriggerClientEvent('dufx:actionfix', source, false);
			end
		end
	end)
	AddEventHandler('chatMessage', function(source, name, msg)
		cl = stringsplit(msg, " ");
		if cl[1] == "/SavePlace" then
			CancelEvent();
			TriggerClientEvent("dufx:save", source);
		end
		if FoxFix.GameSettings.EnableID then
			if cl[1] == "/MyPlayerID" then
				CancelEvent();
				local Source = source
				local id
				Ktab = {
					[1] = "steam:SOMESteamID",
					[2] = "license:SOMElicense",
					[3] = "ip:SOMEipaddress"
				}
				
				for k, i in ipairs(GetPlayerIdentifiers(Source))do
					TriggerClientEvent("dufx:notify", source, "~b~~h~You:~h~~s~: "..i);
				end
			end
		end
		if cl[1] == "/FoxVersion" then
			TriggerClientEvent("dufx:adnotify", source, "~r~~h~FoxFix Version~h~~s~: "..FoxFix.Version);
		end
	end)
	RegisterServerEvent("printback");
	AddEventHandler('printback', function(sourcce, str)
		print(str);
	end)
	function stringsplit(inputstr, sep)
		if sep == nil then
			sep = "%s"
		end
		local t={} ; i=1
		for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			t[i] = str
			i = i + 1
		end
		return t
	end
	RegisterServerEvent("DoSaveCoords");
	AddEventHandler("DoSaveCoords", function(PlayerName, x, y, z)
		file = io.open('resources\\dufx\\places\\'..PlayerName..".txt", "a");
		if file then
			file:write("{['x'] = " .. x .. ", ['y'] = " .. y .. ", ['z'] =  " .. z .. "}, \n");
		else
			print('Error[dufx]: '..GetPlayerName(source)..' ran SavePlace but unable to wright file \n');	
		end
		file:close();
	end)
end