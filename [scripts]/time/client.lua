-- CONFIG --
local showCompass = true
local displayTime = true
local useMilitaryTime = true

-- en for english translate
-- ru for russian translate
local lang = 'en' 

local timeAndDateString = nil
local hour
local minute

-- CODE --
function drawTxt2(x,y ,width,height,scale, text, r,g,b,a)
        SetTextFont(6)
        SetTextProportional(1)
        SetTextScale(0.0, 0.48)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(x, y)
end

local lastStreet = nil
local zones_ru = { ['AIRP'] = "МАЛС", ['ALAMO'] = "Аламо-Си", ['ALTA'] = "Альта", ['ARMYB'] = "Форт Занкудо", ['BANHAMC'] = "Бэнхэм Драйв", ['BANNING'] = "Бэннинг", ['BEACH'] = "Веспуччи-Бич", ['BHAMCA'] = "Каньон Бэнхэм", ['BRADP'] = "Перевал Брэддока", ['BRADT'] = "Тоннель Брэддока", ['BURTON'] = "Бертон", ['CALAFB'] = "Калафиа-Бридж", ['CANNY'] = "Каньон Ратон", ['CCREAK'] = "Кэссиди-Крик", ['CHAMH'] = "Чемберлен-Хиллз", ['CHIL'] = "Вайнвуд-Хиллз", ['CHU'] = "Чумаш", ['CMSW'] = "Заповедник Горы Чилиад", ['CYPRE'] = "Сайпресс-Флэтс", ['DAVIS'] = "Дэвис", ['DELBE'] = "Дель-Перро-Бич", ['DELPE'] = "Дель-Перро", ['DELSOL'] = "Ла-Пуэрта", ['DESRT'] = "Пустыня Гранд-Сенора", ['DOWNT'] = "Центр", ['DTVINE'] = "Центр Вайнвуд", ['EAST_V'] = "Западный Вайнвуд", ['EBURO'] = "Эль-Бурро-Хайтс", ['ELGORL'] = "Маяк Эль-Гордо", ['ELYSIAN'] = "Элизиан-Айленд", ['GALFISH'] = "Галилео", ['GOLF'] = "Гольф-Клуб", ['GRAPES'] = "Грейпсид", ['GREATC'] = "Грейт-Чапаррал", ['HARMO'] = "Хармони", ['HAWICK'] = "Хавик", ['HORS'] = "Гоночная трасса Вайнвуда", ['HUMLAB'] = "Лаборатория Humane Labs and Research", ['JAIL'] = "Тюрьма Болингброук", ['KOREAT'] = "Маленький Сеул", ['LACT'] = "Лэнд-Экт-Резервуар", ['LAGO'] = "Лаго-Занкудо", ['LDAM'] = "Лэнд-Экт-Дэм", ['LEGSQU'] = "Площадь Легиона", ['LMESA'] = "Ла-Меса", ['LOSPUER'] = "Ла-Пуэрта", ['MIRR'] = "Миррор-Парк", ['MORN'] = "Морнингвуд", ['MOVIE'] = "Киностудия Richards Majestic", ['MTCHIL'] = "Гора Чилиад", ['MTGORDO'] = "Гора Гордо", ['MTJOSE'] = "Гора Джосайя", ['MURRI'] = "Мурьета-Хайтс", ['NCHU'] = "Северный Чумаш", ['NOOSE'] = "Центр Н.У.П.", ['OCEANA'] = "Тихий Океан", ['PALCOV'] = "Бухта Палето", ['PALETO'] = "Палето-Бэй", ['PALFOR'] = "Лес Палето", ['PALHIGH'] = "Нагорья Паламино", ['PALMPOW'] = "Электростанция Палмер-Тэйлор", ['PBLUFF'] = "Пасифик-Блаффс", ['PBOX'] = "Пиллбокс-Хилл", ['PROCOB'] = "Прокопио-Бич", ['RANCHO'] = "Ранчо", ['RGLEN'] = "Ричман-Глен", ['RICHM'] = "Ричман", ['ROCKF'] = "Рокфорд-Хиллз", ['RTRAK'] = "Трасса Redwood Lights", ['SANAND'] = "Сан-Андреас", ['SANCHIA'] = "Сан-Шаньский Горный Хребет", ['SANDY'] = "Сэнди-Шорс", ['SKID'] = "Мишн-Роу", ['SLAB'] = "Стэб-Сити", ['STAD'] = "Арена Maze Bank", ['STRAW'] = "Строберри", ['TATAMO'] = "Татавиамские горы", ['TERMINA'] = "Терминал", ['TEXTI'] = "Текстайл-Сити", ['TONGVAH'] = "Тонгва-Хиллз", ['TONGVAV'] = "Долина Тонгва", ['VCANA'] = "Каналы Веспуччи", ['VESP'] = "Веспуччи", ['VINE'] = "Вайнвуд", ['WINDF'] = "Ветряная Ферма Ron Alternates", ['WVINE'] = "Восточный Вайнвуд", ['ZANCUDO'] = "Река Занкудо", ['ZP_ORT'] = "Порт Южного Лос-Сантоса", ['ZQ_UAR'] = "Дэвис-Кварц" }

