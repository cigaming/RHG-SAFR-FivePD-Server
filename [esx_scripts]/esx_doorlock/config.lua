Config = {}
Config.Locale = 'en'

Config.PowerDownCoords ={
	x = 2832.532, y = 1538.749, z = 24.729
}


Config.DoorList = {


	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		objName = 'v_ilev_ph_door01',
		objCoords  = {x = 434.747, y = -980.618, z = 30.839},
		textCoords = {x = 434.747, y = -981.50, z = 31.50},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'v_ilev_ph_door002',
		objCoords  = {x = 434.747, y = -983.215, z = 30.839},
		textCoords = {x = 434.747, y = -982.50, z = 31.50},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	-- To locker room & roof
	{
		objName = 'v_ilev_ph_gendoor004',
		objCoords  = {x = 449.698, y = -986.469, z = 30.689},
		textCoords = {x = 450.104, y = -986.388, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objCoords  = {x = 464.361, y = -984.678, z = 43.834},
		textCoords = {x = 464.361, y = -984.050, z = 44.834},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x = 461.286, y = -985.320, z = 30.839},
		textCoords = {x = 461.50, y = -986.00, z = 31.50},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x = 452.618, y = -982.702, z = 30.689},
		textCoords = {x = 453.079, y = -982.600, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objCoords  = {x = 447.238, y = -980.630, z = 30.689},
		textCoords = {x = 447.200, y = -980.010, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To downstairs (double doors)
	{
		objName = 'v_ilev_ph_gendoor005',
		objCoords  = {x = 443.97, y = -989.033, z = 30.6896},
		textCoords = {x = 444.020, y = -989.445, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.2
	},

	{
		objName = 'v_ilev_ph_gendoor005',
		objCoords  = {x = 445.37, y = -988.705, z = 30.6896},
		textCoords = {x = 445.350, y = -989.445, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.2
	},
	
	-- gate and doors
	
	{
		objName = 'prop_gate_airport_01',
		objCoords  = {x = 420.133, y = -1017.301, z = 28.086},
		textCoords = {x = 420.133, y = -1021.00, z = 32.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	},

-- Fort Zancudo Great Ocean Hwy Entrance
{
	objName = 'prop_gate_airport_01',
	objCoords  = {x = -2323.39, y = 3393.71, z = 30.0},
	textCoords = {x = -2319.81, y = 3399.76, z = 32.72},
	authorizedJobs = { 'police' },
	locked = true,
	distance = 14,
	size = 2
},

{
	objName = 'prop_gate_airport_01',
	objCoords  = {x = -2315.04, y = 3404.96, z = 30.0},
	textCoords = {x = -2319.81, y = 3399.76, z = 32.72},
	authorizedJobs = { 'police' },
	locked = true,
	distance = 14,
	size = 2
},

-- Fort Zancudo Route 68 Entrance
{
	objName = 'prop_gate_airport_01',
	objCoords  = {x = -1571.79, y = 2785.86, z = 17.0},
	textCoords = {x = -1576.25, y = 2780.15, z = 18.5},
	authorizedJobs = { 'police' },
	locked = true,
	distance = 14,
	size = 2
},

{
	objName = 'prop_gate_airport_01',
	objCoords  = {x = -1581.76, y = 2775.67, z = 17.0},
	textCoords = {x = -1576.25, y = 2780.15, z = 18.5},
	authorizedJobs = { 'police' },
	locked = true,
	distance = 14,
	size = 2
},

	
	-- woodys guns
	
	{
		objName = 'v_ilev_gc_door04',
		objCoords  = {x = 16.12787, y = -1114.606, z = 29.94694},
		textCoords = {x = 16.12787, y = -1114.606, z = 29.94694},
		authorizedJobs = { 'woodyguns' },
		distance = 10,
		size = 1.7
	},
	
	{
		objName = 'v_ilev_gc_door03',
		objCoords  = {x = 18.572, y = -1115.495, z = 29.94694},
		textCoords = {x = 18.572, y = -1115.495, z = 29.94694},
		authorizedJobs = { 'woodyguns' },
		locked = true,
		distance = 1.2
	},
	
	{
		objName = 'v_ilev_gc_door01',
		objCoords  = {x = 6.81789, y = -1098.209, z = 29.94685},
		textCoords = {x = 6.81789, y = -1098.209, z = 29.94685},
		authorizedJobs = { 'woodyguns' },
		locked = true,
		distance = 1.2
	},
	
	-- mceys
	
	{
		objName = 'v_ilev_genbankdoor2',
		objCoords  = {x = 117.2261, y = -1062.491, z = 29.55178},
		textCoords = {x = 117.2261, y = -1062.491, z = 29.55178},
		authorizedJobs = { 'mcdonalds' },
		distance = 10,
		size = 1.7
	},
	
	{
		objName = 'v_ilev_genbankdoor1',
		objCoords  = {x = 118.2015, y = -1060.147, z = 29.54051},
		textCoords = {x = 118.2015, y = -1060.147, z = 29.54051},
		authorizedJobs = { 'mcdonalds' },
		distance = 10,
		size = 1.7
	},
	
	-- taco
	
	{
		objName = 'prop_bs_map_door_01',
		objCoords  = {x = 8.37, y = -1600.22, z = 29.77},
		textCoords = {x = 8.37, y = -1600.22, z = 29.77},
		authorizedJobs = { 'stevestacos' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},
	
	{
		objName = 'prop_bs_map_door_01',
		objCoords  = {x = 19.79, y = -1598.57, z = 29.69},
		textCoords = {x = 19.79, y = -1598.57, z = 29.69},
		authorizedJobs = { 'stevestacos' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},
	
	{
		objName = 'prop_bs_map_door_01',
		objCoords  = {x = 20.43, y = -1605.05, z = 29.83},
		textCoords = {x = 20.43, y = -1605.05, z = 29.83},
		authorizedJobs = { 'stevestacos' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},
	
	{
		objName = 'prop_bs_map_door_01',
		objCoords  = {x = 12.57, y = -1605.88, z = 30.2},
		textCoords = {x = 12.57, y = -1605.88, z = 30.2},
		authorizedJobs = { 'stevestacos' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},
	
	-- Vesspuci pd 
	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1094.62, y = -812.1, z = 19.37},
		textCoords = {x = -1094.62, y = -812.1, z = 19.37},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.0
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1090.34, y = -808.77, z = 19.37},
		textCoords = {x = -1090.34, y = -808.77, z = 19.37},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.0
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1092.53, y = -810.57, z = 19.37},
		textCoords = {x = -1092.53, y = -810.57, z = 19.37},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 1.0
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1092.03, y = -810.24, z = 19.37},
		textCoords = {x = -1092.03, y = -810.24, z = 19.37},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 1.0
	},


	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1062.3, y = -826.75, z = 19.43},
		textCoords = {x = -1062.3, y = -826.75, z = 19.43},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.5
	},
	

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1060.95, y = -828.87, z = 19.43},
		textCoords = {x = -1060.95, y = -828.87, z = 19.43},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.5
	},


	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1112.64, y = -825.98, z = 19.15},
		textCoords = {x = -1112.64, y = -825.98, z = 19.15},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1110.61, y = -824.5, z = 19.32},
		textCoords = {x = -1110.61, y = -824.5, z = 19.32},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.5
	},


	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1108.87, y = -842.04, z = 19.32},
		textCoords = {x = -1108.18, y = -843.08, z = 19.32},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1107.33, y = -844.12, z = 19.32},
		textCoords = {x = -1107.87, y = -843.51, z = 19.32},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1107.1, y = -844.46, z = 19.32},
		textCoords = {x = -1106.58, y = -845.22, z = 19.32},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1105.61, y = -846.39, z = 19.32},
		textCoords = {x = -1106.09, y = -845.62, z = 19.32},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.5
	},
