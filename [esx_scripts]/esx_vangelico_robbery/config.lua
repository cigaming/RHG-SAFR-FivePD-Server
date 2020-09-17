Config = {}
Config.Locale = 'en'

Config.RequiredCopsRob = 2
Config.RequiredCopsSell = 2

Stores = {
	["jewelry"] = {
		position = { ['x'] = -629.99, ['y'] = -236.542, ['z'] = 38.05 },       
		reward = math.random(10000,500000),
		nameofstore = "jewelry",
		lastrobbed = 0
	}
}