--[[

Termial Connect

Descrption: The purpose of this script is to connect Terminal, our CAD/MDT system with FiveM allowing users to utilize different commands including /911 and /panic.

Author: Afterthought System, LLC

© Copyright 2022 by Afterthought System, LLC. All rights reserved.

]]

-- Nothing you need to do here, everything you need to edit is in server.lua. Thanks!
RegisterNetEvent("911")
RegisterNetEvent("Panic")

AddEventHandler("911", function(name)
		x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		lastStreet, lastCross = GetStreetNameAtCoord(x, y, z)
        lastStreetName = GetStreetNameFromHashKey(lastStreet)
		lastCrossStreet = GetStreetNameFromHashKey(lastCross)
	    TriggerServerEvent("911Send", lastStreetName, lastCrossStreet, name)		
		drawNotification("CHAR_CALL911", 0, "An operator has been alerted, please standby for operator.", "Emergency Communications", "911 Emergency Line")		
end)


AddEventHandler("Panic", function(name)
		x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		lastStreet, lastCross = GetStreetNameAtCoord(x, y, z)
        lastStreetName = GetStreetNameFromHashKey(lastStreet)
		lastCrossStreet = GetStreetNameFromHashKey(lastCross)
	    TriggerServerEvent("PanicSend", lastStreetName, lastCrossStreet, name)	
		drawNotification("CHAR_CALL911", 0, "Dispatch has been notified.", "Emergency Communications", "Emergency Line")		
end)

function drawNotification(picture, icon, message, title, subtitle)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    SetNotificationMessage(picture, picture, true, icon, title, subtitle)
end