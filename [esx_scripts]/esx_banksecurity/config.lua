Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 10
Config.TruckPrice	= 30
Config.Locale       = 'en'

Config.Trucks = {
	"stockade",
	"gruppe6",
	--"packer"	
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = -1132.3878173828, y = -839.13195800781, z = 13.810056686401},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = -1146.4929199219, y = -846.5400390625, z = 14.393614768982},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},

	VehicleSpawnPoint = {
			Pos   = {x = -1138.9125976563, y = -851.49285888672, z = 13.822299957275},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}

Config.Livraison = {
-------------------------------------------Los Santos
	-- fleeca
	Delivery1LS = {
			Pos   = {x = 152.41914367676, y = -1034.7471923828, z = 29.333967208862},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- fleeca2
	Delivery2LS = {
			Pos   = {x = -2973.0681152344, y = 481.41714477539, z = 15.25815486908},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- blainecounty
	Delivery3LS = {
			Pos   = {x = -115.31275177002, y = 6454.8017578125, z = 31.432558059692},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	-- PrincipalBank
	Delivery4LS = {
			Pos   = {x = 225.96255493164, y = 227.09648132324, z = 105.55316925049},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 600
		},
	-- route68e
	Delivery5LS = {
			Pos   = {x = 1175.1614990234, y = 2698.154296875, z = 37.991249084473},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 500
		},
	--littleseoul
	Delivery6LS = {
			Pos   = {x = -710.67095947266, y = -925.72772216797, z = 19.00968170166},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 1000
		},
	--grovestreetgas
	Delivery7LS = {
			Pos   = {x = -54.223278045654, y = -1762.7810058594, z = 28.959566116333},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 700
		},
	--fleecacarpark
	Delivery8LS = {
			Pos   = {x = 135.49647521973, y = -1069.1541748047, z = 29.192060470581},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 700
		},
	--Mt Haan Dr Radio Tower
	Delivery9LS = {
			Pos   = {x = 739.69, y = 1292.34, z = 360.30},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 800
		},
	--Senora Way Fuel Depot
	Delivery10LS = {
			Pos   = {x = 2827.21, y = 1530.95, z = 24.57},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 1000
		},
------------------------------------------- 2nd Patrol 
	-- Palomino Noose HQ
	Delivery1BC = {
			Pos   = {x = 2448.21, y = -398.78, z = 92.99},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 1000
		},
	-- El Burro Oil plain
	Delivery2BC = {
			Pos   = {x = 1727.62, y = -1672.99, z = 112.59},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 600
		},
	-- Orchardville ave
	Delivery3BC = {
			Pos   = {x = 843.43, y = -2345.95, z = 30.33},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 600
		},
	-- Elysian Fields
	Delivery4BC = {
			Pos   = {x = 906.90, y = -2540.94, z = 28.31},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 600
		},
	-- Popular St
	Delivery5BC = {
			Pos   = {x = 734.85, y = -1949.37, z = 29.29},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 600
		},
	-- Carson Ave
	Delivery6BC = {
			Pos   = {x = 526.58, y = -1984.99, z = 24.79},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 700
		},
	-- Dutch London
	Delivery7BC = {
			Pos   = {x = 516.99, y = -2182.59, z = 5.99},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 700
		},
	-- Autopia Pkwy
	Delivery8BC = {
			Pos   = {x = 93.84, y = -2194.38, z = 6.04},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 600
		},
	-- Miriam Turner Overpass
	Delivery9BC = {
			Pos   = {x = -404.88, y = -2279.67, z = 7.61},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 700
		},
	-- Exceptionalist Way
	Delivery10BC = {
			Pos   = {x = -593.75, y = -2337.86, z = 13.83},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 700
		},
		
	RetourCamion = {
			Pos   = {x = -1116.6857910156, y = -855.294921875, z = 13.50327205658},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
	
	AnnulerMission = {
			Pos   = {x = -1127.8812255859, y = -859.76025390625, z = 13.573114395142},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
}