local zones_en = { ['AIRP'] = "LSIA", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
        local pos = GetEntityCoords(GetPlayerPed(-1))
        
     --   if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
            
            if(GetStreetNameFromHashKey(var1) and GetNameOfZone(pos.x, pos.y, pos.z))then
                
                if lang == 'en'  then
                    if(zones_en[GetNameOfZone(pos.x, pos.y, pos.z)] and tostring(GetStreetNameFromHashKey(var1)))then
                        drawTxt2(0.160, 0.853, 1.0,1.0,0.4, zones_en[GetNameOfZone(pos.x, pos.y, pos.z)], 255, 255, 255, 255)
                    end
                elseif lang == 'ru' then
                    if(zones_ru[GetNameOfZone(pos.x, pos.y, pos.z)] and tostring(GetStreetNameFromHashKey(var1)))then
                        drawTxt2(0.015, 0.745, 1.0,1.0,0.4, zones_ru[GetNameOfZone(pos.x, pos.y, pos.z)], 255, 255, 255, 255)
                    end
                else
                    print("Invalid language specified in client.lua:6! Select either 'ru' or 'en'.")
                end
            end
      --  end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        --if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
        
        x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        lastStreet = GetStreetNameAtCoord(x, y, z)
        lastStreetName = GetStreetNameFromHashKey(lastStreet)


        SetTextFont(6)
        SetTextProportional(1)
        SetTextScale(0.0, 0.48)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")

        if showCompass then
        	compass = getCardinalDirectionFromHeading(GetEntityHeading(GetPlayerPed(-1)))
        	lastStreetName = compass .. " | " .. lastStreetName  -- Example: N | Spanish Ave.
        end

        AddTextComponentString(lastStreetName)
        DrawText(0.160, 0.880)
   -- end
end
end)

Citizen.CreateThread(function()
	while true do
        Wait(1)
        
      --  if IsPedInAnyVehicle(GetPlayerPed(-1), true) then

		timeAndDateString = ""
		
		if displayTime == true then
			CalculateTimeToDisplay()
			timeAndDateString = timeAndDateString .. "Time: " .. hour .. ":" .. minute  -- Example: Time: 00:00
		end
		
                 SetTextFont(6)
                 SetTextProportional(1)
                 SetTextScale(0.0, 0.48)
                 SetTextColour(255, 255, 255, 255)
                 SetTextDropshadow(0, 0, 0, 0, 255)
                 SetTextEdge(1, 0, 0, 0, 255)
                 SetTextDropShadow()
                 SetTextOutline()
                 SetTextEntry("STRING")
		
		AddTextComponentString(timeAndDateString)
		DrawText(0.160, 0.825)
   -- end
end
end)


-- Thanks @marxy
function getCardinalDirectionFromHeading(heading)
    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then
        if lang == 'en' then
            return "N" -- North
        elseif lang == 'ru' then
            return "С" -- North
        else
            return "~r~Err"
        end
    elseif (heading >= 45 and heading < 135) then
        if lang == 'en' then
            return "E" -- East
        elseif lang == 'ru' then
            return "В" -- East
        else
            return "~r~Err"
        end
    elseif (heading >=135 and heading < 225) then
        if lang == 'en' then
            return "S" -- South
        elseif lang == 'ru' then
            return "Ю" -- South
        else
            return "~r~Err"
        end
    elseif (heading >= 225 and heading < 315) then
        if lang == 'en' then
            return "W" -- West
        elseif lang == 'ru' then
            return "З" -- West
        else
            return "~r~Err"
        end
    end
end

function CalculateTimeToDisplay()
	hour = GetClockHours()
	minute = GetClockMinutes()

	if useMilitaryTime == false then
		if hour == 0 or hour == 24 then
			hour = 12
		elseif hour >= 13 then
			hour = hour - 12
		end
	end

	if hour <= 9 then
		hour = "0" .. hour
	end
	if minute <= 9 then
		minute = "0" .. minute
	end
end
