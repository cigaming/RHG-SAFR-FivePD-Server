Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = false
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.MafiaStations = {

  Mafia = {

    --[[
    Blip = {
      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    }, ]]
    AuthorizedWeapons = {
      { name = 'WEAPON_HATCHET',          price = 2500 },
	  
    },

	  AuthorizedVehicles = {
		  { name = 'taco',  label = 'Company vehicle' },
	  },

    Cloakrooms = {
      { x = 18.59, y = -1604.19, z = 29.56 },
    },

    Armories = {
      { x = 15.44, y = -1605.94, z = 29.7 },
    },

    Vehicles = {
      {
        Spawner    = { x = 16.53, y = -1612.89, z = 29.02 },
        SpawnPoint = { x = 26.29, y = -1615.61, z = 29.32 },
        Heading    = 90.0,
      }
    },
	
	Helicopters = {
      {
        Spawner    = { x = 20.312, y = 535.667, z = 173.627 },
        SpawnPoint = { x = 3.40, y = 525.56, z = 177.919 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = 22.74, y = 545.9, z = 175.027 },
      { x = 21.35, y = 543.3, z = 175.027 },
    },

    BossActions = {
      { x = 8.26, y = -1604.85, z = 29.77 }
    },

  },

}
