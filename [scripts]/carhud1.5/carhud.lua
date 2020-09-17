-- ################################### --
--									   --
--        C   O   N   F   I   G        --
--									   --
-- ################################### --

-- Cruise Control and Engine Code wrote by TheMrDeivid(https://forum.fivem.net/u/David_Carneiro)
-- RPM and Gears code wrote by Cheleber(https://forum.fivem.net/u/Cheleber) and TheMrDeivid(https://forum.fivem.net/u/David_Carneiro)
-- Race Mode Wrote by TheMrDeivid(https://forum.fivem.net/u/David_Carneiro) and thanks for the 2 lines of code that saved me Ezy(https://forum.fivem.net/u/ezy/)
-- Race Mode 2 Wrote by TheMrDeivid(https://forum.fivem.net/u/David_Carneiro)
-- NOTE: The Cruise Control script it self its not here only the text fuction

-- show/hide compoent
local HUD = {
	
	Speed 			= 'mph', 	-- kmh or mph

	DamageSystem 	= false, 

	SpeedIndicator 	= true,

	ParkIndicator 	= false,

	Top 			= true,  	-- ALL TOP PANAL ( oil, dsc, plate, fluid, ac )

	Plate 			= true, 	-- only if Top is false and you want to keep Plate Number

	Engine			= true,  	-- Engine Status off/on
	
	Cruise			= true,  	-- Enables/Disables The CRUISE Control status (default key F9)
	
	CarRPM			= false,  	-- Enables/Disables The RPM status of the car
	
	CarGears		= true,  	-- Enables/Disables The status of the gears of the car
	
	RaceMode		= false, 	-- Enables/Disable The Race Mode HUD (NEW)
	
	RaceMode2		= false,		-- Enables/Disables the Race Mode HUD 2, only if the Racde Mode is false (NEW) 

}

-- Move the entire UI
local UI = { 

	x =  0.000 ,	-- Base Screen Coords 	+ 	 x
	y = -0.001 ,	-- Base Screen Coords 	+ 	-y

}

-- Move the entire Race Mode
local RM = { 

	x =  0.000 ,	-- Base Screen Coords 	+ 	 x
	y = -0.001 ,	-- Base Screen Coords 	+ 	-y

}

-- Change this if you want
local cruisekey = 56 -- F9
local EngineHpBroken = 110
local EngineHpAlmostBroken = 370

-- Don't touch this
local cruisecolor = false
local carspeed = nil


-- ################################### --
--									   --
--             C   O   D   E           --
--									   --
-- ################################### --



Citizen.CreateThread(function()
	while true do Citizen.Wait(1)


		local MyPed = GetPlayerPed(-1)
		
		if(IsPedInAnyVehicle(MyPed, false))then

			local MyPedVeh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
			local PlateVeh = GetVehicleNumberPlateText(MyPedVeh)
			local VehStopped = IsVehicleStopped(MyPedVeh)
			local VehEngineHP = GetVehicleEngineHealth(MyPedVeh) 
			local VehBodyHP = GetVehicleBodyHealth(MyPedVeh)
			local VehBurnout = IsVehicleInBurnout(MyPedVeh)
	--  #### 		   EDITED IN			  ####  --
			local PedHeli = IsPedInAnyHeli(MyPed)										-- Checks if the PED is in any Heli
			local PedPlane = IsPedInAnyPlane(MyPed)										-- Checks if the PEd is in any Plane
			local PedBoat = IsPedInAnyBoat(MyPed)										-- Checks if the PED is in any Boat
			local PedBike = IsPedOnAnyBike(MyPed)										-- Checks if the PED is in any Bike or Bicycle
			local Gear = GetVehicleCurrentGear(MyPedVeh)								-- Check the current gear of the vehicle
            local RPM = GetVehicleCurrentRpm(MyPedVeh)									-- Check the rpm of the vehicle
			local model = GetVehicleClass(MyPedVeh)										-- Check the vehicle class/model
			local driverseat = IsVehicleSeatFree(MyPedVeh)								-- Driver Seat
			local _,llightson,lhighbeams = GetVehicleLightsState(MyPedVeh, 0)			-- Left Beams
			local _,rlightson,rhighbeams = GetVehicleLightsState(MyPedVeh, 1)			-- Right Beams
			local Passenger1 = GetVehicleNumberOfPassengers(MyPedVeh, 0)				-- Seat Right Front
			local Passenger2 = GetVehicleNumberOfPassengers(MyPedVeh, 1)				-- Seat Left Back
			local Passenger3 = GetVehicleNumberOfPassengers(MyPedVeh, 2)				-- Seat Right Back
			local DoorDamagef1 = IsVehicleDoorDamaged(MyPedVeh, 0)						-- Front Left Door
			local DoorDamagef2 = IsVehicleDoorDamaged(MyPedVeh, 1)						-- Front Right Door
			local DoorDamagef3 = IsVehicleDoorDamaged(MyPedVeh, 2)						-- Back Left Door
			local DoorDamagef4 = IsVehicleDoorDamaged(MyPedVeh, 3)						-- Back Right Door
			local HoodDamagef = IsVehicleDoorDamaged(MyPedVeh, 4)						-- Hood
			local TrunkDamagef = IsVehicleDoorDamaged(MyPedVeh, 5)						-- Trunk
			local WindowDamage1 = IsVehicleWindowIntact(MyPedVeh, 0)					-- Front Left Window
			local WindowDamage2 = IsVehicleWindowIntact(MyPedVeh, 1)					-- Front Right Window
			local WindowDamage3 = IsVehicleWindowIntact(MyPedVeh, 2)					-- Back Left Window
			local WindowDamage4 = IsVehicleWindowIntact(MyPedVeh, 3)					-- Back Right Window
			local WindowDamage5 = IsVehicleWindowIntact(MyPedVeh, 6)					-- Windshield
			local WindowDamage6 = IsVehicleWindowIntact(MyPedVeh, 7)					-- Back Window
			local TyreBurst1 = IsVehicleTyreBurst(MyPedVeh, 0)							-- Front Left Tyre
			local TyreBurst2 = IsVehicleTyreBurst(MyPedVeh, 1)							-- Front Right Tyre
			local TyreBurst3 = IsVehicleTyreBurst(MyPedVeh, 4)							-- Back Left Tyre
			local TyreBurst4 = IsVehicleTyreBurst(MyPedVeh, 5)							-- Back Right Tyre
			local Bumper1 = IsVehicleBumperBrokenOff(MyPedVeh, 0)						-- Back Broken Bumper
			local Bumper2 = IsVehicleBumperBrokenOff(MyPedVeh, 1)						-- Front Broken Bumper
			local Hangingbumper1 = Citizen.InvokeNative(0x27B926779DEB502D,MyPedVeh, 0) -- Back Hanging Bumper
			local Hangingbumper2 = Citizen.InvokeNative(0x27B926779DEB502D,MyPedVeh, 1) -- Front Hanging Bumper
			local LHeadlight = Citizen.InvokeNative(0x5EF77C9ADD3B11A3,MyPedVeh)		-- Left HeadLight
			local RHeadlight = Citizen.InvokeNative(0xA7ECB73355EB2F20,MyPedVeh)		-- Right HeadLight
			local EngineRunning = Citizen.InvokeNative(0xAE31E7DF9B5B132E,MyPedVeh)     -- Check if the engine is running
			local get_collision_veh = Citizen.InvokeNative(0x8BAD02F0368D9E14,MyPedVeh) -- Check if the vehicle hit something

	--  #### SOME STUFF THAT YOU CAN'T CHANGE ####  --	
			if RPM > 0.99 then
				RPM = RPM*100
				RPM = RPM+math.random(-2,2)
				RPM = RPM/100
			end
			if carspeed == nil and cruisecolor == true then
				carspeed = Speed
			end
	--  ####       DON'T TOUCH THIS	          ####  --
			if HUD.RaceMode and HUD.RaceMode2 == false and PedHeli == false and PedPlane == false and PedBoat == false and PedBike == false then
				drawRct(RM.x + 0.24, 	RM.y + 0.805, 0.003,0.025, 0, 0, 0, 150)  -- Front Right Brake Disc
				drawRct(RM.x + 0.201, 	RM.y + 0.805, 0.003,0.025, 0, 0, 0, 150)  -- Front Left Brake Disc
				drawRct(RM.x + 0.24, 	RM.y + 0.908, 0.003,0.025, 0, 0, 0, 150)  -- Back Right Brake Disc
				drawRct(RM.x + 0.201, 	RM.y + 0.908, 0.003,0.025, 0, 0, 0, 150)  -- Back Left Brake Disc
				drawRct(RM.x + 0.204, 	RM.y + 0.815, 0.036,0.005, 0, 0, 0, 150)  -- Front Direction Shaft				
				drawRct(RM.x + 0.204, 	RM.y + 0.918, 0.036,0.005, 0, 0, 0, 150)  -- Back Direction Shaft
				drawRct(RM.x + 0.199, 	RM.y + 0.843, 0.011,0.020, 0, 0, 0, 150)  -- Driver Seat
				drawRct(RM.x + 0.237, 	RM.y + 0.843, 0.011,0.020, 0, 0, 0, 150)  -- Seat Right Front
				drawRct(RM.x + 0.199, 	RM.y + 0.875, 0.011,0.020, 0, 0, 0, 150)  -- Seat Left Back
				drawRct(RM.x + 0.237, 	RM.y + 0.875, 0.011,0.020, 0, 0, 0, 150)  -- Seat Right Back
	--  ####       ENGINE BLOCK DAMAGE	  	  ####  --
				if (VehEngineHP > 0) and (VehEngineHP < EngineHpBroken) then
					drawRct(RM.x + 0.225, 	RM.y + 0.777, 0.017,0.024, 255, 0, 0, 100)
					drawRct(RM.x + 0.205, 	RM.y + 0.776, 0.009,0.024, 255, 0, 0, 100)
					drawRct(RM.x + 0.199, 	RM.y + 0.780, 0.0068,0.015, 255, 0, 0, 100)
					drawRct(RM.x + 0.214, 	RM.y + 0.778, 0.011,0.003, 255, 0, 0, 100) 
					drawRct(RM.x + 0.214, 	RM.y + 0.782, 0.011,0.003, 255, 0, 0, 100)
					drawRct(RM.x + 0.214, 	RM.y + 0.786, 0.011,0.003, 255, 0, 0, 100)
					drawRct(RM.x + 0.214, 	RM.y + 0.790, 0.011,0.003, 255, 0, 0, 100)
					drawRct(RM.x + 0.214, 	RM.y + 0.794, 0.011,0.003, 255, 0, 0, 100)
					drawRct(RM.x + 0.218, 	RM.y + 0.769, 0.015,0.008, 255, 0, 0, 100)
					drawRct(RM.x + 0.23, 	RM.y + 0.801, 0.007,0.007, 255, 0, 0, 100)
					drawRct(RM.x + 0.21, 	RM.y + 0.802, 0.020,0.003, 255, 0, 0, 100)
					drawRct(RM.x + 0.21, 	RM.y + 0.800, 0.003,0.002, 255, 0, 0, 100)
				elseif (VehEngineHP > 111) and (VehEngineHP < EngineHpAlmostBroken) then
					drawRct(RM.x + 0.225, 	RM.y + 0.777, 0.017,0.024, 255, 255, 0, 100)
					drawRct(RM.x + 0.205, 	RM.y + 0.776, 0.009,0.024, 255, 255, 0, 100)
					drawRct(RM.x + 0.199, 	RM.y + 0.780, 0.0068,0.015, 255, 255, 0, 100)
					drawRct(RM.x + 0.214, 	RM.y + 0.778, 0.011,0.003, 255, 255, 0, 100)
					drawRct(RM.x + 0.214, 	RM.y + 0.782, 0.011,0.003, 255, 255, 0, 100)
					drawRct(RM.x + 0.214, 	RM.y + 0.786, 0.011,0.003, 255, 255, 0, 100)
					drawRct(RM.x + 0.214, 	RM.y + 0.790, 0.011,0.003, 255, 255, 0, 100)
					drawRct(RM.x + 0.214, 	RM.y + 0.794, 0.011,0.003, 255, 255, 0, 100)
					drawRct(RM.x + 0.218, 	RM.y + 0.769, 0.015,0.008, 255, 255, 0, 100)
					drawRct(RM.x + 0.23, 	RM.y + 0.801, 0.007,0.007, 255, 255, 0, 100)
					drawRct(RM.x + 0.21, 	RM.y + 0.802, 0.020,0.003, 255, 255, 0, 100)
					drawRct(RM.x + 0.21, 	RM.y + 0.800, 0.003,0.002, 255, 255, 0, 100)
				else
					drawRct(RM.x + 0.225, 	RM.y + 0.777, 0.017,0.024, 0, 0, 0, 150)
					drawRct(RM.x + 0.205, 	RM.y + 0.776, 0.009,0.024, 0, 0, 0, 150)
					drawRct(RM.x + 0.199, 	RM.y + 0.780, 0.0068,0.015, 0, 0, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.778, 0.011,0.003, 0, 0, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.782, 0.011,0.003, 0, 0, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.786, 0.011,0.003, 0, 0, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.790, 0.011,0.003, 0, 0, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.794, 0.011,0.003, 0, 0, 0, 150)
					drawRct(RM.x + 0.218, 	RM.y + 0.769, 0.015,0.008, 0, 0, 0, 150)
					drawRct(RM.x + 0.23, 	RM.y + 0.801, 0.007,0.007, 0, 0, 0, 150)
					drawRct(RM.x + 0.21, 	RM.y + 0.802, 0.020,0.003, 0, 0, 0, 150)
					drawRct(RM.x + 0.21, 	RM.y + 0.800, 0.003,0.002, 0, 0, 0, 150)
				end
	--  ####       TRANSMISSION DAMAGE	  	  ####  --
				if (VehEngineHP > 0) and (VehEngineHP < EngineHpBroken) then
					drawRct(RM.x + 0.2165, 	RM.y + 0.807, 0.011,0.020, 255, 0, 0, 100)
					drawRct(RM.x + 0.214, 	RM.y + 0.912, 0.016,0.020, 255, 0, 0, 100)
					drawRct(RM.x + 0.22, 	RM.y + 0.827, 0.004,0.040, 255, 0, 0, 100)
					drawRct(RM.x + 0.219, 	RM.y + 0.867, 0.006,0.025, 255, 0, 0, 100)
					drawRct(RM.x + 0.2175, 	RM.y + 0.892, 0.009,0.0215, 255, 0, 0, 100)
				elseif (VehEngineHP > 111) and (VehEngineHP < 560) then
					drawRct(RM.x + 0.2165, 	RM.y + 0.807, 0.011,0.020, 255, 255, 0, 100)
					drawRct(RM.x + 0.214, 	RM.y + 0.912, 0.016,0.020, 255, 255, 0, 100)
					drawRct(RM.x + 0.22, 	RM.y + 0.827, 0.004,0.040, 255, 255, 0, 100)
					drawRct(RM.x + 0.219, 	RM.y + 0.867, 0.006,0.025, 255, 255, 0, 100)
					drawRct(RM.x + 0.2175, 	RM.y + 0.892, 0.009,0.0215, 255, 255, 0, 100)
				else
					drawRct(RM.x + 0.2165, 	RM.y + 0.807, 0.011,0.020, 0, 0, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.912, 0.016,0.020, 0, 0, 0, 150)
					drawRct(RM.x + 0.22, 	RM.y + 0.827, 0.004,0.040, 0, 0, 0, 150)
					drawRct(RM.x + 0.219, 	RM.y + 0.867, 0.006,0.025, 0, 0, 0, 150)
					drawRct(RM.x + 0.2175, 	RM.y + 0.892, 0.009,0.0215, 0, 0, 0, 150)
				end
	--  ####          FRONT DAMAGE	  		  ####  --
				if Bumper2 then
					drawRct(RM.x + 0.20, 	RM.y + 0.755, 0.045,0.01, 255, 0, 0, 100)
					drawRct(RM.x + 0.254, 	RM.y + 0.777, 0.006,0.020, 255, 0, 0, 100)
					drawRct(RM.x + 0.185, 	RM.y + 0.777, 0.006,0.020, 255, 0, 0, 100)
				elseif Hangingbumper2 then
					drawRct(RM.x + 0.20, 	RM.y + 0.755, 0.045,0.01, 255, 255, 0, 100)
					drawRct(RM.x + 0.254, 	RM.y + 0.777, 0.006,0.020, 255, 255, 0, 100)
					drawRct(RM.x + 0.185, 	RM.y + 0.777, 0.006,0.020, 255, 255, 0, 100)
				else
					drawRct(RM.x + 0.20, 	RM.y + 0.755, 0.045,0.01, 0, 0, 0, 150)
					drawRct(RM.x + 0.254, 	RM.y + 0.777, 0.006,0.020, 0, 0, 0, 150)
					drawRct(RM.x + 0.185, 	RM.y + 0.777, 0.006,0.020, 0, 0, 0, 150)
				end
				if TyreBurst1 then
					drawRct(RM.x + 0.185, 	RM.y + 0.798, 0.015,0.040, 255, 0, 0, 100)
				else
					drawRct(RM.x + 0.185, 	RM.y + 0.798, 0.015,0.040, 0, 0, 0, 150)
				end
				if TyreBurst2 then
					drawRct(RM.x + 0.245, 	RM.y + 0.798, 0.015,0.040, 255, 0, 0, 100)
				else
					drawRct(RM.x + 0.245, 	RM.y + 0.798, 0.015,0.040, 0, 0, 0, 150)
				end

				if lhighbeams == 1 and not LHeadlight then
					drawRct(RM.x + 0.185, 	RM.y + 0.766, 0.020,0.01, 0, 153, 255, 100)
					drawRct(RM.x + 0.185, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
				elseif llightson == 1 and lhighbeams == 0 and not LHeadlight then
					drawRct(RM.x + 0.185, 	RM.y + 0.766, 0.020,0.01, 102, 255, 51, 100)
					drawRct(RM.x + 0.185, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
				elseif LHeadlight then
					drawRct(RM.x + 0.185, 	RM.y + 0.766, 0.020,0.01, 255, 0, 0, 100)
					if lhighbeams == 1 then
						drawRct(RM.x + 0.185, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
					elseif llightson == 1 and lhighbeams == 0 then
						drawRct(RM.x + 0.185, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
					else 
						drawRct(RM.x + 0.185, RM.y + 0.962, 0.01,0.01, 0, 0, 0, 150)
					end
				else
					drawRct(RM.x + 0.185, 	RM.y + 0.766, 0.020,0.01, 0, 0, 0, 150)
					drawRct(RM.x + 0.185, RM.y + 0.962, 0.01,0.01, 0, 0, 0, 150)
				end
				if rhighbeams == 1 and not RHeadlight then
					drawRct(RM.x + 0.24, 	RM.y + 0.766, 0.020,0.01, 0, 153, 255, 100)
					drawRct(RM.x + 0.25, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
				elseif rlightson == 1 and rhighbeams == 0 and not RHeadlight then
					drawRct(RM.x + 0.24, 	RM.y + 0.766, 0.020,0.01, 102, 255, 51, 100)
					drawRct(RM.x + 0.25, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
				elseif RHeadlight then
					drawRct(RM.x + 0.24, 	RM.y + 0.766, 0.020,0.01, 255, 0, 0, 100)
					if rhighbeams == 1 then
						drawRct(RM.x + 0.25, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
					elseif rlightson == 1 and rhighbeams == 0 then
						drawRct(RM.x + 0.25, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
					else 
						drawRct(RM.x + 0.25, RM.y + 0.962, 0.01,0.01, 0, 0, 0, 150)
					end
				else
					drawRct(RM.x + 0.24, 	RM.y + 0.766, 0.020,0.01, 0, 0, 0, 150)
					drawRct(RM.x + 0.25, RM.y + 0.962, 0.01,0.01, 0, 0, 0, 150)
				end
	--  ####          MIDDLE DAMAGE	  		  ####  --
				if DoorDamagef1 then
					drawRct(RM.x + 0.185,   RM.y + 0.839, 0.006,0.030, 255, 0, 0, 100)
				elseif WindowDamage1 then
					drawRct(RM.x + 0.185,   RM.y + 0.839, 0.006,0.030, 0, 0, 0, 150)
				else
					drawRct(RM.x + 0.185,   RM.y + 0.839, 0.006,0.030, 255, 255, 0, 100)
                end
                if DoorDamagef2 then
                    drawRct(RM.x + 0.254,   RM.y + 0.839, 0.006,0.030, 255, 0, 0, 100)
				elseif WindowDamage2 then
					drawRct(RM.x + 0.254, 	RM.y + 0.839, 0.006,0.030, 0, 0, 0, 150)
				else
					drawRct(RM.x + 0.254, 	RM.y + 0.839, 0.006,0.030, 255, 255, 0, 100)
                end
				if DoorDamagef3 then
					drawRct(RM.x + 0.185, 	RM.y + 0.869, 0.006,0.030, 255, 0, 0, 100)
				elseif WindowDamage3 then
					drawRct(RM.x + 0.185, 	RM.y + 0.869, 0.006,0.030, 0, 0, 0, 150)
				else
					drawRct(RM.x + 0.185, 	RM.y + 0.869, 0.006,0.030, 255, 255, 0, 100)
				end
				if DoorDamagef4 then
					drawRct(RM.x + 0.254, 	RM.y + 0.869, 0.006,0.030, 255, 0, 0, 100)
				elseif WindowDamage4 then
					drawRct(RM.x + 0.254, 	RM.y + 0.869, 0.006,0.030, 0, 0, 0, 150)
				else
					drawRct(RM.x + 0.254, 	RM.y + 0.869, 0.006,0.030, 255, 255, 0, 100)
				end
				if driverseat then
					drawRct(RM.x + 0.199, 	RM.y + 0.843, 0.011,0.020, 0, 255, 0, 050)
				elseif Passenger1 then
					drawRct(RM.x + 0.237, 	RM.y + 0.843, 0.011,0.020, 0, 255, 0, 050)
				elseif Passenger2 then
					drawRct(RM.x + 0.199, 	RM.y + 0.875, 0.011,0.020, 0, 255, 0, 050)
				elseif Passenger3 then
					drawRct(RM.x + 0.237, 	RM.y + 0.875, 0.011,0.020, 0, 255, 0, 050)
				end
	--  ####          BACK DAMAGE	  		  ####  --
				if Bumper1 then
					drawRct(RM.x + 0.196, 	RM.y + 0.962, 0.053,0.01, 255, 0, 0, 100)
					drawRct(RM.x + 0.185, 	RM.y + 0.941, 0.006,0.020, 255, 0, 0, 100)
					drawRct(RM.x + 0.254, 	RM.y + 0.941, 0.006,0.020, 255, 0, 0, 100)
				elseif Hangingbumper1 then
					drawRct(RM.x + 0.196, 	RM.y + 0.962, 0.053,0.01, 255, 255, 0, 100) 
					drawRct(RM.x + 0.185, 	RM.y + 0.941, 0.006,0.020, 255, 255, 0, 100)
					drawRct(RM.x + 0.254, 	RM.y + 0.941, 0.006,0.020, 255, 255, 0, 100)
				else
					drawRct(RM.x + 0.196, 	RM.y + 0.962, 0.053,0.01, 0, 0, 0, 150)
					drawRct(RM.x + 0.185, 	RM.y + 0.941, 0.006,0.020, 0, 0, 0, 150)
					drawRct(RM.x + 0.254, 	RM.y + 0.941, 0.006,0.020, 0, 0, 0, 150)
				end	
				if TyreBurst3 then
					drawRct(RM.x + 0.185, 	RM.y + 0.900, 0.015,0.040, 255, 0, 0, 100)
				else
					drawRct(RM.x + 0.185, 	RM.y + 0.900, 0.015,0.040, 0, 0, 0, 150)
				end
				if TyreBurst4 then
					drawRct(RM.x + 0.245, 	RM.y + 0.900, 0.015,0.040, 255, 0, 0, 100)
				else
					drawRct(RM.x + 0.245, 	RM.y + 0.900, 0.015,0.040, 0, 0, 0, 150)
				end			
			end
	--  ####         END OF RACE MODE	  	  ####  --
	--  ####       DON'T TOUCH THIS	          ####  --
			if HUD.RaceMode2 and HUD.RaceMode == false and PedHeli == false and PedPlane == false and PedBoat == false and PedBike == false then
				drawRct(RM.x + 0.20, 	RM.y + 0.830, 0.045,0.080, 0, 0, 0, 150) 	-- Roof
				drawRct(RM.x + 0.192, 	RM.y + 0.865, 0.008,0.01, 0, 0, 0, 150) 	-- Roof
				drawRct(RM.x + 0.245, 	RM.y + 0.865, 0.008,0.01, 0, 0, 0, 150)		-- Roof
				drawRct(RM.x + 0.196, 	RM.y + 0.823, 0.005,0.008, 0, 0, 0, 150)	-- Roof
				drawRct(RM.x + 0.192, 	RM.y + 0.819, 0.005,0.0046, 0, 0, 0, 150)	-- Roof
				drawRct(RM.x + 0.244, 	RM.y + 0.823, 0.005,0.008, 0, 0, 0, 150)	-- Roof
				drawRct(RM.x + 0.248, 	RM.y + 0.819, 0.005,0.0046, 0, 0, 0, 150)	-- Roof
				drawRct(RM.x + 0.196, 	RM.y + 0.909, 0.005,0.010, 0, 0, 0, 150)	-- Roof
				drawRct(RM.x + 0.192, 	RM.y + 0.919, 0.005,0.010, 0, 0, 0, 150)	-- Roof
				drawRct(RM.x + 0.244, 	RM.y + 0.909, 0.005,0.010, 0, 0, 0, 150)	-- Roof
				drawRct(RM.x + 0.248, 	RM.y + 0.919, 0.005,0.010, 0, 0, 0, 150)	-- Roof
	--  ####       ENGINE BLOCK DAMAGE	  	  ####  --
				if (VehEngineHP > 0) and (VehEngineHP < EngineHpBroken) then
					drawRct(RM.x + 0.225, 	RM.y + 0.777, 0.017,0.024, 255, 0, 0, 150)
					drawRct(RM.x + 0.205, 	RM.y + 0.776, 0.009,0.024, 255, 0, 0, 150)
					drawRct(RM.x + 0.199, 	RM.y + 0.780, 0.0068,0.015, 255, 0, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.778, 0.011,0.003, 255, 0, 0, 150) 
					drawRct(RM.x + 0.214, 	RM.y + 0.782, 0.011,0.003, 255, 0, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.786, 0.011,0.003, 255, 0, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.790, 0.011,0.003, 255, 0, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.794, 0.011,0.003, 255, 0, 0, 150)
					drawRct(RM.x + 0.218, 	RM.y + 0.769, 0.015,0.008, 255, 0, 0, 150)
					drawRct(RM.x + 0.23, 	RM.y + 0.801, 0.007,0.007, 255, 0, 0, 150)
					drawRct(RM.x + 0.21, 	RM.y + 0.802, 0.020,0.003, 255, 0, 0, 150)
					drawRct(RM.x + 0.21, 	RM.y + 0.800, 0.003,0.002, 255, 0, 0, 150)
				elseif (VehEngineHP > 111) and (VehEngineHP < EngineHpAlmostBroken) then
					drawRct(RM.x + 0.225, 	RM.y + 0.777, 0.017,0.024, 255, 255, 0, 150)
					drawRct(RM.x + 0.205, 	RM.y + 0.776, 0.009,0.024, 255, 255, 0, 150)
					drawRct(RM.x + 0.199, 	RM.y + 0.780, 0.0068,0.015, 255, 255, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.778, 0.011,0.003, 255, 255, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.782, 0.011,0.003, 255, 255, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.786, 0.011,0.003, 255, 255, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.790, 0.011,0.003, 255, 255, 0, 150)
					drawRct(RM.x + 0.214, 	RM.y + 0.794, 0.011,0.003, 255, 255, 0, 150)
					drawRct(RM.x + 0.218, 	RM.y + 0.769, 0.015,0.008, 255, 255, 0, 150)
					drawRct(RM.x + 0.23, 	RM.y + 0.801, 0.007,0.007, 255, 255, 0, 150)
					drawRct(RM.x + 0.21, 	RM.y + 0.802, 0.020,0.003, 255, 255, 0, 150)
					drawRct(RM.x + 0.21, 	RM.y + 0.800, 0.003,0.002, 255, 255, 0, 150)
				end
	--  ####          FRONT DAMAGE	  		  ####  --	
				if Bumper2 then
					drawRct(RM.x + 0.20, 	RM.y + 0.755, 0.045,0.01, 255, 0, 0, 100)
					drawRct(RM.x + 0.254, 	RM.y + 0.777, 0.006,0.040, 255, 0, 0, 100)
					drawRct(RM.x + 0.185, 	RM.y + 0.777, 0.006,0.040, 255, 0, 0, 100)
				elseif Hangingbumper2 then
					drawRct(RM.x + 0.20, 	RM.y + 0.755, 0.045,0.01, 255, 255, 0, 100)
					drawRct(RM.x + 0.254, 	RM.y + 0.777, 0.006,0.040, 255, 255, 0, 100)
					drawRct(RM.x + 0.185, 	RM.y + 0.777, 0.006,0.040, 255, 255, 0, 100)
				else
					drawRct(RM.x + 0.20, 	RM.y + 0.755, 0.045,0.01, 0, 0, 0, 150)
					drawRct(RM.x + 0.254, 	RM.y + 0.777, 0.006,0.040, 0, 0, 0, 150)
					drawRct(RM.x + 0.185, 	RM.y + 0.777, 0.006,0.040, 0, 0, 0, 150)
				end
				if HoodDamagef then
					drawRct(RM.x + 0.206, 	RM.y + 0.766, 0.033,0.011, 255, 0, 0, 100)
					drawRct(RM.x + 0.192, 	RM.y + 0.777, 0.061,0.036, 255, 0, 0, 100)
					drawRct(RM.x + 0.192, 	RM.y + 0.813, 0.020,0.006, 255, 0, 0, 100)
					drawRct(RM.x + 0.233, 	RM.y + 0.813, 0.020,0.006, 255, 0, 0, 100)
				else
					drawRct(RM.x + 0.206, 	RM.y + 0.766, 0.033,0.011, 0, 0, 0, 150)
					drawRct(RM.x + 0.192, 	RM.y + 0.777, 0.061,0.036, 0, 0, 0, 150)
					drawRct(RM.x + 0.192, 	RM.y + 0.813, 0.020,0.006, 0, 0, 0, 150)
					drawRct(RM.x + 0.233, 	RM.y + 0.813, 0.020,0.006, 0, 0, 0, 150)
                end
				if lhighbeams == 1 and not LHeadlight then
					drawRct(RM.x + 0.185, 	RM.y + 0.766, 0.020,0.01, 0, 153, 255, 100)
					drawRct(RM.x + 0.185, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
				elseif llightson == 1 and lhighbeams == 0 and not LHeadlight then
					drawRct(RM.x + 0.185, 	RM.y + 0.766, 0.020,0.01, 102, 255, 51, 100)
					drawRct(RM.x + 0.185, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
				elseif LHeadlight then
					drawRct(RM.x + 0.185, 	RM.y + 0.766, 0.020,0.01, 255, 0, 0, 100)
					if lhighbeams == 1 then
						drawRct(RM.x + 0.185, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
					elseif llightson == 1 and lhighbeams == 0 then
						drawRct(RM.x + 0.185, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
					else 
						drawRct(RM.x + 0.185, RM.y + 0.962, 0.01,0.01, 0, 0, 0, 150)
					end
				else
					drawRct(RM.x + 0.185, 	RM.y + 0.766, 0.020,0.01, 0, 0, 0, 150)
					drawRct(RM.x + 0.185, RM.y + 0.962, 0.01,0.01, 0, 0, 0, 150)
				end
				if rhighbeams == 1 and not RHeadlight then
					drawRct(RM.x + 0.24, 	RM.y + 0.766, 0.020,0.01, 0, 153, 255, 100)
					drawRct(RM.x + 0.25, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
				elseif rlightson == 1 and rhighbeams == 0 and not RHeadlight then
					drawRct(RM.x + 0.24, 	RM.y + 0.766, 0.020,0.01, 102, 255, 51, 100)
					drawRct(RM.x + 0.25, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
				elseif RHeadlight then
					drawRct(RM.x + 0.24, 	RM.y + 0.766, 0.020,0.01, 255, 0, 0, 100)
					if rhighbeams == 1 then
						drawRct(RM.x + 0.25, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
					elseif rlightson == 1 and rhighbeams == 0 then
						drawRct(RM.x + 0.25, 	RM.y + 0.962, 0.01,0.01, 242, 94, 13, 150)
					else 
						drawRct(RM.x + 0.25, RM.y + 0.962, 0.01,0.01, 0, 0, 0, 150)
					end
				else
					drawRct(RM.x + 0.24, 	RM.y + 0.766, 0.020,0.01, 0, 0, 0, 150)
					drawRct(RM.x + 0.25, RM.y + 0.962, 0.01,0.01, 0, 0, 0, 150)
				end
	--  ####          MIDDLE DAMAGE	  		  ####  --
				if WindowDamage1 then
					drawRct(RM.x + 0.192, 	RM.y + 0.823, 0.0045,0.042, 179, 230, 255, 150)
					drawRct(RM.x + 0.1965, 	RM.y + 0.830, 0.0037,0.035, 179, 230, 255, 150)
				else
					drawRct(RM.x + 0.192, 	RM.y + 0.823, 0.0045,0.042, 255, 255, 0, 100)
					drawRct(RM.x + 0.1965, 	RM.y + 0.830, 0.0037,0.035, 255, 255, 0, 100)
				end
				if WindowDamage2 then
					drawRct(RM.x + 0.2485, 	RM.y + 0.823, 0.0045,0.042, 179, 230, 255, 150)
					drawRct(RM.x + 0.2445, 	RM.y + 0.830, 0.0039,0.035, 179, 230, 255, 150)
				else
					drawRct(RM.x + 0.2485, 	RM.y + 0.823, 0.0045,0.042, 255, 255, 0, 100)
					drawRct(RM.x + 0.2445, 	RM.y + 0.830, 0.0039,0.035, 255, 255, 0, 100)
				end
				if WindowDamage3 then
					drawRct(RM.x + 0.192, 	RM.y + 0.875, 0.0045,0.044, 179, 230, 255, 150)
					drawRct(RM.x + 0.1965, 	RM.y + 0.875, 0.0037,0.035, 179, 230, 255, 150)
				else
					drawRct(RM.x + 0.192, 	RM.y + 0.875, 0.0045,0.044, 255, 255, 0, 100)
					drawRct(RM.x + 0.1965, 	RM.y + 0.875, 0.0037,0.035, 255, 255, 0, 100)
				end
				if WindowDamage4 then
					drawRct(RM.x + 0.2485, 	RM.y + 0.875, 0.0045,0.044, 179, 230, 255, 150)
					drawRct(RM.x + 0.2445, 	RM.y + 0.875, 0.0039,0.035, 179, 230, 255, 150)
				else
					drawRct(RM.x + 0.2485, 	RM.y + 0.875, 0.0045,0.044, 255, 255, 0, 100)
					drawRct(RM.x + 0.2445, 	RM.y + 0.875, 0.0039,0.035, 255, 255, 0, 100)
				end
				if WindowDamage5 then
					drawRct(RM.x + 0.2120, 	RM.y + 0.813, 0.021,0.006, 179, 230, 255, 150)
					drawRct(RM.x + 0.197, 	RM.y + 0.8185, 0.051,0.0046, 179, 230, 255, 150)
					drawRct(RM.x + 0.201, 	RM.y + 0.823, 0.0425,0.0065, 179, 230, 255, 150)
				else
					drawRct(RM.x + 0.2120, 	RM.y + 0.813, 0.021,0.006, 255, 255, 0, 100)
					drawRct(RM.x + 0.197, 	RM.y + 0.8185, 0.051,0.0046, 255, 255, 0, 100)
					drawRct(RM.x + 0.201, 	RM.y + 0.823, 0.0425,0.0065, 255, 255, 0, 100)
				end
				if WindowDamage6 then
					drawRct(RM.x + 0.197, 	RM.y + 0.919, 0.051,0.010, 179, 230, 255, 150)
					drawRct(RM.x + 0.201, 	RM.y + 0.909, 0.043,0.010, 179, 230, 255, 150)
				else
					drawRct(RM.x + 0.197, 	RM.y + 0.919, 0.051,0.010, 255, 255, 0, 100)
					drawRct(RM.x + 0.201, 	RM.y + 0.909, 0.043,0.010, 255, 255, 0, 100)
				end
				if DoorDamagef1 then
					drawRct(RM.x + 0.185,   RM.y + 0.819, 0.006,0.050, 255, 0, 0, 100)
				else
					drawRct(RM.x + 0.185,   RM.y + 0.819, 0.006,0.050, 0, 0, 0, 150)
				end
				if DoorDamagef2 then
					drawRct(RM.x + 0.254, 	RM.y + 0.819, 0.006,0.050, 255, 0, 0, 100)
				else
					drawRct(RM.x + 0.254, 	RM.y + 0.819, 0.006,0.050, 0, 0, 0, 150)
				end
				if DoorDamagef3 then
					drawRct(RM.x + 0.185, 	RM.y + 0.870, 0.006,0.050, 255, 0, 0, 100)
				else
					drawRct(RM.x + 0.185, 	RM.y + 0.870, 0.006,0.050, 0, 0, 0, 150)
				end
				if DoorDamagef4 then
					drawRct(RM.x + 0.254, 	RM.y + 0.870, 0.006,0.050, 255, 0, 0, 100)
				else
					drawRct(RM.x + 0.254, 	RM.y + 0.870, 0.006,0.050, 0, 0, 0, 150)
				end
	--  ####          BACK DAMAGE	  		  ####  --
				if TrunkDamagef then
					drawRct(RM.x + 0.192, 	RM.y + 0.929, 0.061,0.031, 255, 0, 0, 100)
				else
					drawRct(RM.x + 0.192, 	RM.y + 0.929, 0.061,0.031, 0, 0, 0, 150)
				end
				if Bumper1 then
					drawRct(RM.x + 0.196, 	RM.y + 0.962, 0.053,0.01, 255, 0, 0, 100)
					drawRct(RM.x + 0.185, 	RM.y + 0.921, 0.006,0.040, 255, 0, 0, 100)
					drawRct(RM.x + 0.254, 	RM.y + 0.921, 0.006,0.040, 255, 0, 0, 100)
				elseif Hangingbumper1 then
					drawRct(RM.x + 0.196, 	RM.y + 0.962, 0.053,0.01, 255, 255, 0, 100) 
					drawRct(RM.x + 0.185, 	RM.y + 0.921, 0.006,0.040, 255, 255, 0, 100)
					drawRct(RM.x + 0.254, 	RM.y + 0.921, 0.006,0.040, 255, 255, 0, 100)
				else
					drawRct(RM.x + 0.196, 	RM.y + 0.962, 0.053,0.01, 0, 0, 0, 150)
					drawRct(RM.x + 0.185, 	RM.y + 0.921, 0.006,0.040, 0, 0, 0, 150)
					drawRct(RM.x + 0.254, 	RM.y + 0.921, 0.006,0.040, 0, 0, 0, 150)
				end
			end
	--  ####        END OF RACE MODE2	  	  ####  --
			if HUD.CarRPM and (model ~= 13) then
					drawRct(UI.x + 0.11, 	UI.y + 0.903, 0.046,0.03,0,0,0,150)
					drawTxt(UI.x + 0.61, 	UI.y + 1.39, 1.0,1.0,0.64 , "~w~" ..  math.ceil(round(RPM, 2)*10000), 255, 255, 255, 255)
					drawTxt(UI.x + 0.636, 	UI.y + 1.402, 1.0,1.0,0.4, "~w~ RPM", 255, 255, 255, 255)
			end
			
			if HUD.CarGears then
				if VehStopped and (Speed == 0) then
					drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0,1.0,0.45, "P", 255, 0, 0, 200)
				elseif Gear < 1 then
					drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0,1.0,0.45, "R", 255, 255, 255, 200)						
				elseif Gear == 1 then
					drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0,1.0,0.45, "1", 255, 255, 255, 200)
				elseif Gear == 2 then
					drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0,1.0,0.45, "2", 255, 255, 255, 200)
				elseif Gear == 3 then
					drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0,1.0,0.45, "3", 255, 255, 255, 200)
				elseif Gear == 4 then
					drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0,1.0,0.45, "4", 255, 255, 255, 200)
				elseif Gear == 5 then
					drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0,1.0,0.45, "5", 255, 255, 255, 200)
				elseif Gear == 6 then
					drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0,1.0,0.45, "6", 255, 255, 255, 200)
				elseif Gear == 7 then
					drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0,1.0,0.45, "7", 255, 255, 255, 200)
				elseif Gear == 8 then
					drawTxt(UI.x + 0.648, UI.y + 1.245, 1.0,1.0,0.45, "8", 255, 255, 255, 200)
				end	
			end
			
			if HUD.Speed == 'kmh' then
				Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
			elseif HUD.Speed == 'mph' then
				Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936
			else
				Speed = 0.0
			end
			 
			if HUD.Cruise then
				if cruisecolor == false then
					drawTxt(UI.x + 0.514, UI.y + 1.245, 1.0,1.0,0.45, "CRUISE", 255, 0, 0,200) -- Red 
				else
					drawTxt(UI.x + 0.514, UI.y + 1.245, 1.0,1.0,0.45, "CRUISE", 0, 255, 0,200) -- Green
				end
				if IsControlJustPressed(0, cruisekey) and (Speed > 11) then -- F9
					cruisecolor = true
				elseif IsControlJustPressed( 0, 8) then -- S
					cruisecolor = false
				--elseif IsControlJustPressed( 0, 22) then -- SpaceBar
					--cruisecolor = false
				elseif (Speed > 0.0) and (Speed < 10) then -- Speed between 0 and 10 stays red
					cruisecolor = false
				elseif (VehEngineHP < 90) and (VehEngineHP > 101) then -- If the car is broken stays red
					cruisecolor = false
				elseif get_collision_veh then
					cruisecolor = false
				elseif carspeed ~= nil and (Speed < carspeed) then -- If you lose speed turns red, sometimes takes a little bit to detect
					cruisecolor = false
				end
			end
			
			if HUD.Top then
				drawTxt(UI.x + 0.563, 	UI.y + 1.2624, 1.0,1.0,0.55, "~w~" .. PlateVeh, 255, 255, 255, 255)
				drawTxt(UI.x + 0.619, UI.y + 1.245, 1.0,1.0,0.45, "ENG", 0, 255, 0,200)
  
				if VehBurnout then
					drawTxt(UI.x + 0.535, UI.y + 1.266, 1.0,1.0,0.44, "DSC", 255, 0, 0, 200)
				else
					drawTxt(UI.x + 0.535, UI.y + 1.266, 1.0,1.0,0.44, "DSC", 255, 255, 255, 150)
				end	

				if (VehEngineHP > 0) and (VehEngineHP < EngineHpBroken) then
					drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0,1.0,0.45, "Fluid", 255, 0, 0, 200) -- red
					drawTxt(UI.x + 0.514, UI.y + 1.266, 1.0,1.0,0.45, "Oil", 255, 0, 0, 200)
					drawTxt(UI.x + 0.645, UI.y + 1.266, 1.0,1.0,0.45, "AC", 255, 0, 0, 200)
					drawTxt(UI.x + 0.619, UI.y + 1.245, 1.0,1.0,0.45, "ENG", 255, 0, 0, 200)
				elseif (VehEngineHP > 111) and (VehEngineHP < EngineHpAlmostBroken) then 
					drawTxt(UI.x + 0.645, UI.y + 1.266, 1.0,1.0,0.45, "AC", 255, 255, 0,200) -- yellow
					drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0,1.0,0.45, "Fluid", 255, 255, 0,200)
					drawTxt(UI.x + 0.514, UI.y + 1.266, 1.0,1.0,0.45, "Oil", 255, 255, 0,200)
					drawTxt(UI.x + 0.645, UI.y + 1.266, 1.0,1.0,0.45, "AC", 255, 255, 0,200)
					drawTxt(UI.x + 0.619, UI.y + 1.245, 1.0,1.0,0.45, "ENG", 255, 255, 0,200)
				else
					drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0,1.0,0.45, "Fluid", 255, 255, 255, 200)
					drawTxt(UI.x + 0.514, UI.y + 1.266, 1.0,1.0,0.45, "Oil", 255, 255, 255, 200)
					drawTxt(UI.x + 0.645, UI.y + 1.266, 1.0,1.0,0.45, "AC", 255, 255, 255, 200)
					drawTxt(UI.x + 0.619, UI.y + 1.245, 1.0,1.0,0.45, "ENG", 0, 255, 0,200)
				end
				if HUD.ParkIndicator then
					if VehStopped then
						drawTxt(UI.x + 0.6605, UI.y + 1.262, 1.0,1.0,0.6, "~r~P", 255, 255, 255, 200)
					else
						drawTxt(UI.x + 0.6605, UI.y + 1.262, 1.0,1.0,0.6, "P", 255, 255, 255, 150)
					end
				end
			else
				if HUD.Plate then
					drawTxt(UI.x + 0.61, 	UI.y + 1.385, 1.0,1.0,0.55, "~w~" .. PlateVeh, 255, 255, 255, 255) 
				end
				if HUD.ParkIndicator then

					if VehStopped then
						drawTxt(UI.x + 0.643, UI.y + 1.34, 1.0,1.0,0.6, "~r~P", 255, 255, 255, 200)
					else
						drawTxt(UI.x + 0.643, UI.y + 1.34, 1.0,1.0,0.6, "P", 255, 255, 255, 150)
					end
				end
			end
			
			if HUD.Engine then
				if EngineRunning then
					drawTxt(UI.x + 0.619, UI.y + 1.245, 1.0,1.0,0.45, "ENG", 0, 255, 0,200) -- ENG green
				else
					drawTxt(UI.x + 0.619, UI.y + 1.245, 1.0,1.0,0.45, "ENG", 255, 0, 0, 200) -- ENG red
					RPM = 0
				end
			end
			
			if HUD.SpeedIndicator then
				drawRct(UI.x + 0.11, 	UI.y + 0.932, 0.046,0.03,0,0,0,150) -- Speed panel
				if HUD.Speed == 'kmh' then
					drawTxt(UI.x + 0.61, 	UI.y + 1.42, 1.0,1.0,0.64 , "~w~" .. math.ceil(Speed), 255, 255, 255, 255)
					drawTxt(UI.x + 0.633, 	UI.y + 1.432, 1.0,1.0,0.4, "~w~ km/h", 255, 255, 255, 255)
				elseif HUD.Speed == 'mph' then
					drawTxt(UI.x + 0.61, 	UI.y + 1.42, 1.0,1.0,0.64 , "~w~" .. math.ceil(Speed), 255, 255, 255, 255)
					drawTxt(UI.x + 0.633, 	UI.y + 1.432, 1.0,1.0,0.4, "~w~ mph", 255, 255, 255, 255)
				else
					drawTxt(UI.x + 0.81, 	UI.y + 1.42, 1.0,1.0,0.64 , [[Carhud ~r~ERROR~w~ ~c~in ~w~HUD Speed~c~ config (something else than ~y~'kmh'~c~ or ~y~'mph'~c~)]], 255, 255, 255, 255)
				end
			end

			if HUD.DamageSystem then
				drawRct(UI.x + 0.159, 	UI.y + 0.809, 0.005,0.173,0,0,0,100)
				drawRct(UI.x + 0.1661, 	UI.y + 0.809, 0.005,0.173,0,0,0,100)
				drawRct(UI.x + 0.1661, 	UI.y + 0.809, 0.005,VehBodyHP/5800,0,0,0,100)
				drawRct(UI.x + 0.159, 	UI.y + 0.809, 0.005, VehEngineHP / 5800,0,0,0,100)
			end
			

		end		
	end
end)

--local function tyrebusrthud
	--local numWheels = GetVehicleNumberOfWheels(MyPedVeh)
	--local tyreBurst = GetVehicleTyresCanBurst(MyPedVeh)
--end

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end