-- backdoor garage 
	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1111.16, y = -849.06, z = 13.48},
		textCoords = {x = -1111.16, y = -849.06, z = 13.48},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1112.96, y = -846.71, z = 13.48},
		textCoords = {x = -1112.96, y = -846.71, z = 13.48},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.5
	},
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1108.9, y = -842.61, z = 13.68},
		textCoords = {x = -1108.9, y = -842.61, z = 13.68},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.5
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1100.93, y = -846.25, z = 13.69},
		textCoords = {x = -1100.93, y = -846.25, z = 13.69},
		authorizedJobs = { 'police' },
		locked = true,
		distance =2.0
	},



	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1102.91, y = -847.59, z = 13.69},
		textCoords = {x = -1102.91, y = -847.59, z = 13.69},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},

	{
		objName = 'vesp_door1',
		objCoords  = {x = -1085.72, y = -832.4, z = 11.04},
		textCoords = {x = -1085.72, y = -832.4, z = 11.04},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},

	{
		objName = 'vesp_door1',
		objCoords  = {x = -1087.21, y = -830.29, z = 11.04},
		textCoords = {x = -1087.21, y = -830.29, z = 11.04},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},


	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1085.72, y = -832.44, z = 14.88},
		textCoords = {x = -1085.72, y = -832.44, z = 14.88},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1087.16, y = -830.41, z = 14.88},
		textCoords = {x = -1087.16, y = -830.41, z = 14.88},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1101.06, y = -827, z = 14.28},
		textCoords = {x = -1101.06, y = -827, z = 14.28},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},



