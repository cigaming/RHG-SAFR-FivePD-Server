Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.SOAStations = {

  SOA = {

    Blip = {
      Pos     = { x = 982.374, y = -104.095, z = 73.849 },
      Sprite  = 226,
      Display = 4,
      Scale   = 0.7,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_COMBATPISTOL',     price = 10000 },
      { name = 'WEAPON_SWITCHBLADE',      price = 500 },
	    { name = 'WEAPON_POOLCUE',          price = 100 },
	  
    },

	  AuthorizedVehicles1 = {
		  { name = 'zombiea',  label = 'Zombie Bobber' },
      { name = 'zombieb',      label = 'Zombie Chopper' },
	  { name = 'gburrito',      label = 'SOA Van' },
      { name = 'daemon2',  label = 'Daemon' }
	  },

    Cloakrooms = {
      { x = 972.173, y = -99.218, z = 73.847 },
    },

    Armories = {
      { x = 976.591, y = -103.577, z = 73.845 },
    },

    Vehicles1 = {
      {
        Spawner    = { x = 979.953, y = -109.988, z = 73.353 },
        SpawnPoint = { x = 980.037, y = -114.55, z = 74.188 },
        Heading    = 139.935,
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
      { x = 983.622, y = -111.528, z = 73.165 },
    },

    BossActions = {
      { x = 973.547, y = -97.395, z = 73.87 }
    },

  },

}
