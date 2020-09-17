K9Config = {}
K9Config = setmetatable(K9Config, {})

K9Config.OpenMenuIdentifierRestriction = true
K9Config.OpenMenuPedRestriction = false
K9Config.LicenseIdentifiers = {
	"license:e11a4064614694def2dce67b0363b873db8c2887"
}
K9Config.SteamIdentifiers = {
	"steam:1100001081f9ab0"
}
K9Config.PedsList = {
	"s_m_y_cop_01",
	"s_f_y_cop_01",
	"s_m_y_sheriff_01",
	"s_f_y_sheriff_01",
	"s_m_y_hwaycop_01"
}

-- Restricts the dog to getting into certain vehicles
K9Config.VehicleRestriction = false
K9Config.VehiclesList = {
	
}

-- Searching Type ( RANDOM [AVAILABLE] | VRP [NOT AVAILABLE] | ESX [NOT AVAILABLE] )
K9Config.SearchType = "Random"
K9Config.OpenDoorsOnSearch = false

-- Used for Random Search Type --
K9Config.Items = {
	{item = "Cocaine", illegal = true},
	{item = "Marijuana", illegal = true},
	{item = "Weed", illegal = true},
	{item = "Meth", illegal = true},
	{item = "Opium", illegal = true},
	{item = "Herion", illegal = true},
	{item = "Blunt Spray", illegal = false},
	{item = "Crowbar", illegal = false},
	{item = "Lockpicks", illegal = false},
	{item = "Baggies", illegal = false},
	{item = "Used Needle", illegal = false},
	{item = "Open Container", illegal = false},
}

-- Language --
K9Config.LanguageChoice = "English"
K9Config.Languages = {
	["English"] = {
		follow = "Come",
		stop = "Heel",
		attack = "Bite",
		enter = "In",
		exit = "Out"
	}
}