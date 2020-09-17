-- D E B U G G I N G / S E T T I N G S --

offense = {"WANTED : LSPD","WANTED : ASSAULT","WANTED : UNPAID FINES","WANTED : EVADING","WANTED FOR EVADING LAW","WANTED : HIT AND RUN","WANTED : DUI"}
illegalItems = {"Phone","Wallet","Camera","Umbrella","Headphones","Pocket Change","Empty Wrapper","Plastic Bottle","Tape","Lighter","Cigar","Vape","Knife","Pistol","Fake ID card","Used Needle","Empty bottle of beer","Bags with suspicious white powder","AK-47","Gameboy","Body Spray","Candy","Vape Juice","Shirt","Wire cutters"}

weeditem = {"prop_sh_bong_01","prop_sh_joint_01","prop_cs_meth_pipe","prop_cs_crackpipe","prop_pot_plant_02a","prop_cs_burger_01"}
beeritem = {"prop_amb_beer_bottle","prop_beer_box_01","prop_cs_whiskey_bottle","prop_box_guncase_01a"}
stolenitem = {"Drill", "Hand Saw", "Nail Gun", "Containers Of Screws", "Keys To Heavy Machinery", "Wire Cutters", "pistol","rifle"}
dealeritem = {"prop_meth_bag_01", "prop_meth_bag_01", "prop_meth_bag_01", "prop_box_guncase_01a", "prop_box_guncase_01a"}
observations = {"~o~You smell a strong odor of marijuana", "~o~You smell an odor of alchohal","~o~You notice a lot of tools in the back","~o~You notice small bags on the passenger floor","~o~You notice the hilt of a pistol under the passanger seat"}
types = {"weed", "beer", "stolen", "dealer"}
searchstuff = {"None"}
----------------------
player = GetPlayerPed(-1)

local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }
local carType = {[0]="Compact",[1]="Sedan",[2]="SUV",[3]="Coupe",[4]="Muscle",[5]="Sports Classic",[6]="Sports",[7]="Super",[8]="Motorcycle",[9]="Off-road",[10]="Industrial",[11]="Utilty",[12]="Van",[13]="Cycle",[14]="Boat",[15]="Helicopter",[16]="Plane",[17]="Service",[18]="Emergency",[19]="Military",[20]="Commerecial",[21]="Train",}

local fnamesar = {"Tod","Bud","Colin","Nova","Boyd","Vivienne","John","Donald","Mike","Sally","George","Sam","Reuben","Wade","Arthur","Raiden","Camren","Trystan","Hugo","Samir","Ayaan","Curtis","Philip","Elijah","Jeffrey","Frank","Cedric","Payton","Ross","Marshall","Antwan","Jamison","Samuel","Abram","Camron","Luis","Morgan","Ronin","Marcus","Niko","Armani","Jeramiah","Justin","Uriel","Jessie","Alexzander","Tony","Remington","George","London","Brent","Lewis","Edward","Davon","Rigoberto","Denzel","Jamal","Demarion","Reilly","Atticus","Micheal","Clay","Soren","Isiah","Harry","Aryan","Asa","Glenn","Kasen","Marvin","Jeremy","Yusuf","Luciano","Sheldon","Marc","Brody","Coleman","Damari","Darien","Layton","Rafael","Gregory","Luka","Keagan","Zack","Jan","Layne","Keegan","Augustus","Clinton","Jair","Jairo","Chaim","Landyn","Louis","Kolby","Maximus","Hector","Javier","Jorge","Finn","Demetrius","Terrence","Davion","Jordon","Cael","Bradley","Jayvon","Marlon","Axel","Santiago","Kade","Jeffery","Milo","Alijah","Addison","Jasper","Winston","Kolton","Brady","Bailey","Damion","Rocco","Isaiah","Nathanial","Hunter","Cory","Maurice","Jean","Brogan","Benjamin","Raul","Moses","Kaden","Blaze","Trevin","Gunner","Lamont","Jared","Ben","Abel","Dax","Tripp","Isaias","Joel","Deon","Oswaldo","Zain","Korbin","Aaron","Allan","Chad","Tucker","Mario","Isai","Conor","Leonard","Owen","Cyrus","Deegan","Jaron","Pablo","Cristopher","Javion","Leonardo","Gordon","Orlando","William","Gavin","Rishi","Arnav","Jermaine","Bo","Tommy","Issac","Judah","Lincoln","Paxton","Collin","Gerald","King","Oscar","Aron","Blake","Victor","Adriel","Jovanny","Camden","Frederick","Koen","Kaleb","Nikhil","Colby","Emery","Easton","Zion","Callum","Greyson","Ezequiel","Rashad","Pranav","Alex","Jonathon","Urijah","Cristofer","Case","Jaden","Desmond","Colin","Weston","Camryn","Jayvion","Mason","Owen","Ray","Callum","Scotty","Fucking","Cock","Bay","Jeff","Paul","Kanersps","Adam","Jimmy","Garry","Bobby","Arnold","Dick","Maia","Ebonie","Anne","Elijah","Kathryne","Sheryl","Tomika","Stefanie","Laci","Josefina","Clara","Amy","Mary","Emillia","Emily","June","Garry","Bob","Jessy","Bailey","Hadley","Kendall","Laci","Lizeth","Ashlynn","Lesly","Lorelei","Meredith","Tanya","Raina","Cynthia","Eileen","Evie","Lyla","Sonia","Angel","Alexis","Anabella","Layla","Claire","Shania","Aniya","Frida","Celeste","Lindsey","Samara","Tamia","Luz","Lola","Ryann","Kenya","Cassidy","Clare","Litzy","Ashlyn","Cheyenne","Ava","Maggie","Kiera","Rayne","Janelle","Reagan","Martha","Adeline","Giovanna","Elena","June","Annabella","Abril","Karlie","Deja","Belinda","Heather","Lea","Myla","Rhianna","Amirah","Selena","Nina","Amaris","Serenity","Riya","Payton","Cheyanne","Sadie","Dakota","Alison","Mikaela","Jaelyn","Evelyn","Joanna","Jaslene","Zoie","Paola","Ali","Marlee","Charlee","Alma","Kamryn","Avery","Aisha","Rachel","Mckenzie","Alissa","Makenzie","Brenna","Virginia","Rosemary","Wendy","Natasha","Yamilet","Michelle","Maribel","Elyse","Julissa","Lily","Susan","Hailey","Liberty","Tianna","Bella","Roselyn","Naomi","Kinsley","Cameron","Aracely","Averi","Eva","Malia","Sara","Danica","Morgan","Shannon","Raegan","Lyric","Johanna","Melany","Jaqueline","Kennedi","Amy","Chanel","Kaliyah","Zoe","Kaylyn","Chaya","Julie","Alivia","Karissa","Eliza","Kiana","Thalia","Sarahi","Samantha","Noelle","Vivian","Desirae","Dayanara","Aryanna","Teresa","Jordan","Camryn","Ariella","Chana","Sidney","Hana","Princess","Kayley","Jaida","April","Genevieve","Kathryn","Violet","Marlie","Iliana","Kallie","Isla","Cecilia","Stacy","Phoenix","Eliana","Mylie","Amani","Sanaa","Giuliana","Maleah","Amanda","Norah","Gwendolyn","Bailee","Brooklyn","Leia","Amari","Margaret","Kaia","Breanna","Rose","Leslie","Aylin","Celia","Alia","Kasey","Azul","Halle","Tara","Miracle","Shirley","Katrina","Shiloh","Catherine","Addison","Laurel","Jaylah","Heidy","Anabel","Madalyn","Shelby","Saige","Carleigh","Kaelyn","Mommy","Kitchen","Woman","Emma"}
local snamesar = {"Hansen","Malone","Barnett","Cooper","Sosa","Castaneda","Quinn","Stanton","Orozco","Salazar","Gonzalez","Hull","Colon","Vincent","Poole","Good","Serrano","Lozano","Hancock","Travis","Ortega","Mcguire","Carney","Velasquez","Moore","Rosales","Cross","Mullins","Hahn","Carlson","Chase","Glass","Walter","Holmes","Rivera","Medina","Perez","Carson","King","Lloyd","Christian","Franklin","Bautista","Ball","Bowers","Sampson","Harmon","Hutchinson","Rogers","Knight","Sullivan","Christensen","Lindsey","Cantrell","Rush","Reid","Hawkins","Ferrell","Li","Sheppard","Clay","Riley","Blevins","Forbes","Raymond","Hodge","Austin","Skinner","Walsh","Bridges","Jacobson","Wilson","Pacheco","Moss","Randolph","Hoffman","Gilmore","Bryan","Deleon","Oneal","Church","Curtis","Santana","Bruce","Woods","Klein","Vaughan","Solomon","Maxwell","Downs","Strong","Mcmahon","Suarez","Mccall","Ewing","Barron","Zamora","Webster","Hinton","Vargas","Robbins","Roman","Reeves","Douglas","Reilly","Blair","Glover","Arnold","Tran","Maynard","Cuevas","Todd","Kramer","Yoder","Conway","Owens","Wu","Fritz","Hoover","Vance","Green","Frederick","Vega","Osborn","Buck","Pratt","Trujillo","Cortez","Mcclain","Richmond","Krueger","Mayo","Mahoney","Hartman","Bowman","Arias","Boyle","Simmons","Bush","Davenport","Roberts","Ochoa","Chang","Luna","Villegas","Rios","Dodson","Johnston","Shah","Guerrero","Stuart","Rocha","Landry","Estes","Fleming","Davila","Merritt","Love","Petersen","Callahan","Robertson","Hood","Frank","Duke","Lawson","Stevens","Whitney","Benitez","Payne","Gibson","Castillo","Greer","Henson","Dougherty","Nunez","Wells","Wallace","Byrd","Doyle","Goodman","Webb","Ortiz","Houston","Sanchez","Duarte","Mccoy","Lam","Monroe","Carroll","Nash","Parks","Peters","Sutton","Atkins","Bonilla","Mcclure","Leonard","Murphy","Davidson","Harrington","Whitehead","Le","Vazquez","Tucker","Gallagher","Wiley","Larson","Mcconnell","Chandler","Pierce","Salas","Day","Taylor","Shields","Mcdonald","Fowler","Neal","Wall","Murillo","Hopkins","Macdonald","Banks","Acevedo","Bauer","Weeks","Summers","Saunders","Stevenson","Newton","Kent","Sellers","Barber","Rubio","Mejia","Fischer","Thomas","Mccarty","Carter","Duran","Short","Watkins","Meyers","Kirby","Velazquez","Bright","Rivas","Mcneil","Caldwell","Santiago","Zavala","Perkins","Khan","Miller","Ward","Small","Gilbert","Nixon","Cochran","Blackburn","Gates","Stafford","Stein","Wilcox","Morgan","Lyons","Lynn","Cannon","Yates","Wise","Olsen","White","Holt","Riggs","Bond","Heath","Schmitt","Willis","Turner","Ibarra","Burns","Anthony","Weber","Daniels","Higgins","Mayer","Burch","Garner","Trevino","Avila","Woodward","Bray","Fuentes","Terrell","Porter","Mathis","Garrison","Stokes","Marsh","Bailey","Allen","Marshall","Richard","Huffman","Roach","Murray","Preston","Lucas","Mccarthy","Francis","Esparza","Powell","Dunlap","Norman","Crosby","Holland","Brandt","Finley","Delacruz","Romero","Ayala","Pollard","Madden","Irwin","Armstrong","Frye","Mora","Osborne","Wood","Gibbs","Glenn","Hunt","Winters","Bell","Morris","Key","Wolf","Garrett","Rodriguez","Pope","Fisher","Mcintyre","Tyler","Rodgers","Hill","Macias","Brennan","Hines","Conley","Jennings","Ayers","Hernandez","Cole","Beck","Odonnell","Zhang","Hunter","Waller","Cowan","Valentine","Underwood","Donaldson","Bolton","Steele","Wheeler","George","Hester","Richards","Sandoval","Grant","Franco","Everett","Gay","Knox","Sexton","Coleman","Gregory","Young","Pineda","Howard","Combs","Villa","Padilla","Huerta","Hughes","Werner","Kim","Barajas","Pearson","Chan","Robles","Carey","Joseph","Patrick","Lewis","Cantu","Donovan","Rose","Harvey","Strickland","Hammond","Fox","Wiley","Terry","Mendoza","Maldonado","Garrison","Waters","Weber","Pena","Macdonald","Allison","Thompson","Ramsey","Mosley","Hester","Bowman","Blake","Caldwell","Villegas","Case","Moran","Welch","Ortiz","Pham","Mcclure","Reid","Orr","Poole","Rivera","King","Powell","Burns","Salas","Velazquez","Huang","Collins","Pollard","Alvarado","Campbell","Merritt","May","Ford","Wilkins","Durham","Olsen","Barnett","Mahoney","Norman","Nash","Davis","Morton","Woodman","Markozov","Thomas","Hughes","Cena","Gobbler"}

