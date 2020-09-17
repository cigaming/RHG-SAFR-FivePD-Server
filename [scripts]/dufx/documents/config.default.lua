if FoxFix.Enabled then
	local garages = {
		--
		{['x'] = 216.41719055176, ['y'] = -938.8857421875, ['z'] = 24.141599655151},
		--[[ -- Police Station Back 2 Garages
		{['x'] = 463.8376159668, ['y'] = -1014.7070922852, ['z'] = 28.073232650757},
		{['x'] = 463.45822143555, ['y'] = -1019.6340332031, ['z'] = 28.105346679688},
		]]--
		{['x'] = 605.64086914063, ['y'] = 110.3161315918, ['z'] = 92.901382446289},
		--
		{['x'] = -1191.3162841797, ['y'] = -730.08862304688, ['z'] = 20.798816680908},
		--
		{['x'] = 2346.5559082031, ['y'] = 3104.0651855469, ['z'] = 48.172943115234},
		--
		{['x'] = 2170.6743164063, ['y'] = 4799.177734375, ['z'] = 41.18970489502},
		--
		{['x'] = 1391.6593017578, ['y'] = 6572.9052734375, ['z'] = 14.929975509644},
		--
		{['x'] = -363.29208374023, ['y'] = 6072.3154296875, ['z'] = 31.498435974121},
		--
		{['x'] = 8.2265348434448, ['y'] = -1825.1744384766, ['z'] = 25.080411911011},
		--
		{['x'] = -2944.611328125, ['y'] = 480.42813110352, ['z'] = 15.249175071716},
		-- Docks
		{['x'] = 592.15789794922, ['y'] = -2646.9653320313, ['z'] = 6.0811853408813},
		-- Dirt Lake
		{['x'] = 747.53491210938, ['y'] = 4222.9321289063, ['z'] = 50.584342956543}
	} 

	getPrice = function()
		math.randomseed(FoxFix.Seed + GetGameTimer());
		__Price = math.random(FoxFix.Support.essentialmode.MinCost, FoxFix.Support.essentialmode.MaxCost);
		return __Price;
	end
	RandDialog = function(x,y)
		math.randomseed(FoxFix.Seed + GetGameTimer());
		return math.random(x, y);
	end
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
	function FoxFix.dufxplay(sSound, nVol)
		local First = GetEntityCoords(GetPlayerPed(-1));
		local Second = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(-1)));
		if sSound == nil or sSound == "" then
			sSound = "drill";
		end
		if nVol == nil or nVol == "" then
			nVol = 0.4;
		end
		if(Vdist(First.x, First.y, First.z, Second.x, Second.y, Second.z) <= 6) then
			SendNUIMessage({
				CallType     = 'dufxaudio',
				CallFile     = sSound,
				CallVolume   = nVol
			})
		end
	end
	RegisterNetEvent('dufx:save')
	AddEventHandler('dufx:save', function()
		x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true));
		local PlayerName = GetPlayerName(PlayerId());
		DisplayBottomLeft("~b~~h~PlayerName~h~: ~g~"..PlayerName.."~s~, [x]:"..x..", [y]:"..y..", [z]:"..z);
		TriggerServerEvent("DoSaveCoords", PlayerName, x , y , z);		
	end)

	RegisterNetEvent('dufx:actionfix')
	AddEventHandler('dufx:actionfix', function(bTaken)
		if type(bTaken) == "number" and bTaken == 404 then
			DisplayBottomLeft("~r~~h~"..FoxFix.GarageName.."~h~~s~: "..FoxFix.Dialog[FoxFix.Language].Actions[5][RandDialog(1,4)]);
		else
			local nopayment = false;
			if type(bTaken) == "boolean" and not bTaken then
				nopayment = true;
			end
			vehid = GetVehiclePedIsIn(GetPlayerPed(-1), false);
			if not FoxFix.Support.RealisticVehicleFailure then
				SetVehicleUndriveable(vehid, true);
				SetVehicleEngineOn(vehid, false, false, false);
			else
				SetVehicleEngineOn(vehid, false, true, false);
				SetVehicleUndriveable(vehid, true);
				SetVehicleHandbrake(vehid, true);
				SetVehicleLights(vehid, 1);
				SetVehicleRadioEnabled(vehid, false);
				SetVehicleSilent(vehid, true);
			end
			if FoxFix.GarageSettings.Delay then
				DisplayBottomLeft("~b~~h~"..FoxFix.GarageName.."~h~~s~: "..FoxFix.Dialog[FoxFix.Language].GarageFix[1][RandDialog(1,4)]);
				Wait(1600);
				DisplayBottomLeft("~b~~h~"..FoxFix.GarageName.."~h~~s~: "..FoxFix.Dialog[FoxFix.Language].GarageFix[2][RandDialog(1,4)]);
				Wait(2600);
				DisplayBottomLeft("~b~~h~"..FoxFix.GarageName.."~h~~s~: "..FoxFix.Dialog[FoxFix.Language].GarageFix[3][RandDialog(1,4)]);
				Wait(300);
				SetVehicleDoorOpen(vehid, 4, false, false);
				Wait(300);
				DisplayBottomLeft("~b~~h~"..FoxFix.GarageName.."~h~~s~: "..FoxFix.Dialog[FoxFix.Language].GarageFix[4][RandDialog(1,4)]);
				if FoxFix.GarageSettings.Audio then
					FoxFix.dufxplay("drill", 0.4)
				end
				Wait(3600);
				DisplayBottomLeft("~b~~h~"..FoxFix.GarageName.."~h~~s~: "..FoxFix.Dialog[FoxFix.Language].GarageFix[5][RandDialog(1,4)]);
				if FoxFix.GameSettings.Fuel then
					SetVehicleFuelLevel(vehid, 60.0);
				end
				Wait(3300);
				SetVehicleDoorShut(vehid, 4, true);
				Wait(2600);
			end
			SetVehicleFixed(vehid);
			if FoxFix.GameSettings.Clean then
				if FoxFix.GarageSettings.Delay then
					DisplayBottomLeft("~b~~h~"..FoxFix.GarageName.."~h~~s~: "..FoxFix.Dialog[FoxFix.Language].GarageFix[7][RandDialog(1,4)]);
					Wait(800);
				end
				WashDecalsFromVehicle(GetVehiclePedIsUsing(GetPlayerPed(-1)), 1.0);
				SetVehicleDirtLevel(GetVehiclePedIsUsing(GetPlayerPed(-1)));
			end
			if nopayment then
				DisplayBottomLeft("~b~~h~"..FoxFix.GarageName.."~h~~s~: "..FoxFix.Dialog[FoxFix.Language].GarageFix[8]);
				if FoxFix.GarageSettings.Delay then
					if FoxFix.GameSettings.Clean then
						Wait(400);
					else
						Wait(800);
					end	
				end			
			end
			DisplayBottomLeft("~b~~h~"..FoxFix.GarageName.."~h~~s~: "..FoxFix.Dialog[FoxFix.Language].GarageFix[6][RandDialog(1,4)]);
			SetVehicleEngineOn(vehid, true, false, false);
			SetVehicleUndriveable(vehid, false);
			if FoxFix.Support.RealisticVehicleFailure then
				SetVehicleHandbrake(vehid, false);
				SetVehicleLights(vehid, 0);
				SetVehicleRadioEnabled(vehid, true);
				SetVehicleSilent(vehid, false);
			end
			PriceSet = getPrice();
		end
	end)
	function DisplayTopLeft(str)
		BeginTextCommandDisplayHelp("STRING");
		AddTextComponentScaleform(str);
		EndTextCommandDisplayHelp(0, 0, 1, -1);
	end
	function DisplayBottomLeft(str, blink)
		if type(blink) ~= "boolean" then
			blink = false;
		end
		SetNotificationTextEntry("STRING");
		AddTextComponentSubstringPlayerName(str);
		DrawNotification(blink, true);
	end
	function drawText(top, left, size, str, color, font, center)
		SetTextFont(font or 0);
		SetTextScale(1, size);
		SetTextColour(color[1], color[2], color[3], color[4]);
		if center then SetTextCentre(true) end
		BeginTextCommandDisplayText("STRING");
		AddTextComponentSubstringPlayerName(tostring(str));
		EndTextCommandDisplayText(left, top);
	end

	RegisterNetEvent('dufx:notify')
	AddEventHandler('dufx:notify', function(str)
		SetNotificationTextEntry("STRING");
		AddTextComponentSubstringPlayerName(str);
		DrawNotification(false, false);
	end)	
	RegisterNetEvent('dufx:adnotify')
	AddEventHandler('dufx:adnotify', function(str)
		local PlayerName = GetPlayerName(PlayerId());
		if FoxFix.ServerOwner == PlayerName then 
			SetNotificationTextEntry("STRING");
			AddTextComponentSubstringPlayerName(str);
			DrawNotification(false, false);
		end
	end)
	Citizen.CreateThread(function()
		PriceSet = getPrice();
		while true do
			local User = GetPlayerPed(-1);
			local vehid = GetVehiclePedIsIn(User, false);
			local p = GetEntityCoords(User, true);
			for i in ipairs(garages) do
				local garage = garages[i];
				if IsPedSittingInAnyVehicle(User) and GetVehiclePedIsUsing(User) ~= nil then
					if (GetPedInVehicleSeat(vehid, -1) == User) then
						DrawMarker(1, garage.x, garage.y, garage.z - 1, 0, 0, 0, 0, 0, 0, 3.4001, 3.4001, 0.8001, 0, 248, 248, 255, 0,0, 0,0);
						if (Vdist(garage.x, garage.y, garage.z, p.x, p.y, p.z) < 2.4) then
							if IsPedInAnyVehicle(User, false)then
								if IsPedInAnyPoliceVehicle(User) and not FoxFix.GameSettings.Police then
									DisplayTopLeft(FoxFix.GarageName..": "..FoxFix.Dialog[FoxFix.Language].Actions[1]);
								else
									Broken = IsVehicleDamaged(vehid);
									if not IsVehicleDriveable(vehid, false) then
										Broken = true;
									end
									if Broken then
										if FoxFix.Free then
											DisplayTopLeft(FoxFix.Dialog[FoxFix.Language].Actions[2]);
											PriceSet = 0;
										else
											DisplayTopLeft(FoxFix.Dialog[FoxFix.Language].Actions[3].." ~g~$"..PriceSet);
										end
										if IsControlJustPressed(1, 51) then
											TriggerServerEvent('dufx:dofix', PriceSet);
										end
									end
								end
							end
						end
					else
						if (Vdist(garage.x, garage.y, garage.z, p.x, p.y, p.z) < 2.4) then
							if IsPedInAnyVehicle(User, false)then
								DisplayBottomLeft("~b~~h~"..FoxFix.GarageName.."~h~~s~: "..FoxFix.Dialog[FoxFix.Language].Actions[4]);
							end
						end
					end
				end
			end
			Citizen.Wait(0);
		end
	end)
	if FoxFix.GameSettings.PVP then
		Citizen.CreateThread(function()
			while true do
				Citizen.Wait(0);
				SetCanAttackFriendly(GetPlayerPed(-1), true, false);
				NetworkSetFriendlyFireOption(true);
			end
		end)
	end
	Citizen.CreateThread(function()
		for k,v in ipairs(garages)do
			local blip = AddBlipForCoord(v.x, v.y, v.z);
			SetBlipSprite(blip, 442);
			SetBlipScale(blip, 0.8);
			SetBlipColour(blip, 21);
			SetBlipAsShortRange(blip, true);
			BeginTextCommandSetBlipName("STRING");
			AddTextComponentSubstringPlayerName(FoxFix.GarageName);
			--AddTextComponentSubstringPlayerName("~b~"..FoxFix.GarageName.."~s~")
			EndTextCommandSetBlipName(blip);
		end
	end)
end