---- armory vespuci 
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1100.73, y = -826.74, z = 14.28},
		textCoords = {x = -1100.73, y = -826.74, z = 14.28},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},




--- vespuci fire exit


	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1056.77, y = -839.25, z = 4.86},
		textCoords = {x = -1056.77, y = -839.25, z = 4.86},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},



	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1058.92, y = -840.68, z = 4.86},
		textCoords = {x = -1058.92, y = -840.68, z = 4.86},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},


	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1090.94, y = -846.64, z = 4.88},
		textCoords = {x = -1090.94, y = -846.64, z = 4.88},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1089.57, y = -848.67, z = 4.88},
		textCoords = {x = -1089.57, y = -848.67, z = 4.88},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},




-- vespici pd cells 


	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1073.47, y = -827.24, z = 5.48},
		textCoords = {x = -1073.47, y = -827.24, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1087.58, y = -829.83, z = 5.48},
		textCoords = {x = -1087.58, y = -829.83, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1086, y = -827.61, z = 5.48},
		textCoords = {x = -1086, y = -827.61, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},
	
	
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1088.23, y = -824.71, z = 5.48},
		textCoords = {x = -1088.23, y = -824.71, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1090.63, y = -821.63, z = 5.48},
		textCoords = {x = -1090.63, y = -821.63, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1085.81, y = -827.87, z = 5.48},
		textCoords = {x = -1086.81, y = -826.97, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1093.56, y = -823.77, z = 5.48},
		textCoords = {x = -1093.56, y = -823.77, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1091.09, y = -826.94, z = 5.48},
		textCoords = {x = -1091.63, y = -826.07, z = 6.05},
		authorizedJobs = { 'police' },
		locked = true
	},
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1088.83, y = -830.13, z = 5.48},
		textCoords = {x = -1088.83, y = -830.13, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},
	
	
--


	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1093.93, y = -816.39, z = 5.48},
		textCoords = {x = -1093.93, y = -816.39, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},


	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1092.46, y = -818.31, z = 5.48},
		textCoords = {x = -1092.46, y = -818.31, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},



	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1075.51, y = -822.89, z = 5.48},
		textCoords = {x = -1075.51, y = -822.89, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},




	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1073.6, y = -821.65, z = 5.48},
		textCoords = {x = -1073.6, y = -821.65, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},

	----------------------------- back gate
	


	{
		objName = 'prop_facgate_01',
		objCoords  = {x = -1069.72, y = -882.58, z = 4.83},
		textCoords = {x = -1060.79, y = -877.53, z = 5.08},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 5.0
	},


	{
		objName = 'prop_facgate_01b',
		objCoords  = {x = -1058.15, y = -876.03, z = 5.08},
		textCoords = {x = -1058.15, y = -876.03, z = 5.08},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 5.0
	},
	


