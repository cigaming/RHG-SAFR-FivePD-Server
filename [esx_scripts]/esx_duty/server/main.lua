ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('duty:onoff')
AddEventHandler('duty:onoff', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade
    local labal = xPlayer.job.label

    local name = getIdentity(_source)
    fal = name.firstname .. " " .. name.lastname
    
    if job == 'police'  or job == 'fire' or job == 'ambulance' or job == 'mecano' then
        xPlayer.setJob('off' ..job, grade)
        TriggerClientEvent('esx:showNotification', _source, _U('offduty'))

        TriggerClientEvent('chat:addMessage', -1, { template = '<div class="chat-message system"><b>Services {0} : </b> {1}</div>', args = { fal, "is now Off Duty as "..labal  } })

    elseif job == 'offpolice' then
        xPlayer.setJob('police', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))

        TriggerClientEvent('chat:addMessage', -1, { template = '<div class="chat-message system"><b>Services {0} : </b> {1}</div>', args = { fal, "is now On Duty as Police" } })
    elseif job == 'offfire' then
        xPlayer.setJob('fire', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))

        TriggerClientEvent('chat:addMessage', -1, { template = '<div class="chat-message system"><b>Services {0} : </b> {1}</div>', args = { fal, "is now On Duty as Fire & EMS" } })
    elseif job == 'offambulance' then
        xPlayer.setJob('ambulance', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))

        TriggerClientEvent('chat:addMessage', -1, { template = '<div class="chat-message system"><b>Services {0} : </b> {1}</div>', args = { fal, "is now On Duty as Paramedic" } })
    elseif job == 'offmecano' then
        xPlayer.setJob('mecano', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))

        TriggerClientEvent('chat:addMessage', -1, { template = '<div class="chat-message system"><b>Services {0} : </b> {1}</div>', args = { fal, "is now On Duty as AA Mechanic" } })
    end

end)

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
			
		}
	else
		return nil
	end
end