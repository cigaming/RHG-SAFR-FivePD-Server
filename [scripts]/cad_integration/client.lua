


RegisterNetEvent("911Location")
AddEventHandler("911Location", function(name)
		x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		lastStreet, lastCross = GetStreetNameAtCoord(x, y, z)
        lastStreetName = GetStreetNameFromHashKey(lastStreet)
		lastCrossStreet = GetStreetNameFromHashKey(lastCross)
	    TriggerServerEvent("911locationUpdate", lastStreetName, lastCrossStreet, name)		
		drawNotification("CHAR_CALL911", 0, "An operator has been alerted, please standby for operator.", "San Andreas Communications", "911 Emergency Line")		
end)

RegisterNetEvent("Location")
AddEventHandler("Location", function(name)
		x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		lastStreet, lastCross = GetStreetNameAtCoord(x, y, z)
        lastStreetName = GetStreetNameFromHashKey(lastStreet)
		lastCrossStreet = GetStreetNameFromHashKey(lastCross)
	    TriggerServerEvent("locationUpdate", lastStreetName, lastCrossStreet, name)			
end)

function drawNotification(picture, icon, message, title, subtitle)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    SetNotificationMessage(picture, picture, true, icon, title, subtitle)
end