--- front door vespuci 



	{
		objName = 'vesp_door1',
		objCoords  = {x = -1091.14, y = -817.74, z = 19.04},
		textCoords = {x = -1091.14, y = -817.74, z = 19.04},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},
	
	{
		objName = 'vesp_door1',
		objCoords  = {x = -1093.14, y = -819.32, z = 19.04},
		textCoords = {x = -1093.14, y = -819.32, z = 19.04},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},

	
	{
		objName = 'vesp_door1',
		objCoords  = {x = -1097.71, y = -836.57, z = 19.0},
		textCoords = {x = -1097.71, y = -836.57, z = 19.0},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},



	{
		objName = 'vesp_door1',
		objCoords  = {x = -1099.33, y = -834.65, z = 19.0},
		textCoords = {x = -1099.33, y = -834.65, z = 19.0},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},




	{
		objName = 'vesp_door1',
		objCoords  = {x = -1093.98, y = -845.53, z = 19.0},
		textCoords = {x = -1093.98, y = -845.53, z = 19.0},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},

	
	{
		objName = 'vesp_door1',
		objCoords  = {x = -1095.58, y = -843.38, z = 19.0},
		textCoords = {x = -1095.58, y = -843.38, z = 19.0},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.0
	},

-------- end transmission of vesspuci police department 


	-- 
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 463.815, y = -992.686, z = 24.9149},
		textCoords = {x = 463.30, y = -992.686, z = 25.10},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.381, y = -993.651, z = 24.914},
		textCoords = {x = 461.806, y = -993.308, z = 25.064},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.331, y = -998.152, z = 24.914},
		textCoords = {x = 461.806, y = -998.800, z = 25.064},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.704, y = -1001.92, z = 24.9149},
		textCoords = {x = 461.806, y = -1002.450, z = 25.064},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 463.478, y = -1003.538, z = 25.005},
		textCoords = {x = 464.00, y = -1003.50, z = 25.50},
		authorizedJobs = { 'police' },
		locked = true
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 467.371, y = -1014.452, z = 26.536},
		textCoords = {x = 468.09, y = -1014.452, z = 27.1362},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 469.967, y = -1014.452, z = 26.536},
		textCoords = {x = 469.35, y = -1014.452, z = 27.136},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objCoords  = {x = 488.894, y = -1017.210, z = 27.146},
		textCoords = {x = 488.894, y = -1020.210, z = 30.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objName = 'v_ilev_shrfdoor',
		objCoords  = {x = 1855.105, y = 3683.516, z = 34.266},
		textCoords = {x = 1855.105, y = 3683.516, z = 35.00},
		authorizedJobs = { 'police' },
		locked = false
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		objName = 'v_ilev_shrf2door',
		objCoords  = {x = -443.14, y = 6015.685, z = 31.716},
		textCoords = {x = -443.14, y = 6015.685, z = 32.00},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'v_ilev_shrf2door',
		objCoords  = {x = -443.951, y = 6016.622, z = 31.716},
		textCoords = {x = -443.951, y = 6016.622, z = 32.00},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1844.998, y = 2604.810, z = 44.638},
		textCoords = {x = 1844.998, y = 2608.50, z = 48.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1818.542, y = 2604.812, z = 44.611},
		textCoords = {x = 1818.542, y = 2608.40, z = 48.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	--
	-- Addons
	--

	--[[
	-- Entrance Gate (Mission Row mod) https://www.gta5-mods.com/maps/mission-row-pd-ymap-fivem-v1
	{
		objName = 'prop_gate_airport_01',
		objCoords  = {x = 420.133, y = -1017.301, z = 28.086},
		textCoords = {x = 420.133, y = -1021.00, z = 32.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	}
	--]]

	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = -1387.026, y = -586.6138, z = 30.49563},
		textCoords = {x = -1387.926, y = -586.9138, z = 30.49563},
		authorizedJobs = { 'pawn' },
		locked = false,
		distance = 2,
		size = 0.7
	},

	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = -1389.212, y = -588.0406, z = 30.49132},
		textCoords = {x = -1388.920, y = -587.5599, z = 30.49132},
		authorizedJobs = { 'pawn' },
		locked = false,
		distance = 2,
		size = 0.7
	},
	
	{
		objName = 'v_ilev_gc_door03',
		objCoords  = {x = 191.764, y = -1066.45, z = 29.399},
		textCoords = {x = 191.764, y = -1066.45, z = 29.399},
		authorizedJobs = { 'pawn' },
		locked = true,
		distance = 1.2
	},


	{
		objName = 'slb2k11_SECDOOR',
		objCoords  = {x = 463.405, y = -1011.797, z = 32.98339},
		textCoords = {x = 463.405, y = -1011.797, z = 32.98339},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.2,
		size = 1.0
	},
