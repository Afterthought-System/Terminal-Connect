--[[

Termial Connect

Descrption: The purpose of this script is to connect Terminal, our CAD/MDT system with FiveM allowing users to utilize different commands including /911 and /panic.

Instructions: You can find documentation for our API and script at: https://docs.afterthought-system.com/developers/introduction-to-our-api
**Please don't edit the code in this script. If you ask for assistance, we will be going on the assumption you haven't touched the code below.**

Author: Afterthought System, LLC

© Copyright 2022 by Afterthought System, LLC. All rights reserved.

]]

local server = 'SERVER ID HERE'
local secret = 'SEVER SECRET KEY HERE'

RegisterServerEvent("911Send")
RegisterServerEvent("PanicSend")

RegisterCommand("911", function(source, args, rawCommand)
	local name = GetPlayerName(source)
	TriggerClientEvent("911", source, name)
end, false)

RegisterCommand("panic", function(source, args, rawCommand)
	local name = GetPlayerName(source)
	TriggerClientEvent("Panic", source, name)
end, false)

AddEventHandler("911Send", function(street, cross, name)
	PerformHttpRequest('https://terminal.afterthought-system.com/api/1.1/wf/911', function(err, text, headers)
		
	end, 'POST', json.encode({server = server,callerName = name,street = street,cross = cross, secret = secret}), { ["Content-Type"] = 'application/json' })
end)

AddEventHandler("PanicSend", function(street, cross, name)
	PerformHttpRequest('https://terminal.afterthought-system.com/api/1.1/wf/panic', function(err, text, headers)
		
	end, 'POST', json.encode({server = server,name = name,street = street,cross = cross}), { ["Content-Type"] = 'application/json' })
end)
