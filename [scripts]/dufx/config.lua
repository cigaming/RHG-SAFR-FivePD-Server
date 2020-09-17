--[[
	Tow Truck Drop Off Garages
	Charge for the tow before 
	dropping off the car then
	
	The client then will also be
	charged for the fix like real
	life.
]]--
FoxFix = {
	Enabled = true, -- Enable or disable the full plugin without stopping it.
	Version = "0.0.2.0",
	Language = "en", -- Language Code for dialog.lua
	Free = false, -- Free or essentialmode
	GarageName = "Fox's Garage",
	Seed = 98648746, -- Random seed for the maths.random fucntion, change it if you like.
	--[[
		
		Here are the settings for other mods and the supported options we have in place
		for the given mods.
	
	]]--
	Support = {
		essentialmode = {
			Enabled = false,
			MinCost = 250, -- Lowing amount of money to charge when using a eco framework
			MaxCost = 950 -- Maximum amount of money to charge when using eco framework
		},
		pNotify = false, -- Place holder (may never get added)
		RealisticVehicleFailure = false -- Fix's a bug with Realistic Vehicle Failure  
	},
	--[[
		
		Here are your settings what will affect the dialogs and sounds for 
		the Garages
	
	]]--
	GarageSettings = {
		Delay = true, -- Enable or disable dialogs and delay
		Audio = true -- Enable or disable the hammer sound and the garages	
	},
	--[[
	
		Here are your settings will affect the game play
	
	]]--
	GameSettings = {
		PVP = true, -- Enable PVP on your server
		Police = true, -- Fix Police cars
		Clean = true, -- Clean car on fixing the car.
		EnableID = true, -- Enable users to view there ID with /MyPlayerID
		Fuel = false -- Placeholder don't edit
	},
	SteamID = 0, -- This is a place holder option for the new steam function coming soon 0 is no steam reaction, 1 is locked to steam, 2 is block steam,
	ServerOwner = "Priest0802" -- Gamer Name not steam ID
}