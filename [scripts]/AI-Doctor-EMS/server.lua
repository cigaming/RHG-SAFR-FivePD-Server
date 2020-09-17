Config = {}
Config.Ucret = 2000

local CopsConnected  = 0
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'ambulance' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()


ESX.RegisterServerCallback('ai_mechanic:doktor', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb(CopsConnected)
end)

RegisterServerEvent('ai_mechanic:odeme')
AddEventHandler('ai_mechanic:odeme', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
		TriggerClientEvent('knb:mech', source)
end)

local emsCommand = 'ems' -- don't add a "/" here!

RegisterCommand(emsCommand, function(source)
    TriggerEvent('ai_mechanic:odeme', source)
    end)
	
TriggerEvent('chat:addSuggestion', '/' .. emsCommand, 'request AI EMS help - only if your dead.')
