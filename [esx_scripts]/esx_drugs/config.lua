Config = {}

Config.Locale = 'en'

Config.CopsRequired  = 2

Config.Delays = {
	WeedProcessing = 1000 * 10,
	CokeProcessing = 1000 * 10,
	SpiceProcessing = 1000 * 10,
}

Config.DrugDealerItems = {  -- add any item here to be sold
	marijuana = math.random( 60 , 600 ),
	coke = math.random( 120 , 1200 ),
	clothe = math.random( 5 , 25 ), -- clothes price
	spice = math.random( 30 , 900 ),
}

Config.DealerBlip = false
Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

Config.LicensePrices = {
	weed_processing = {label = _U('license_weed'), price = 3000},
	coke_processing = {label = _U('license_coke'), price = 5000},
	spice_processing = {label = _U('license_spice'), price = 4000}
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	
	WeedField = {coords = vector3(310.91, 4290.87, 45.15), name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 100.0},
	CokeField = {coords = vector3(2410.21, 3327.89, 47.38), name = _U('blip_cokefield'), color = 37, sprite = 501, radius = 100.0},
	SpiceField = {coords = vector3(-893.87, 6045.55, 46.59), name = _U('blip_spicefield'), color = 37, sprite = 501, radius = 100.0},
}

Config.ProcessZones = {

	WeedProcessing = {coords = vector3(2191.83, 5595.24, 53.77)--[[, name = _U('blip_weedprocessing'), color = 25, sprite = 496, radius = 100.0]]},
	CokeProcessing = {coords = vector3(1439.02, -1488.01, 66.13)--[[, name = _U('blip_cokeprocessing'), color = 30, sprite = 501, radius = 100.0]]},
	SpiceProcessing = {coords = vector3(1391.76, 3607.69, 38.94)--[[, name = _U('blip_spiceprocessing'), color = 30, sprite = 501, radius = 100.0]]},
}

Config.DealerCoords = {

	DrugDealer = {coords = vector3(-1172.54, -1572.39, 4.66), --[[name = _U('blip_drugdealer'), color = 6, sprite = 378, radius = 50.0]]},
}
