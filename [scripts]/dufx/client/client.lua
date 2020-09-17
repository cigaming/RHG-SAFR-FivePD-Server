if FoxFix.Enabled then
	local garages = {
		-- Los Santos - Hawick 
		{['x'] = 538.93, ['y'] = -178.38, ['z'] = 53.08},
		-- Los Santos - Pillbox Hill
		{['x'] = -34.10, ['y'] = -1089.14, ['z'] = 25.12},
		-- Los Santos - Rockford Hill LS Customs
		{['x'] = -324.37, ['y'] = -134.69, ['z'] = 38.52},
		-- Los Santos - LS Airport - LS Customs
		{['x'] = -1167.30, ['y'] = -2013.26, ['z'] = 11.91},
		-- Los Santos - Grove Street
		{['x'] = -60.74, ['y'] = -1748.98, ['z'] = 27.85},
		-- Los Santos - Strawberry Gas Station
		{['x'] = 297.82, ['y'] = -1247.81, ['z'] = 27.86},
		-- Los Santos - Mirror Park
		{['x'] = 1140.63, ['y'] = -776.48, ['z'] = 56.20},
		-- Los Santos - La Mesa
		{['x'] = 735.85, ['y'] = -1072.61, ['z'] = 20.87},
		-- Los Santos - West Eclipse Blvd Gas Station
		{['x'] = -2097.22, ['y'] = -294.72, ['z'] = 11.60},
		-- Rt 68 - Zancudo Gas Station
		{['x'] = -2535.95, ['y'] = 2322.36, ['z'] = 31.61},
		-- Sandy Shores Stations
		{['x'] = 2004.52, ['y'] = 3797.35, ['z'] = 31.78},
		{['x'] = 1360.48, ['y'] = 3599.23, ['z'] = 34.47},
		-- Grapeseed Station
		{['x'] = 1702.08, ['y'] = 4938.54, ['z'] = 41.65},
		-- Paleto Bay
		{['x'] = 103.53, ['y'] = 6622.69, ['z'] = 31.27},
		-- Harmony Repair Station
		{['x'] = 1182.75, ['y'] = 2637.61, ['z'] = 37.47},
		-- Vespucci PD - Lower Garage
		{['x'] = -1081.94, ['y'] = -848.69, ['z'] = 4.92},
		-- Vespucci PD - Upper Garage - 1
		{['x'] = -1111.42, ['y'] = -828.5, ['z'] = 13.42},
		-- Vespucci PD - Upper Garage - 2
		{['x'] = -1107.52, ['y'] = -833.31, ['z'] = 13.42},
		-- Morningwood
		{['x'] = -1422.5, ['y'] = -242.66, ['z'] = 46.38},
		-- Morningwood
		{['x'] = -1422.5, ['y'] = -242.66, ['z'] = 46.38},
		-- Little Seoul
		{['x'] = -728.04, ['y'] = -909.24, ['z'] = 19.01}
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