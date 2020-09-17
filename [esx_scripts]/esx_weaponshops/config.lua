Config               = {}

Config.DrawDistance  = 100
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 255, g = 35, b = 35 }
Config.Type          = 25

Config.Locale        = 'en'

Config.LicenseEnable = true -- only turn this on if you are using esx_license
Config.LicensePrice  = 2500

Config.Zones = {

	GunShop = {
		Legal = true,
		Items = {},
		Locations = {
			vector3(1.13, -1036.39, 39.44)
		}
	},

	BlackWeashop = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(-3021.42, 7456.64, 50.99)
		}
	}

}