local fmalenamesar = {"Tod","Bud","Colin","Nova","Boyd","Vivienne","John","Donald","Mike","Sally","George","Sam","Reuben","Wade","Arthur","Raiden","Camren","Trystan","Hugo","Samir","Ayaan","Curtis","Philip","Elijah","Jeffrey","Frank","Cedric","Payton","Ross","Marshall","Antwan","Jamison","Samuel","Abram","Camron","Luis","Morgan","Ronin","Marcus","Niko","Armani","Jeramiah","Justin","Uriel","Jessie","Alexzander","Tony","Remington","George","London","Brent","Lewis","Edward","Davon","Rigoberto","Denzel","Jamal","Demarion","Reilly","Atticus","Micheal","Clay","Soren","Isiah","Harry","Aryan","Asa","Glenn","Kasen","Marvin","Jeremy","Yusuf","Luciano","Sheldon","Marc","Brody","Coleman","Damari","Darien","Layton","Rafael","Gregory","Luka","Keagan","Zack","Jan","Layne","Keegan","Augustus","Clinton","Jair","Jairo","Chaim","Landyn","Louis","Kolby","Maximus","Hector","Javier","Jorge","Finn","Demetrius","Terrence","Davion","Jordon","Cael","Bradley","Jayvon","Marlon","Axel","Santiago","Kade","Jeffery","Milo","Alijah","Addison","Jasper","Winston","Kolton","Brady","Bailey","Damion","Rocco","Isaiah","Nathanial","Hunter","Cory","Maurice","Jean","Brogan","Benjamin","Raul","Moses","Kaden","Blaze","Trevin","Gunner","Lamont","Jared","Ben","Abel","Dax","Tripp","Isaias","Joel","Deon","Oswaldo","Zain","Korbin","Aaron","Allan","Chad","Tucker","Mario","Isai","Conor","Leonard","Owen","Cyrus","Deegan","Jaron","Pablo","Cristopher","Javion","Leonardo","Gordon","Orlando","William","Gavin","Rishi","Arnav","Jermaine","Bo","Tommy","Issac","Judah","Lincoln","Paxton","Collin","Gerald","King","Oscar","Aron","Blake","Victor","Adriel","Jovanny","Camden","Frederick","Koen","Kaleb","Nikhil","Colby","Emery","Easton","Zion","Callum","Greyson","Ezequiel","Rashad","Pranav","Alex","Jonathon","Urijah","Cristofer","Case","Jaden","Desmond","Colin","Weston","Camryn","Jayvion","Mason","Owen","Ray","Callum","Scotty","Fucking","Cock","Bay","Jeff","Paul","Kanersps","Adam","Jimmy","Garry","Bobby","Arnold","Dick"}
local ffemalenamesar = {"Maia","Ebonie","Anne","Elijah","Kathryne","Sheryl","Tomika","Stefanie","Laci","Josefina","Clara","Amy","Mary","Emillia","Emily","June","Garry","Bob","Jessy","Bailey","Hadley","Kendall","Laci","Lizeth","Ashlynn","Lesly","Lorelei","Meredith","Tanya","Raina","Cynthia","Eileen","Evie","Lyla","Sonia","Angel","Alexis","Anabella","Layla","Claire","Shania","Aniya","Frida","Celeste","Lindsey","Samara","Tamia","Luz","Lola","Ryann","Kenya","Cassidy","Clare","Litzy","Ashlyn","Cheyenne","Ava","Maggie","Kiera","Rayne","Janelle","Reagan","Martha","Adeline","Giovanna","Elena","June","Annabella","Abril","Karlie","Deja","Belinda","Heather","Lea","Myla","Rhianna","Amirah","Selena","Nina","Amaris","Serenity","Riya","Payton","Cheyanne","Sadie","Dakota","Alison","Mikaela","Jaelyn","Evelyn","Joanna","Jaslene","Zoie","Paola","Ali","Marlee","Charlee","Alma","Kamryn","Avery","Aisha","Rachel","Mckenzie","Alissa","Makenzie","Brenna","Virginia","Rosemary","Wendy","Natasha","Yamilet","Michelle","Maribel","Elyse","Julissa","Lily","Susan","Hailey","Liberty","Tianna","Bella","Roselyn","Naomi","Kinsley","Cameron","Aracely","Averi","Eva","Malia","Sara","Danica","Morgan","Shannon","Raegan","Lyric","Johanna","Melany","Jaqueline","Kennedi","Amy","Chanel","Kaliyah","Zoe","Kaylyn","Chaya","Julie","Alivia","Karissa","Eliza","Kiana","Thalia","Sarahi","Samantha","Noelle","Vivian","Desirae","Dayanara","Aryanna","Teresa","Jordan","Camryn","Ariella","Chana","Sidney","Hana","Princess","Kayley","Jaida","April","Genevieve","Kathryn","Violet","Marlie","Iliana","Kallie","Isla","Cecilia","Stacy","Phoenix","Eliana","Mylie","Amani","Sanaa","Giuliana","Maleah","Amanda","Norah","Gwendolyn","Bailee","Brooklyn","Leia","Amari","Margaret","Kaia","Breanna","Rose","Leslie","Aylin","Celia","Alia","Kasey","Azul","Halle","Tara","Miracle","Shirley","Katrina","Shiloh","Catherine","Addison","Laurel","Jaylah","Heidy","Anabel","Madalyn","Shelby","Saige","Carleigh","Kaelyn","Mommy","Kitchen","Woman","Emma"}
local flagsWalk = {"Failure To Appear","Wanted For Murder","None","Sex Offender","Prostitution","Drug Abuse", "None","Domestic Violence"}