--	upstairs
	{
		objName = 'slb2k11_glassdoor',
		objCoords  = {x = 429.59, y = -994.581, z = 35.684},
		textCoords = {x = 429.59, y = -994.581, z = 35.684},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'slb2k11_glassdoor',
		objCoords  = {x = 429.64, y = -995.521, z = 35.684},
		textCoords = {x = 429.64, y = -995.521, z = 35.684},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{ 
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = 450.1003, y = -992.956, z = 35.931},
		textCoords = {x = 450.1003, y = -992.956, z = 35.931},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},
--
	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = 442.952, y = -993.737, z = 30.689},
		textCoords = {x = 442.952, y = -993.737, z = 30.689},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = 442.975, y = -992.613, z = 30.689},
		textCoords = {x = 442.975, y = -992.613, z = 30.689},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},
--
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 446.28, y = -998.981, z = 30.724},
		textCoords = {x = 446.28, y = -998.981, z = 30.724},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 445.305, y = -998.885, z = 30.725},
		textCoords = {x = 445.305, y = -998.885, z = 30.725},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 467.965, y = -996.711, z = 24.915},
		textCoords = {x = 467.965, y = -996.711, z = 24.915},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 472.245, y = -996.573, z = 24.915},
		textCoords = {x = 472.245, y = -996.573, z = 24.915},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 476.552, y = -996.697, z = 24.915},
		textCoords = {x = 476.552, y = -996.697, z = 24.915},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 480.776, y = -996.534, z = 24.915},
		textCoords = {x = 480.776, y = -996.534, z = 24.915},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 476.294, y = -1003.455, z = 24.915},
		textCoords = {x = 476.294, y = -1003.455, z = 24.915},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 467.626, y = -1003.453, z = 24.915},
		textCoords = {x = 467.626, y = -1003.453, z = 24.915},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_lostdoor',
		objCoords  = {x = 981.745, y = -102.808, z = 74.849},
		textCoords = {x = 981.745, y = -102.808, z = 74.849},
		authorizedJobs = { 'lazy' },
		locked = true,
		distance = 1.4,
		size = 0.5
	},

	-- mick knows
	
	{
		objName = 'v_ilev_genbankdoor1',
		objCoords  = {x = -1161.575, y = -1714.203, z = 4.510905},
		textCoords = {x = -1161.785, y = -1714.603, z = 4.510905},
		authorizedJobs = { 'cardealer' },
		locked = true,
		distance = 1.4,
		size = 1.0
	},
	
	{
		objName = 'v_ilev_genbankdoor2',
		objCoords  = {x = -1163.75, y = -1715.634, z = 4.510905},
		textCoords = {x = -1163.45, y = -1715.534, z = 4.510905},
		authorizedJobs = { 'cardealer' },
		locked = true,
		distance = 1.4,
		size = 1.0
	},
	
	{
		objName = 'prop_id2_11_gdoor',
		objCoords  = {x=-1153.939,y=-1709.146,z=5.469273},
		textCoords = {x=-1153.939,y=-1709.146,z=5.469273},
		authorizedJobs = { 'cardealer' },
		locked = true,
		distance = 10,
		size = 1.7
	},
	
	----- Used car dealer
	
	{
		objName = 'hei_prop_station_gate',
		objCoords  = {x=-52.05,y=-1671.63,z=29.92},
		textCoords = {x=-52.05,y=-1671.63,z=29.92},
		authorizedJobs = { 'markos' },
		locked = true,
		distance = 10,
		size = 1.7
	},
	
	-- bennys
	
	{
		objName = 'lr_prop_supermod_door_01',
		objCoords  = {x=-205.6828,y= -1310.683,z=30.29572},
		textCoords = {x=-205.6828,y= -1310.683,z=31.29572},
		authorizedJobs = { 'mecano' },
		locked = true,
		distance = 15,
		size = 1.7
	},
	
	-- kfc
	
	{
		objName = 'prop_bhhotel_door_r',
		objCoords  = {x=242.0793,y= -1075.183,z=29.64059},
		textCoords = {x=242.0793,y= -1075.183,z=29.64059},
		authorizedJobs = { 'kfc' },
		locked = true,
		distance = 15,
		size = 1.7
	},
	
	{
		objName = 'prop_bhhotel_door_l',
		objCoords  = {x=244.7656,y= -1075.098,z=29.64059},
		textCoords = {x=244.7656,y= -1075.098,z=29.64059},
		authorizedJobs = { 'kfc' },
		locked = true,
		distance = 15,
		size = 1.7
	},
	
	-- speedycabs

	{
		objName = 'apa_p_mp_yacht_door_02',
		objCoords  = {x = 899.808, y = -162.443, z = 83.495},
		textCoords = {x = 899.808, y = -162.443, z = 83.495},
		authorizedJobs = { 'taxi' },
		locked = true,
		distance = 1.2,
		size = 1.0
	},

	{
		objName = 'apa_p_mp_yacht_door_02',
		objCoords  = {x = 900.634, y = -162.817, z = 83.495},
		textCoords = {x = 900.634, y = -162.817, z = 83.495},
		authorizedJobs = { 'taxi' },
		locked = true,
		distance = 1.2,
		size = 1.0
	},

	{
		objName = 'v_ilev_carmod3door',
		objCoords  = {x = -87.07264, y = -61.25505, z = 58.78257},
		textCoords = {x = -87.07264, y = -61.25505, z = 58.78257},
		authorizedJobs = { 'mecano' },
		locked = true,
		distance = 8.5,
		size = 1.2
	},

	{
		objName = 'imp_prop_impexp_liftdoor_l',
		objCoords  = {x = -113.8419, y = -66.06946, z = 55.40662},
		textCoords = {x = -112.8419, y = -66.40059, z = 57.40662},
		authorizedJobs = { 'mecano' },
		locked = true,
		distance = 4.5,
		size = 1.2
	},

	{
		objName = 'imp_prop_impexp_liftdoor_r',
		objCoords  = {x = -109.7181, y = -67.40059, z = 55.41156},
		textCoords = {x = -110.7181, y = -67.40059, z = 57.41156},
		authorizedJobs = { 'mecano' },
		locked = true,
		distance = 4.5,
		size = 1.2
	},


	--woodyguns

	{
		objName = 'lr_prop_supermod_door_01',
		objCoords  = {x=52.07713, y=-1054.857, z=28.0236},
		textCoords = {x=52.07713, y=-1054.857, z=30.0},
		authorizedJobs = { 'woodyguns' },
		locked = true,
		distance = 8.5,
		size = 1.2
	},

	{
		objName = 'lr_prop_supermod_door_01',
		objCoords  = {x=50.4529, y=-1059.162, z=28.19069},
		textCoords = {x=50.4529, y=-1059.162, z=30.0},
		authorizedJobs = { 'woodyguns' },
		locked = true,
		distance = 8.5,
		size = 1.2
	},

	{
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x=5.61249,y=-1045.425,z=39.46101},
		textCoords = {x=5.61249,y=-1045.425,z=39.46101},
		authorizedJobs = { 'woodyguns' },
		locked = true,
		distance = 1.5,
		size = 1.0
	},

	{
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x=-2.876615,y=-1057.003,z=39.57037},
		textCoords = {x=-2.876615,y=-1057.003,z=39.57037},
		authorizedJobs = { 'woodyguns' },
		locked = true,
		distance = 1.5,
		size = 1.0
	},
	
	-- franklins
	{
		objName = 'v_ilev_fh_frontdoor',
		objCoords  = {x = 7.518359, y = 539.5268, z = 176.1776},
		textCoords = {x = 8.1 , y = 539.5268, z = 176.1776},
		authorizedJobs = { 'taxi' },
		locked = false,
		distance = 2,
		size = 0.7
	},

	{
		objName = 'prop_ch_025c_g_door_01',
		objCoords  = {x = 18.65038, y = 546.3401, z = 176.3448},
		textCoords = {x = 18.65038, y = 546.3401, z = 176.3448},
		authorizedJobs = { 'taxi' },
		locked = false,
		distance = 7.5,
		size = 1.5
	},


	-- bikedealer 
	{
		objName = 'v_ilev_genbankdoor2',
		objCoords  = {x=388.6793,y=-757.2088,z=29.73613},
		textCoords = {x=388.6793,y=-757.2088,z=29.73613},
		authorizedJobs = { 'bikedealer' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},

	{
		objName = 'v_ilev_genbankdoor2',
		objCoords  = {x=386.0833,y=-757.2097,z=29.73349},
		textCoords = {x=386.0833,y=-757.2097,z=29.73349},
		authorizedJobs = { 'bikedealer' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},

	{
		objName = 'prop_id2_11_gdoor',
		objCoords  = {x=378.3356,y=-756.8492,z=30.35549},
		textCoords = {x=378.3356,y=-756.8492,z=30.35549},
		authorizedJobs = { 'bikedealer' },
		locked = true,
		distance = 5.0,
		size = 1.5
	},

	-- tequila
	{
		objName = 'v_ilev_roc_door4',
		objCoords  = {x=-565.1712,y=276.6259,z=83.28626},
		textCoords = {x=-565.1712,y=276.6259,z=83.28626},
		authorizedJobs = { 'woodyguns' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},

	{
		objName = 'v_ilev_roc_door1_l',
		objCoords  = {x=-561.3456, y=278.5798, z=83.12627},
		textCoords = {x=-561.3456, y=278.5798, z=83.12627},
		authorizedJobs = { 'woodyguns' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},

	{
		objName = 'v_ilev_roc_door1_r',
		objCoords  = {x=-559.5514, y=278.4229, z=83.12627},
		textCoords = {x=-559.5514, y=278.4229, z=83.12627},
		authorizedJobs = { 'woodyguns' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},

	{
		objName = 'v_ilev_roc_door5',
		objCoords  = {x=-567.9352, y=291.9264, z=85.52499},
		textCoords = {x=-567.9352, y=291.9264, z=85.52499},
		authorizedJobs = { 'woodyguns' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},

	{
		objName = 'v_ilev_roc_door2',
		objCoords  = {x=-560.2373, y=293.0106, z=82.32609},
		textCoords = {x=-560.2373, y=293.0106, z=82.32609},
		authorizedJobs = { 'woodyguns' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},
	--Prison Doors 
	{
		objName = 'v_ilev_roc_door2',
		objCoords  = {x=-560.2373, y=293.0106, z=82.32609},
		textCoords = {x=-560.2373, y=293.0106, z=82.32609},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},
}