stopped = false
local mimicking = false
local lockedin = false

local notification = false

local targetVeh = nil
local stoppedVeh = nil
stoppedDriver = nil
local vehInfo = nil
driverQuestioned = false
honked = false

pitting = false

local distanceToCheck = 10.0
----------------------
-- Main thread --
-----------------------
for i = 1, 12 do
			EnableDispatchService(i, false)
		end
	Citizen.CreateThread(function()
	
		


		while true do
			if IsControlJustPressed(1, kbpomnu) then
			player = GetPlayerPed(-1)
			playerVeh = GetVehiclePedIsIn(player, false)
				if GetVehicleClass(playerVeh) == 18 then
					local pvPos = GetEntityCoords(playerVeh)
					local inFrontOfPlayerVeh = GetOffsetFromEntityInWorldCoords(playerVeh, 0.0, distanceToCheck, 0.0 )
					targetVeh =  GetVehicleInDirection(pvPos, inFrontOfPlayerVeh)
					if stopped then
						TriggerEvent('po:release')
					elseif mimicking then
						TriggerEvent('po:unmimic')
					else
						if IsVehicleSeatFree(targetVeh,-1) and  IsVehicleSeatFree(targetVeh,0) or  DoesEntityExist(targetVeh) ==  false  then
							-- (vehicle is empty (or doesn't exist), ignore it.)
							ShowNotification( "Vehicle not found." )
						else
							if IsVehicleSirenOn(playerVeh) then
									--pullover
								TriggerEvent('po:pullover')
							else
								if lockedin then
										--unlock
									TriggerEvent('po:unlock')
								else
										--lock
									TriggerEvent('po:lock')
								end
							end
						end
					end
				end
			end
			Citizen.Wait(0)
		end
	end)
	-------------------------------
	Citizen.CreateThread(function()
		while true do
		Citizen.Wait(0)
		
			if stopped == true then
				SetVehicleEngineOn(stoppedVeh, false, false, true)
				--TaskVehicleTempAction(stoppedDriver, stoppedVeh, 27, 10000)
				--SetVehicleFuelLevel(targetVeh, 0)
				if GetEntitySpeed(stoppedVeh) <= 1 then
					--SetVehicleFuelLevel(targetVeh, 0)
					RollDownWindows(targetVeh)
				end
			end
			if lockedin == true then
				if IsVehicleSirenOn(playerVeh) then 
					--unlock
					TriggerEvent('po:unlock')
					--pullover
					TriggerEvent('po:pullover')
				end
				--[[if IsControlJustPressed(0, 51) or IsControlJustPressed(1, 36) and IsPedInAnyVehicle(player) then
					honked = true
					ShowNotification( "~b~You signaled the car to keep moving." )
					TaskVehicleDriveWander(GetPedInVehicleSeat(targetVeh, -1),targetVeh,8.0,2883621)
					Wait(5000)
					ClearPedTasks(GetPedInVehicleSeat(targetVeh, -1))
					honked = false
				end	]]
			end
		end
	end)
	------------------------------------
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if notification == true then
				ShowHelp()
			end
		end
	end)
-- E V E N T S --

RegisterCommand("mimic", function()
	TriggerEvent('pis:mimic')
end)

RegisterNetEvent('pis:mimic')
AddEventHandler('pis:mimic', function()
	if stopped then
		--mimick
		TriggerEvent('po:mimic')
	else
		if mimicking then
			--unmimick
			TriggerEvent('po:unmimic')
		else
			--(You need to pull over a vehicle first)
			ShowNotification( "You need to pullover a vehicle first." )
		end
	end
end, false)

RegisterNetEvent('po:mimic')
AddEventHandler('po:mimic', function()
	stopped = false
	mimicking = true
	lockedin = false
	
	RequestAnimDict("misscarsteal3pullover")
	while not HasAnimDictLoaded("misscarsteal3pullover") do
				Citizen.Wait(100)
			end
	
	if IsVehicleSeatFree(stoppedVeh,-1) then
		stoppedDriver = GetPedInVehicleSeat(stoppedVeh, 0)
	else
		stoppedDriver = GetPedInVehicleSeat(stoppedVeh, -1)
	end
	local playerVeh = GetVehiclePedIsIn(player, false)
	if DoesEntityExist(stoppedVeh) then
		ShowNotification("The ~r~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(stoppedVeh))) .. " ~w~is now mimicking you.")
		mimicking = true
		TaskPlayAnim(player, "misscarsteal3pullover", "pull_over_left", 8.0, -8, -1, 49, 0, 0, 0, 0)
		Citizen.CreateThread(function()
			Citizen.Wait(1100)
			ClearPedSecondaryTask(player)
		end)
		SetPedIntoVehicle(stoppedDriver, stoppedVeh, 0)
		Citizen.Wait(10)
		while (mimicking) do 
			Citizen.Wait(0)
			local speedVect = GetEntitySpeedVector(playerVeh, true)
			if speedVect.y > 0 and reverseWithPlayer then
				SetVehicleForwardSpeed(stoppedVeh, GetEntitySpeed(playerVeh) * 1.5)
			elseif speedVect.y < 0 and reverseWithPlayer then
				SetVehicleForwardSpeed(stoppedVeh, -1 * GetEntitySpeed(playerVeh))
			end
			SetVehicleSteeringAngle(stoppedVeh,GetVehicleSteeringAngle(playerVeh) * 1.5)
			if IsPedInAnyVehicle(stoppedDriver) == false or IsVehicleDriveable(stoppedVeh, false) == false then
				TriggerEvent('po:unmimic')
			end
			while IsEntityInAir(stoppedVeh) do
				Citizen.Wait(0)
			end
		end
	end
end)

RegisterNetEvent('po:unmimic')
AddEventHandler('po:unmimic', function()
	mimicking = false
	Citizen.Wait(100)
	ShowNotification("The ~r~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(stoppedVeh))) .. " ~w~is no longer mimicking you.")
	stopped = true
	lockedin = false
	Wait(2000)
	SetPedIntoVehicle(stoppedDriver, stoppedVeh, -1)
end)

RegisterCommand("follow", function()
	TriggerEvent('pis:follow')
end)

RegisterNetEvent('pis:follow')
AddEventHandler('pis:follow', function()
	if stopped then
		--follow
		TriggerEvent('po:follow')
	else
		if following then
			--unfollow
			TriggerEvent('po:unfollow')
		else
			--(You need to pull over a vehicle first)
			ShowNotification( "You need to pullover a vehicle first." )
		end
	end
end, false)

following = false
RegisterNetEvent('po:follow')
AddEventHandler('po:follow', function()
	stopped = false
	local playerVeh = GetVehiclePedIsIn(player, false)
		if DoesEntityExist(stoppedVeh) then
			ShowNotification("The ~r~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(stoppedVeh))) .. " ~w~is now following you.")
			following = true
			Citizen.Wait(10)
			while (following) do 
				Citizen.Wait(1000)
					local pvPos = GetEntityCoords(playerVeh)
					TaskVehicleDriveToCoord(stoppedDriver, stoppedVeh, pvPos.x, pvPos.y, pvPos.z, 10.0, 0, vehiclehash, 4456765, 1.0, true)
				while IsEntityInAir(stoppedVeh) do
					Citizen.Wait(0)
				end
			end
		end
end)

RegisterNetEvent('po:unfollow')
AddEventHandler('po:unfollow', function()
	following = false
	Citizen.Wait(100)
	ShowNotification("The ~r~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(stoppedVeh))) .. " ~w~is no longer following you.")
	stopped = true
	lockedin = false
	Wait(2000)
	SetPedIntoVehicle(stoppedDriver, stoppedVeh, -1)
end)

RegisterNetEvent('po:stopped')
AddEventHandler('po:stopped', function()




end)

breathNum = 0
RegisterNetEvent('po:pullover')
AddEventHandler('po:pullover', function()
	stoppedVeh = targetVeh
	if IsVehicleSeatFree(stoppedVeh,-1) then
		 stoppedDriver = GetPedInVehicleSeat(stoppedVeh, 0)
	else
		 stoppedDriver = GetPedInVehicleSeat(stoppedVeh, -1)
	end
		SetEntityHealth(stoppedDriver, 200)
	SetEntityAsMissionEntity(stoppedVeh, true, true)
	local playerPos = GetEntityCoords(player)
	local currentZone = zones[GetNameOfZone(playerPos.x, playerPos.y, playerPos.z)]
	SetEntityAsMissionEntity(stoppedVeh, true, true)
	
	-------------------
		pedGender = GetPedType(stoppedDriver)
		if pedGender == 5 then
			pedGender = 'Female'
		elseif pedGender == 4 then
			pedGender = 'Male'
		else
			pedGender = 'Male'
		end
		
        vehPlate = GetVehicleNumberPlateText(vehicle)
		
		if pedGender == "Male" then
		fname = fmalenamesar[math.random(#fmalenamesar)]
		elseif pedGender == "Female" then
		fname = ffemalenamesar[math.random(#ffemalenamesar)]
		else
		fname = fmalenamesar[math.random(#fmalenamesar)]
		end
		
		sname = snamesar[math.random(#snamesar)]
		dfname = fname
		dsname = sname
		dob_y = math.random(1949, 1999)
		dob_m = math.random(1, 12)
		dob_d = math.random(1, 29)
		regOwner = (fname .. " " .. sname)
		fullDob = (dob_m .. "/" .. dob_d .. "/" .. dob_y)
		driverName = regOwner
		fullDriverDob = fullDob

		
		regYear = math.random(1990, 2018)

		canobserve = math.random(1,20)
		
		observe = "Nothing"
		
		breathNum = 0
		local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		local heading = GetEntityHeading(GetPlayerPed(-1))
		
		if canobserve > 14 then
		
		
		observe = observations[math.random(#observations)]
		
		if observe == "~o~You smell a strong odor of marijuana" then
		
		
		
		searchstuff = weeditem
		scene = true
		
		
		elseif observe == "~o~You smell an odor of alchohal" then
		searchstuff = beeritem
		breathNum = math.random(1,7)
		scene = true
		
		
		elseif observe == "~o~You notice a lot of tools in the back" then
		searchstuff = stolenitem
		scene = true
		
		
		elseif observe == "~o~You notice small bags on the passenger floor" then
		searchstuff = dealeritem
		scene = true
		else
		
		searchstuff = {"None"}
		
		end
		
		
		end
		
		

	flags = "~g~NONE"
	InsuredRand = math.random(8)
	RegisteredRand = math.random(12)
	StolenRand = 0
	chanceFlee = math.random(1, 40)
	chanceShootOrFlee = math.random(2, 5)
	if StolenRand == 24 then
		flags = "~r~UNINSURED"
		flags = "~r~STOLEN"
		isStolen = true
	elseif RegisteredRand == 12 then
		flags = "~r~UNREGISTERED"
		regYear = "~r~UNREGISTERED"
	elseif InsuredRand == 8 then
		flags = "~r~UNINSURED"
	end	
	lostIdChance = math.random(0,100)
	diffname = math.random(0,100)
	if isStolen == true or diffname > 95 then
		dfname = fnamesar[math.random(#fnamesar)]
		dsname = snamesar[math.random(#snamesar)]
		ddob_y = math.random(1949, 1999)
		ddob_m = math.random(1, 12)
		ddob_d = math.random(1, 29)
		driverName = (dfname .. " " .. dsname)
		fullDriverDob = (dob_m .. "/" .. dob_d .. "/" .. dob_y)
		--chanceFlee = math.random(1, 30)
		--chanceShootOrFlee = math.random(2, 5)
		lostIdChance = math.random(80,100)
	end
	
	driverAttitude = math.random(100)
	
	pedFlags = "~g~NONE"
	offRand = math.random(100)
	if  offRand > 80 then
		pedFlags = offense[math.random(#offense)]
		--chanceFlee = math.random(1, 30)
		--chanceShootOrFlee = math.random(2, 5)
	end
	citations = math.random(-5, 6)
	if citations < 0 then
		citations = 0
	end
	

	drugnum_cannabis = math.random(100)
	drugnum_cocaine = math.random(100)
	drugnum_heroin = math.random(100)
	cannabis = "~g~Negative"
	cocaine = "~g~Negative"
	heroin = "~g~Negative"
	if drugnum_cannabis > 90 then
		cannabis = "~r~Positive"
		drunk = true
		--chanceFlee = math.random(18, 30)
	end
	if drugnum_cocaine > 90 then
		cocaine = "~r~Positive"
		drunk = true
		--chanceFlee = math.random(20, 30)
	end
	if drugnum_heroin > 90 then
		heroin = "~r~Positive"
		drunk = true
		--chanceFlee = math.random(20, 30)
	end
	search = false
	searchNum = math.random(100)
	if searchNum >= 90 then
		search = true
		lostIdChance = math.random(70,100)
	end
	
	local randomHuangChance = math.random(40,90)
	if randomHuangChance == 69 then
		dfname = "Fucking"
		dsname = "Huang"
	end
	
	
	driverQuestioned = false
		----------------
	if drunk == true then
		if not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") then
			RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
				while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
					Citizen.Wait(0)
				end
			end
					
		SetPedConfigFlag(stoppedDriver, 100, true)
		SetPedMovementClipset(stoppedDriver, "MOVE_M@DRUNK@VERYDRUNK", 1.0)
	end
	if isStolen == true then
		brokenWindow = math.random(2)
		if brokenWindow == 2 then
			SmashVehicleWindow(stoppedVeh, math.random(3))
		end
	end
	if stoppedVeh == randVeh then
		RemoveBlip(vehBlip)
	end
		----------------
	timeAfterStop = (math.random(5, 30) * 1000)
	timeAfterShoot = (math.random(5, 30) * 1000)
	if chanceFlee == 30 then
		ALPR(targetVeh)
		TriggerEvent('po:flee')
	elseif chanceFlee == 29 then
			if chanceShootOrFlee == 5 then
				TriggerEvent('po:stop')
				Wait(timeAfterStop)
				TriggerEvent('po:shoot')
				Wait(timeAfterShoot)
				TriggerEvent('po:flee')
			else
			isPedGoingToFlee = true
				TriggerEvent('po:stop')
				while (isPedGoingToFlee) do
				Citizen.Wait(0)
					distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(stoppedDriver))
						if distanceToVeh <= 5 and IsPedInAnyVehicle(player) == false then
						
							stopped = false
							mimicking = false
							lockedin = false
							SetVehicleEngineOn(stoppedVeh, true, false, true)
							Citizen.Wait(5000)
							TriggerEvent("po:flee")
							isPedGoingToFlee = false
						end
				end
			end
	else
		TriggerEvent('po:stop')
	end
end)

RegisterCommand("carcheck", function()
	ShowNotification(chanceFlee .. " "	.. chanceShootOrFlee .. " " .. timeAfterStop .. "  " .. timeAfterShoot)
end)

RegisterCommand("runplate", function(s,args,raw)
	
	--need to compare input with current pulled over vehicle's plate number
	--if its true this will show up (if not it will trigger GetInfo)
	local vehPlateNum = GetVehicleNumberPlateText(targetVeh)
	if args[1] == vehPlateNum or args[1] == nil then
		TriggerEvent('radio')
		ShowNotification("~b~SACIC Database: ~w~\nRunning ~o~" .. vehPlateNum .. "~w~." )
		Wait(2000)
		ShowNotification("~w~Reg. Owner: ~y~" .. regOwner .. "~w~\nReg. Year: ~y~" .. regYear .. "~w~\nFlags: ~y~" .. flags)
	else
		TriggerEvent('radio')
		ShowNotification("~o~SACIC Database: ~w~\nRunning ~o~" .. args[1] .. "~w~." )
		Wait(2000)
		TriggerEvent('getInfo')
		ShowNotification("~w~Reg. Owner: ~y~" .. rregOwner .. "~w~\nReg. Year: ~y~" .. rregYear .. "~w~\nFlags: ~y~" .. rflags)
	end
end)

RegisterNetEvent('pis:ticket')
AddEventHandler('pis:ticket', function()
	local ticket = "CODE_HUMAN_MEDIC_TIME_OF_DEATH"
	ShowNotification("~o~Officer:~w~ " .. "I'm going to be issuing you a citation of ~g~" .. price .. " ~w~for ~y~" .. reason)
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(GetPlayerPed(-1), ticket, 0, 1)
		emotePlaying = true
	end
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1)) then
			emotePlaying = false
		end
	end
	if driverAttitude < 50 then
		DriverTicketQuotes = {"Alright..","I understand.","Yeah, thats fine."}
	else
		DriverTicketQuotes = {"Oh come on!","You asshole.","All you cops do is fuck people over.","Go fight real crime."}
	end
		ShowNotification("~o~Driver:~w~ " .. DriverTicketQuotes[math.random(#DriverTicketQuotes)])
end)

RegisterNetEvent('pis:getplate')
AddEventHandler('pis:getplate', function()
	vehPlateNum = GetVehicleNumberPlateText(targetVeh)
end)

function GetPedInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 12, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

RegisterNetEvent('observe')
AddEventHandler('observe', function()

ShowNotification(observe)

end)

RegisterNetEvent('pis:footid')
AddEventHandler('pis:footid', function()

local player = GetPlayerPed(-1)

local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(stoppedDriver))
	

	local playerPos = GetEntityCoords( player )
    local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( player, 0.0, 5.0, 0.0 ) -- get the ped DIRECTLY IN FRONT OF THE PLAYER (can be hard to get right, need some other way to do this. Maybe get the closest ped to the player)
    cuffingPed = GetPedInDirection( playerPos, inFrontOfPlayer )
if DoesEntityExist(cuffingPed) or distanceToVeh <= 5 then
	
	if speech == "Normal" then
			local OfficerNormalQuotes = {"Can i see your drivers license, registration, and proof of insurance, please?", "drivers license, registration, and proof of insurance, please."}
			ShowNotification("~o~Officer:~w~ " .. OfficerNormalQuotes[math.random(#OfficerNormalQuotes)])
		else
			local OfficerAggresiveQuotes = {"Show me your drivers license, registration, and proof of insurance.", "Give me your  drivers license, registration, and proof of insurance.", "Give me your  drivers license, registration, and proof of insurance.", "Show me your drivers license, registration, and proof of insurance."}
			ShowNotification("~o~Officer:~w~ " .. OfficerAggresiveQuotes[math.random(#OfficerAggresiveQuotes)])
		end
		Wait(200)
		pedGender = GetPedType(cuffingPed)
		if pedGender == 5 then
			pedGender = 'Female'
		elseif pedGender == 4 then
			pedGender = 'Male'
		else
			pedGender = 'Male'
		end
		
        
		
		if pedGender == "Male" then
		fname = fmalenamesar[math.random(#fmalenamesar)]
		elseif pedGender == "Female" then
		fname = ffemalenamesar[math.random(#ffemalenamesar)]
		else
		fname = fmalenamesar[math.random(#fmalenamesar)]
		end
		
		sname = snamesar[math.random(#snamesar)]
		dfname = fname
		dsname = sname
		dob_y = math.random(1949, 1999)
		dob_m = math.random(1, 12)
		dob_d = math.random(1, 29)
		regOwner = (fname .. " " .. sname)
		fullDob = (dob_m .. "/" .. dob_d .. "/" .. dob_y)
		driverName = regOwner
		fullDriverDob = fullDob

		
		citations = math.random(0,4)
		warrentchance = math.random(0, 100)
		
		if warrentchance > 85 then
		pedFlags =  "~r~"..flagsWalk[math.random(#flagsWalk)]
		
		else
		
		pedFlags = "~g~None"
		
		end
		
		
		
		

	flags = "~g~NONE"
	
			driverQuestioned = true
		Wait(2000)
		ShowNotification("~y~" .. driverName .. "~w~ | ~b~" .. pedGender .. "~w~ | ~b~" .. fullDriverDob)
		
	
	Wait(1000)
	
	if  IsPedInAnyVehicle(stoppedDriver) and stoppedDriver ~= nil then
	ShowNotification("~r~Observations: "..observe)
	end
 else
ShowNotification("~o~Nope.")
end
end)

RegisterNetEvent('pis:runplate')
AddEventHandler('pis:runplate', function()
	local vehPlateNum = GetVehicleNumberPlateText(targetVeh)
	
	if plate == "98765" then 
	TriggerEvent('radio')
		ShowNotification("~o~SACIC Database: ~w~\nRunning ~o~" .. plate .. "~w~." )
		Wait(2000)
		TriggerEvent('getInfo')
		ShowNotification("~w~Reg. Owner: ~y~" .. rregOwner .. "~w~\nReg. Year: ~y~" .. rregYear .. "~w~\nFlags: ~y~" .. "~o~Known Drug Dealer~o~")
	
	
	return
	
	end
	
	if plate == "6969" then 
	TriggerEvent('radio')
		ShowNotification("~o~SACIC Database: ~w~\nRunning ~o~" .. plate .. "~w~." )
		Wait(2000)
		TriggerEvent('getInfo')
		ShowNotification("~w~Reg. Owner: ~y~" .. rregOwner .. "~w~\nReg. Year: ~y~" .. rregYear .. "~w~\nFlags: ~y~" .. "~o~Known Drug Abuse~o~")
	
	
	return
	
	end
	
	
	if plate == vehPlateNum or plate == "" then
		TriggerEvent('radio')
		ShowNotification("~b~SACIC Database: ~w~\nRunning ~o~" .. vehPlateNum .. "~w~." )
		Wait(2000)
		ShowNotification("~w~Reg. Owner: ~y~" .. regOwner .. "~w~\nReg. Year: ~y~" .. regYear .. "~w~\nFlags: ~y~" .. flags)
	else
		TriggerEvent('radio')
		ShowNotification("~o~SACIC Database: ~w~\nRunning ~o~" .. plate .. "~w~." )
		Wait(2000)
		TriggerEvent('getInfo')
		ShowNotification("~w~Reg. Owner: ~y~" .. rregOwner .. "~w~\nReg. Year: ~y~" .. rregYear .. "~w~\nFlags: ~y~" .. rflags)
	end
end)

RegisterNetEvent('pis:runid')
AddEventHandler('pis:runid', function()
	if name == driverName or name == "" then
		if name == nil and driverQuestioned == false then
			ShowNotification("~r~You have to ask for ~o~driver's information~r~ first!" )
		else
			TriggerEvent('radio')
			
			ShowNotification("~y~" .. driverName .. "~w~ | ~b~" .. pedGender .. "~w~ | ~b~" .. fullDriverDob .. "\n~w~Citations: ~r~" .. citations .. "\n~w~Flags: ~r~" .. pedFlags)
		end
	else
		TriggerEvent('getInfo')
		TriggerEvent('radio')
		ShowNotification("~o~SACIC Database: ~w~\nRunning ~o~" .. name .. "~w~." )
		Wait(2000)
		ShowNotification("~y~" .. name .. "~w~ | ~b~" .. rfullDriverDob .. "\n~w~Citations: ~r~" .. rcitations .. "\n~w~Flags: ~r~" .. rpedFlags)
	end
end)

RegisterNetEvent('pis:search')
AddEventHandler('pis:search', function()
local player = GetPlayerPed(-1)
	playerpos = GetEntityCoords(player)
	--CreateIncident(5,playerpos, 0, 3.0, 0);
--RegisterCommand("search", function()
	local playerPos = GetEntityCoords(player)
	local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(player, 0.0, 5.0, 0.0 ) -- get the ped DIRECTLY IN FRONT OF THE PLAYER (can be hard to get right, need some other way to do this. Maybe get the closest ped to the player)
    local searchVeh = GetVehicleInDirection(playerPos, inFrontOfPlayer)
	local searchPed = GetPedInDirection(playerPos, inFrontOfPlayer)
	if DoesEntityExist(searchVeh) then
		TriggerEvent('search')
		if DoesEntityExist(searchVeh) and IsEntityAVehicle(searchVeh) then
			ShowNotification("~b~Searching~w~ the vehicle...")
			SetVehicleDoorOpen(searchVeh, 0, false, false)
			SetVehicleDoorOpen(searchVeh, 1, false, false)
			SetVehicleDoorOpen(searchVeh, 2, false, false)
			SetVehicleDoorOpen(searchVeh, 3, false, false)
			SetVehicleDoorOpen(searchVeh, 4, false, false)
			SetVehicleDoorOpen(searchVeh, 5, false, false)
			Citizen.Wait(6000)
			SetVehicleDoorShut(searchVeh, 0, false, false)
			SetVehicleDoorShut(searchVeh, 1, false, false)
			SetVehicleDoorShut(searchVeh, 2, false, false)
			SetVehicleDoorShut(searchVeh, 3, false, false)
			SetVehicleDoorShut(searchVeh, 4, false, false)
			SetVehicleDoorShut(searchVeh, 5, false, false)
		else
			ShowNotification("~b~Searching~w~ the subject...")
			Wait(3000)
		end
		
		
			
		if scene == true    then
		ShowNotification("~w~Found ~r~"..searchstuff[math.random(#searchstuff)].. ", "..searchstuff[math.random(#searchstuff)].. ", "..searchstuff[math.random(#searchstuff)] )
		scene = false
		else 
		--scene = false
		ShowNotification("~w~Found ~r~"..illegalItems[math.random(#illegalItems)].. ", "..illegalItems[math.random(#illegalItems)] )
		end
	else
		ShowNotification("~r~You must be looking at the target!")
	end
end)

RegisterNetEvent('pis:breath')
AddEventHandler('pis:breath', function()
--RegisterCommand("breath", function()
	local playerPos = GetEntityCoords(player)
	local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(player, 0.0, 5.0, 0.0 ) -- get the ped DIRECTLY IN FRONT OF THE PLAYER (can be hard to get right, need some other way to do this. Maybe get the closest ped to the player)
    local breathPed = GetPedInDirection(playerPos, inFrontOfPlayer)
    local breathVeh = GetVehicleInDirection(playerPos, inFrontOfPlayer)
	if DoesEntityExist(breathPed) then
		if breathPed == stoppedDriver then
			breathNum = breathNum
		else
			TriggerEvent('getInfo')
			
		end
		TaskTurnPedToFaceEntity(drugPed, player, 6000)
		TriggerEvent('search')
		ShowNotification("~w~Performing ~b~Breathalyzer~w~ test...")
		Wait(3000)
		ShowNotification("~b~BAC~w~ Level: ~r~0." .. breathNum)
	end
	if DoesEntityExist(breathVeh) then
		breathDriver = GetPedInVehicleSeat(breathVeh, -1)
		if breathDriver == stoppedDriver then
			breathNum = breathNum
		else
			TriggerEvent('getInfo')
			breathNum = breathNum
		end
		if DoesEntityExist(breathDriver) then
			ShowNotification("~w~Performing ~b~Breathalyzer~w~ test...")
			TriggerEvent('search')
			Wait(2000)
			if breathNum >= 8 then
			ShowNotification("~b~BAC~w~ Level: ~r~0." .. breathNum)
			else
			ShowNotification("~b~BAC~w~ Level: ~g~0." .. breathNum)
			end
		end
	end
end)

RegisterNetEvent('pis:drug')
AddEventHandler('pis:drug', function()
--RegisterCommand("drug", function()
--distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(stoppedDriver))
	local playerPos = GetEntityCoords(player)
	local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(player, 0.0, 5.0, 0.0 ) -- get the ped DIRECTLY IN FRONT OF THE PLAYER (can be hard to get right, need some other way to do this. Maybe get the closest ped to the player)
    local drugPed = GetPedInDirection(playerPos, inFrontOfPlayer)
    local drugVeh = GetVehicleInDirection(playerPos, inFrontOfPlayer)
	if DoesEntityExist(drugPed) then
		if drugPed == stoppedDriver then
			cannabis = cannabis
			cocaine = cocaine
			heroin = heroin
		else
			TriggerEvent('getInfo')
			cannabis = rcannabis
			cocaine = rcocaine
			heroin = rheroin
		end
		TaskTurnPedToFaceEntity(drugPed, player, 6000)
		TriggerEvent('search')
		ShowNotification("~w~Performing a ~b~Drugalyzer~w~ test...")
		Wait(3000)
		ShowNotification("~w~Results:\n~b~  Cannabis~w~: " .. cannabis .. "\n~b~  Cocaine~w~: " .. cocaine .. "\n~b~  Heroin~w~: " .. heroin)
		if not DoesEntityExist(drugVeh) and not DoesEntityExist(drugPed) then
			ShowNotification("~r~You need to be looking at the suspect!")
		end
	end
	if DoesEntityExist(drugVeh) then
		drugDriver = GetPedInVehicleSeat(drugVeh, -1)
		if drugDriver == stoppedDriver then
			cannabis = cannabis
			cocaine = cocaine
			heroin = heroin
		else
			TriggerEvent('getInfo')
			cannabis = rcannabis
			cocaine = rcocaine
			heroin = rheroin
		end
		if DoesEntityExist(drugDriver) then
			TriggerEvent('search')
			ShowNotification("~w~Performing a ~b~Drugalyzer~w~ test...")
			Wait(3000)
			ShowNotification("~w~Results:\n~b~  Cannabis~w~: " .. cannabis .. "\n~b~  Cocaine~w~: " .. cocaine .. "\n~b~  Heroin~w~: " .. heroin)
		end
	elseif not DoesEntityExist(drugVeh) and not DoesEntityExist(drugPed) then
			ShowNotification("~r~You need to be looking at the target!")
	end
end)

RegisterNetEvent('pis:askid')
AddEventHandler('pis:askid', function()
	local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(stoppedDriver))
	--ShowNotification(observe)
	if distanceToVeh <= 5 then
	--ShowNotification("dick")
		if speech == "Normal" then
			local OfficerNormalQuotes = {"Can i see some ID?", "ID, please.", "License and registration."}
			ShowNotification("~o~Officer:~w~ " .. OfficerNormalQuotes[math.random(#OfficerNormalQuotes)])
		else
			local OfficerAggresiveQuotes = {"Show me your ID.", "Give me your ID.", "Give me your fucking license.", "Show me your info."}
			ShowNotification("~o~Officer:~w~ " .. OfficerAggresiveQuotes[math.random(#OfficerAggresiveQuotes)])
		end
		Wait(2000)
		if lostIdChance > 95 then
			ShowNotification("~b~Driver:~w~ Sorry officer, I don't have it on me...")
		else
			if driverAttitude < 50 then
				driverResponseID = {"Yeah, sure.","Okay, here you go.","There.","Take it, just hurry up please.","*Gives ID*","Okay, here you go.","Sure thing!","Alright, no problem.","Yep, there it is."}
			elseif driverAttitude > 50 and driverAttitude < 80 then
				driverResponseID = {"Take it, just hurry up please.","I really don't have the time for this...","What was I stopped for again?","Sure thing, did I do something wrong?","Is this necessary?"}
			elseif driverAttitude > 80 then
				driverResponseID = {"Is it because I'm black?","Just take it already...","Uhm.. Sure... Here.","But I've done nothing wrong, sir!", "Pig.", "Why dont you go and fight real crime?"}
			end
			ShowNotification("~b~Driver:~w~ " .. driverResponseID[math.random(#driverResponseID)])
			ShowNotification("~w~Driver's ID: ~y~" .. driverName  .. "~w~\nDOB: ~y~" .. fullDriverDob)
			driverQuestioned = true
		end
	else
		ShowNotification("~r~You need to be closer to the driver!")
	end
end)

RegisterCommand("runid", function(s,args,raw)
	--need to compare input with current driver's name and surname
	--if its true this will show up
	if args[1] == dfname and args[2] == dsname or args[1] == nil then
		if args[1] == nil and driverQuestioned == false then
			ShowNotification("~r~You have to ask for ~o~driver's ID~r~ first!" )
		else
			TriggerEvent('radio')
			ShowNotification("~b~SACIC Database: ~w~\nRunning ~o~" .. driverName .. "~w~." )
			Wait(2000)
			ShowNotification("~y~" .. driverName .. "~w~ | ~b~" .. pedGender .. "~w~ | ~b~" .. fullDriverDob .. "\n~w~Citations: ~r~" .. citations .. "\n~w~Flags: ~r~" .. pedFlags)
		end
	else
		TriggerEvent('getInfo')
		TriggerEvent('radio')
		ShowNotification("~o~SACIC Database: ~w~\nRunning ~o~" .. args[1] .. " " .. args[2] .. "~w~." )
		Wait(2000)
		ShowNotification("~y~" .. args[1] .. " " .. args[2] .. "~w~ | ~b~" .. rfullDriverDob .. "\n~w~Citations: ~r~" .. rcitations .. "\n~w~Flags: ~r~" .. rpedFlags)
	end
end)

RegisterNetEvent('pis:exit')
AddEventHandler('pis:exit', function()
	if stopped then
		Citizen.CreateThread(function()
			if speech == "Normal" then
				ShowNotification("~o~Officer:~w~ Can you step out of the car for me, please?")
			else
				ShowNotification("~o~Officer:~w~ Get the fuck out of the car.")
			end
			local resistExitChance = math.random(30)
			if isStolen then
				resistExitChance = math.random(28,29)
			end
			fleeAfterExitChance = math.random(10)
			if resistExitChance == 29 or resistExitChance == 25 or isPedGoingToFlee then
				stopped = false
				mimicking = false
				lockedin = false
				SetVehicleEngineOn(stoppedVeh, true, false, true)
				Citizen.Wait(500)
				local driverResponseResist = {"No way!","Fuck off!","Not today!","Shit!","Uhm.. Nope.","Get away from me!","Pig!","No.","Never!","You'll never take me alive, pig!"}
				ShowNotification("~b~Driver:~w~ ".. driverResponseResist[math.random(#driverResponseResist)])
				Citizen.Wait(5000)
				TriggerEvent("po:flee")
			else
				local driverResponseExit = {"What's the problem?","What seems to be the problem, officer?","Yeah, sure.","Okay.","Fine.","What now?","Whats up?","Ummm... O-okay.","This is ridiculous...","I'm kind of in a hurry right now.","Oh what now?!","No problem.","Am I being detained?","Yeah, okay... One moment.","Okay.","Uh huh.","Yep."}
				ShowNotification("~b~Driver:~w~ " .. driverResponseExit[math.random(#driverResponseExit)])
				TaskLeaveAnyVehicle(stoppedDriver)
				local playerGroupId = GetPedGroupIndex(player)
				SetPedAsGroupMember(stoppedDriver, playerGroupId)
			end
		end)
	end
end)

RegisterNetEvent('pis:mount')
AddEventHandler('pis:mount', function()
	if stopped then
		ShowNotification("~o~Officer:~w~ Get back in the car, please.")
		Citizen.CreateThread(function()
		RemovePedFromGroup(stoppedDriver)
		TaskEnterVehicle(stoppedDriver,stoppedVeh,30000,-1,2.0,1,0)
		end)
	end
end)

RegisterNetEvent('pis:release')
AddEventHandler('pis:release', function()
	if stopped then
	if speech == "Normal" then
		ShowNotification("~o~Officer:~w~ Alright, you're free to go.")
	else
		ShowNotification("~o~Officer:~w~ Get out of here before i change my mind.")
	end
	if driverAttitude < 50 then
		driverResponseRelease = {"Okay, thanks.","Thanks.","Thank you officer, have a nice day!","Thanks, bye!","I'm free to go? Okay, bye!"}
	elseif driverAttitude > 50 and driverAttitude < 80 then
		driverResponseRelease = {"Alright.","Okay.","Good.","Okay, bye.","Okay, goodbye officer.","Later.","Bye bye.","Until next time."}
	elseif driverAttitude > 80 then
		driverResponseRelease = {"Bye, asshole...","Ugh.. Finally.","Damn cops...","Until next time.","Its about time, pig"}
	end
	Wait(2000)
	ShowNotification("~b~Driver:~w~ " .. driverResponseRelease[math.random(#driverResponseRelease)])
	TriggerEvent('po:release')
	end
end)

RegisterNetEvent('pis:warn')
AddEventHandler('pis:warn', function()
	if stopped then
		if speech == "Normal" then
			officerSays = {"You can go, but don't do it again.","Don't make me pull you over again!","Have a good day. Be a little more careful next time.","I'll let you off with a warning this time."}
		else
			officerSays = {"Don't do that again.","Don't make me pull you over again!","I'll let you go this time.","I'll let you off with a warning this time."}
		end
		if driverAttitude < 50 then
			driverResponseWarn = {"Thanks.","Thank you officer.","Okay, thank you.","Okay, thank you officer.","Thank you so much!","Alright, thanks!","Yay! Thank you!","I'll be more careful next time!","Sorry about that!"}
		elseif driverAttitude > 50 and driverAttitude < 80 then
			driverResponseWarn = {"Thanks... I guess...","Yeah, whatever.","Finally.","Ugh..",}
		elseif driverAttitude > 80 then
			driverResponseWarn = {"Uh huh, bye.","Yeah, whatever.","Finally.","Ugh..","Prick."}
		end
		ShowNotification("~o~Officer:~w~ " .. officerSays[math.random(#officerSays)])
		Wait(2000)
		ShowNotification("~b~Driver:~w~ " .. driverResponseWarn[math.random(#driverResponseWarn)])
		Wait(2000)
		TriggerEvent('po:release')
	end
end)

RegisterNetEvent('pis:drunk:q')
AddEventHandler('pis:drunk:q', function()
	ShowNotification("~o~Officer:~w~ " .. "Have you had anything to drink today?")
	if drunk == true then
		driverResponseDrunk = {"*Burp*", "What's a drink?", "No.", "You'll never catch me alive!", "Never", "Nope, i don't drink Ossifer", "Maybe?", "Just a few."}
	else
		driverResponseDrunk = {"No, sir", "I dont drink.", "Nope.", "No.", "Only 1.", "Yes... a water and 2 orange juices."}
	end
	ShowNotification("~b~Driver:~w~ " .. driverResponseDrunk[math.random(#driverResponseDrunk)])
end)

RegisterNetEvent('pis:loc:q')
AddEventHandler('pis:loc:q', function()
	ShowNotification("~o~Officer:~w~ " .. "Where are you coming from today?")
	
	Wait(1000)
	
	driverResponseLocation = {"From work.", "From home.", "Los Santos.", "My girlfriends house.", "My boyfriends house.", "The Yellow Jacket bar.", "Pop's Dinner in Paleto Bay.", "The Vanilla Unicorn.", "A friends house."}
	
	ShowNotification("~b~Driver:~w~ " .. driverResponseLocation[math.random(#driverResponseLocation)])
end)

RegisterNetEvent('pis:locs:q')
AddEventHandler('pis:locs:q', function()
	ShowNotification("~o~Officer:~w~ " .. "Where are you heading to?")
	
	Wait(1000)
	
	driverResponseLocation = {"To work.", "To home.", "No where, I'm just driving around.", "A friends house."}
	
	ShowNotification("~b~Driver:~w~ " .. driverResponseLocation[math.random(#driverResponseLocation)])
end)

RegisterNetEvent('pis:stop:q')
AddEventHandler('pis:stop:q', function()
	ShowNotification("~o~Officer:~w~ " .. "Do you know why I stopped you?")
	
	Wait(1000)
	
	driverResponseLocation = {"No officer.", "Speeding?", "I have no clue.", "Because you have nothing better to do.", "Why are you asking me; did you already forget?", "Cause I was the one driving the slowest with the other cars.", "No idea,sir.", "Because I'm Black.", "Technically, I pulled myself over.", "Yes, but do you?", "No idea, sir, give me a minute and my anxiety-riddled brain will come up with something.", "I don't answer questions.", "Am I being detained?"}
	
	ShowNotification("~b~Driver:~w~ " .. driverResponseLocation[math.random(#driverResponseLocation)])
end)

RegisterNetEvent('pis:drug:q')
AddEventHandler('pis:drug:q', function()
	ShowNotification("~o~Officer:~w~ " .. "Have you consumed any drugs recently?")
	if drugnum_cannabis > 85 or drugnum_cocaine > 90 or drugnum_heroin > 90 then
		driverResponseDrug = {"What is life?", "Who is me?", "NoOOOooo.", "Is that a UNICORN?!", "If I've done the what?", "WHAT DRUGS? I DONT KNOW KNOW ANYTHING ABOUT DRUGS.", "What's a drug?","I don't answer questions"}
	else
		driverResponseDrug = {"No, sir", "I don't do that stuff.", "Nope.", "No.", "Never"}
	end
	ShowNotification("~b~Driver:~w~ " .. driverResponseDrug[math.random(#driverResponseDrug)])
end)

RegisterNetEvent('pis:illegal:q')
AddEventHandler('pis:illegal:q', function()
	ShowNotification("~o~Officer:~w~ " .. "Is there anything illegal in the vehicle?")
	driverResponseIllegal = {"No, sir", "Not that I know of.", "Nope.", "No.", "Apart from the 13 dead hookers in the back.. No.", "Maybe? But most probably not.", "I sure hope not","I don't answer questions"}
	ShowNotification("~b~Driver:~w~ " .. driverResponseIllegal[math.random(#driverResponseIllegal)])
end)

RegisterNetEvent('pis:search:q')
AddEventHandler('pis:search:q', function()
	ShowNotification("~o~Officer:~w~ " .. "Would you mind if i search your vehicle?")
	driverResponseSearch = {"I'd prefer you not to...", "I'll have to pass on that","Uuuh... Y- No..","Go ahead. For the record its not my car","No","No, what crime am I suspected of committing?"}
	ShowNotification("~b~Driver:~w~ " .. driverResponseSearch[math.random(#driverResponseSearch)])
end)

RegisterNetEvent('pis:hello')
AddEventHandler('pis:hello', function()
	local player = GetPlayerPed(-1)

	RequestAnimDict("gestures@m@sitting@generic@casual")
	while not HasAnimDictLoaded("gestures@m@sitting@generic@casual") do
				Citizen.Wait(100)
			end
			
	if speech == "Normal" then
		PlayAmbientSpeechWithVoice(stoppedDriver, "KIFFLOM_GREET", "s_m_y_sheriff_01_white_full_01", "SPEECH_PARAMS_FORCE_SHOUTED", 0)
		TaskPlayAnim(player, "gestures@m@standing@casual", "gesture_hello", 8.0, -8, -1, 49, 0, 0, 0, 0)
		Citizen.CreateThread(function()
			Citizen.Wait(1000)
			ClearPedTasks(player)
		end)
	else
		PlayAmbientSpeechWithVoice(stoppedDriver, "GENERIC_INSULT_HIGH", "s_m_y_sheriff_01_white_full_01", "SPEECH_PARAMS_FORCE_SHOUTED", 0)
		TaskPlayAnim(player, "gestures@m@standing@casual", "gesture_what_hard", 8.0, -8, -1, 49, 0, 0, 0, 0)
		Citizen.CreateThread(function()
			Citizen.Wait(1000)
			ClearPedTasks(player)
		end)
	end
end)


RegisterCommand("flee", function()
ShowNotification("*flee debug*")
TriggerEvent('po:flee')
end)

RegisterCommand("pit", function()
	if stoppedVeh ~= nil then
		Citizen.CreateThread(function()
		if fleeing == true then
			pitting = false
			local vehicleHash = GetEntityModel(stoppedVeh)
			ShowNotification("~b~Officer:~w~ Requesting permission to pit the ~y~"..GetLabelText(GetDisplayNameFromVehicleModel(vehicleHash)).."~w~.")
			pitWait = math.random(3,10)
			Wait(pitWait * 1000)
			ShowNotification("~b~Permission to pit ~g~GRANTED~w~.")
			pitting = true
			while pitting do
				Citizen.Wait(0)
				if GetEntitySpeed(stoppedVeh) < 5 then
				stopped = true
				SetVehicleUndriveable(stoppedVeh, true)
				SetVehicleEngineHealth(stoppedVeh, -4000)
				mimicking = false
				lockedin = false
				Wait(1000)
				ShowNotification("~b~Pit ~g~SUCCESSFUL~w~.")
				pitting = false
				end
				end
			end
		end)
	end
end)

RegisterNetEvent('po:release')
AddEventHandler('po:release', function()
	stopped = false
	mimicking = false
	lockedin = false
	SetVehicleEngineOn(stoppedVeh, true, false, true)
	--SetVehicleFuelLevel(targetVeh, 100)
	RemovePedFromGroup(stoppedDriver)
	stoppedDriver = nil
	--TaskVehicleDriveWander(stoppedDriver, stoppedVeh, 40, 447);
	ShowNotification( "Vehicle released" )
	driverName = nil
	vehPlateNum = nil
end)

RegisterNetEvent('po:lock')
AddEventHandler('po:lock', function()
	lockedin = true
	notification = true
	targetBlip = AddBlipForEntity(targetVeh)
end)

RegisterNetEvent('po:unlock')
AddEventHandler('po:unlock', function()
	lockedin = false
	notification = false
	RemoveBlip(targetBlip)
end)

RegisterNetEvent('po:stop')
AddEventHandler('po:stop', function()
	fleeing = false
	stopped = true
	mimicking = false
	lockedin = false
	ALPR(targetVeh)
end)

DensityMultiplier = 0.200
Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(0)
	    SetVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetPedDensityMultiplierThisFrame(DensityMultiplier)
	    SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier, DensityMultiplier)
	end
end)

RegisterNetEvent('po:flee')
AddEventHandler('po:flee', function()
	stopped = false
	mimicking = false
	lockedin = false
	fleeing = true
	if IsVehicleSeatFree(stoppedVeh,-1) then
		TaskShuffleToNextVehicleSeat(stoppedDriver, stoppedVeh)
		Citizen.Wait(2000)
	end
	SetVehicleEngineOn(stoppedVeh, true, false, true)
	SetVehicleCanBeUsedByFleeingPeds(stoppedVeh, true)
	willRam = math.random(5)
	if willRam == 5 then
		TaskVehicleTempAction(stoppedDriver, stoppedVeh, 28, 3000)
	end
	Citizen.Wait(3000)
	
	TaskVehicleTempAction(stoppedDriver, stoppedVeh, 32, 30000)
	--TaskReactAndFleePed(stoppedVeh, player)
	TaskReactAndFleePed(stoppedDriver, player)
end)

RegisterNetEvent('po:shoot')
AddEventHandler('po:shoot', function()
	stopped = false
	mimicking = false
	lockedin = false
	local pistol = GetHashKey("WEAPON_COMBATPISTOL")
	TaskLeaveAnyVehicle(stoppedDriver)
	Wait (1000)
	SetEntityAsMissionEntity(stoppedDriver, true, true)
	GiveWeaponToPed(stoppedDriver, pistol, 1000, 0, 1)
	TaskShootAtEntity(stoppedDriver, player, 100000000, GetHashKey('FIRING_PATTERN_FULL_AUTO'))
end)

RegisterCommand("lastalpr", function()
	ALPR(targetVeh)
end)

RegisterNetEvent('lastalpr')
AddEventHandler('lastalpr', function()
	ALPR(targetVeh)
end)

RegisterCommand("info", function()
	TriggerEvent('getInfo')
	ShowNotification("~w~Reg. Owner: ~y~" .. rregOwner .. "~w~\nReg. Year: ~y~" .. rregYear .. "~w~\nFlags: ~y~" .. rflags)
end)

RegisterNetEvent('getInfo')
AddEventHandler('getInfo', function()
	rfname = fnamesar[math.random(#fnamesar)]
	rsname = snamesar[math.random(#snamesar)]
	rdob_y = math.random(1949, 1999)
	rdob_m = math.random(1, 12)
	rdob_d = math.random(1, 29)
	rregOwner = (rfname .. " " .. rsname)
	rfullDob = (rdob_m .. "/" .. rdob_d .. "/" .. rdob_y)
	rdriverName = rregOwner
	rfullDriverDob = rfullDob
	rregYear = math.random(1990, 2018)
	
	
	rflags = "~g~NONE"
	rInsuredRand = math.random(8)
	rRegisteredRand = math.random(12)
	rStolenRand = math.random(24)
	
	if rInsuredRand == 8 then
		rflags = "~r~UNINSURED"
	elseif rRegisteredRand == 12 then
		rflags = "~r~UNREGISTERED"
		rregYear = "~r~UNREGISTERED"
	elseif rStolenRand == 24 then
		rflags = "~r~STOLEN"
		risStolen = true
	end	
							
	if risStolen == true then
		rdfname = fnamesar[math.random(#fnamesar)]
		rdsname = snamesar[math.random(#snamesar)]
		rddob_y = math.random(1949, 1999)
		rddob_m = math.random(1, 12)
		rddob_d = math.random(1, 29)
		rdriverName = (rdfname .. " " .. rdsname)
		rfullDriverDob = (rdob_m .. "/" .. rdob_d .. "/" .. rdob_y)
	end
	
	rpedFlags = "~g~NONE";
	roffRand = math.random(100)
	if  roffRand > 75  then
		rpedFlags = offense[math.random(#offense)] 
	end
	rcitations = math.random(-5, 6)
	if rcitations < 0 then
		rcitations = 0
	end
	
	
	
	rdrugnum_cannabis = math.random(100)
	rdrugnum_cocaine = math.random(100)
	rdrugnum_heroin = math.random(100)
	rcannabis = "~g~Negative"
	rcocaine = "~g~Negative"
	rheroin = "~g~Negative"
	if rdrugnum_cannabis > 85 then
		rcannabis = "~r~Positive"
	end
	if rdrugnum_cocaine > 90 then
		rcocaine = "~r~Positive"
	end
	if rdrugnum_heroin > 90 then
		rcocaine = "~r~Positive"
	end
	
end)

RegisterNetEvent('getFlags')
AddEventHandler('getFlags', function()
	TriggerEvent('getInfo')
	ShowNotification("~w~Reg. Owner: ~y~" .. rregOwner .. "~w~\nReg. Year: ~y~" .. rregYear .. "~w~\nFlags: ~y~" .. rflags)
end)

RegisterNetEvent('radio')
AddEventHandler('radio', function()
    Citizen.CreateThread(function()
		loadAnimDict("random@arrests")
        TaskPlayAnim(player, "random@arrests", "generic_radio_enter", 1.5, 2.0, -1, 50, 2.0, 0, 0, 0 )
		Citizen.Wait(6000)
		ClearPedTasks(player)
    end)
end)

RegisterNetEvent('search')
AddEventHandler('search', function()
	local search = "PROP_HUMAN_BUM_BIN"
	if not IsPedInAnyVehicle(player) then
		TaskStartScenarioInPlace(player, search, 0, 1)
		Wait(5000)
		ClearPedTasks(player)
	end
end)		

RegisterNetEvent('anim:mimic')
AddEventHandler('anim:mimic', function()
end)

RegisterNetEvent('ticket')
AddEventHandler('ticket', function()
	local ticket = "CODE_HUMAN_MEDIC_TIME_OF_DEATH"
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(GetPlayerPed(-1), ticket, 0, 1)
		emotePlaying = true
	end
end)

Citizen.CreateThread(function()
    while true do
        if emotePlaying then
            if (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
                cancelEmote() -- Cancels the emote if the player is moving
            end
        end
        Citizen.Wait(0)
    end
end)

-- F U N C T I O N S --
	
	-- Gets a vehicle in a certain direction
	-- Credit to Konijima
function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, player, 0 )
    local _, _, _, _, targetVeh = GetRaycastResult( rayHandle )
    return targetVeh
end

	-- Shows a notification on the player's screen 
function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

function ShowHelp()
	SetTextComponentFormat("STRING")
	AddTextComponentString("Activate your ~r~siren~w~ to stop the vehicle!")
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
	notification = true
	Wait (10000)
	notification = false
end

function ShowMenuHelp()
	SetTextComponentFormat("STRING")
	AddTextComponentString("Press ~b~G ~w~to talk to the driver.")
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
	notification = true
	Wait (10000)
	notification = false
end

function ALPR(vehicle)
	local vehicleHash = GetEntityModel(vehicle)
	local numPlate = GetVehicleNumberPlateText(vehicle)
		
	ShowNotification("Getting vehicle information...")
	Wait(2000)
	ShowNotification("~b~SACIC Database:~w~\nPlate: ~y~" .. numPlate .. "~w~\nModel: ~y~"..GetLabelText(GetDisplayNameFromVehicleModel(vehicleHash)) .. "~w~\nVehicle class: ~y~" .. carType[GetVehicleClass(vehicle)])
end

local emotePlaying = IsPedActiveInScenario(GetPlayerPed(-1))
local emotePlaying = false

function cancelEmote() -- Cancels the emote
    ClearPedTasks(GetPlayerPed(-1))
    emotePlaying = false
end		

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 0 )
	end
end