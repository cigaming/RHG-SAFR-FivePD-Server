





AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	
	
	
	if message == "/callout sandyknife" then
		CancelEvent()
		--------------
		TriggerClientEvent('pis:knifeCallout', s)
		Wait(1000)
		TriggerClientEvent('pis:notification', -1)
		
		elseif message == "/callout groverob" then
		CancelEvent()
		--------------
		TriggerClientEvent('pis:groverob', s)
		Wait(1000)
		TriggerClientEvent('pis:notification', -1)
		
		elseif message == "/autocall" then
		
		if enable == true then
		enable = false
		else
		enable = true
		end
		
		  while true do
		  
		  if enable == true then	
		  
		  Chance = math.random(1,7)
		  
			if Chance == 1 then
    
			
	
			CancelEvent()
		--------------
		TriggerClientEvent('pis:groverob', s)
		Wait(1000)
		TriggerClientEvent('pis:robg', -1)
		TriggerClientEvent('pis:notification', -1)
		
		end
		
		if Chance == 2 then
    
		
	
			CancelEvent()
		TriggerClientEvent('pis:hwyshots:spawn', s)
		Wait(2000)
		TriggerClientEvent('pis:hwyshots', -1)
		TriggerClientEvent('pis:notification', -1)
		end
		
		if Chance == 3 then
    
			
	
			CancelEvent()
		TriggerClientEvent('pis:tresss', s)
		Wait(2000)
		TriggerClientEvent('pis:tress', -1)
		TriggerClientEvent('pis:notification', -1)
		
		end
		
		if Chance == 4 then
    
			
	
			CancelEvent()
		TriggerClientEvent('pis:pros', s)
		Wait(2000)
		TriggerClientEvent('pis:pross', -1)
		TriggerClientEvent('pis:notification', -1)
		
		end
		
		if Chance == 5 then
    
			
	
			CancelEvent()
		TriggerClientEvent('pis:leaves:spawn', s)
		Wait(2000)
		TriggerClientEvent('pis:leaves', -1)
		TriggerClientEvent('pis:notification', -1)
		
		end
		
		if Chance == 6 then
    
			
	
			CancelEvent()
		--------------
		TriggerClientEvent('pis:mirrorknifeCallout', s)
		Wait(2000)
		TriggerClientEvent('pis:mirrorknifeCallouts', -1)
		TriggerClientEvent('pis:notification', -1)	
		
		end
		
		if Chance == 7 then
    
			
	
			CancelEvent()
		--------------
		TriggerClientEvent('pis:crash:spawn', s)
		Wait(1000)
		TriggerClientEvent('pis:crash', -1)
		TriggerClientEvent('pis:notification', -1)
		
		end
		
		
		end
		Wait(450000)
				end
		
		
		
		
	elseif message == "/callout test" then
			CancelEvent()
		TriggerClientEvent('pis:leaves:spawn', s)
		Wait(2000)
		TriggerClientEvent('pis:leaves', -1)
		TriggerClientEvent('pis:notification', -1)
	elseif message == "/callout hwy1" then
		CancelEvent()
		--------------
		TriggerClientEvent('pis:aVeh', s)
		Wait(1000)
		TriggerClientEvent('pis:notification', -1)
	elseif message == "/callout sandyshoplift" then
		CancelEvent()
		--------------
		TriggerClientEvent('pis:shoplifting:spawn', s)
		Wait(2000)
		TriggerClientEvent('pis:shoplifting', -1)
		TriggerClientEvent('pis:notification', -1)
	elseif message == "/callout sandyfight" then
		CancelEvent()
		--------------
		TriggerClientEvent('pis:fight:spawn', s)
		Wait(2000)
		TriggerClientEvent('pis:fight', -1)
		TriggerClientEvent('pis:notification', -1)
	elseif message == "/callout paletofight" then
		CancelEvent()
		--------------
		TriggerClientEvent('pis:Paletofight:spawn', s)
		Wait(2000)
		TriggerClientEvent('pis:Paletofight', -1)
		TriggerClientEvent('pis:notification', -1)
	elseif message == "/callout sandyshots" then
		CancelEvent()
		--------------
		TriggerClientEvent('pis:shots:spawn', s)
		Wait(2000)
		TriggerClientEvent('pis:shots', -1)
		TriggerClientEvent('pis:notification', -1)
		
	elseif message == "/callout hwyshots" then
		CancelEvent()
		--------------
		TriggerClientEvent('pis:hwyshots:spawn', s)
		Wait(2000)
		TriggerClientEvent('pis:hwyshots', -1)
		TriggerClientEvent('pis:notification', -1)
	elseif message == "/callout sandycrazy" then
		CancelEvent()
		--------------
		TriggerClientEvent('pis:crazy:spawn', s)
		Wait(2000)
		TriggerClientEvent('pis:crazy', -1)
		TriggerClientEvent('pis:notification', -1)
	elseif message == "/callout sandyarmed" then
		CancelEvent()
		--------------
		TriggerClientEvent('pis:weapon:spawn', s)
		Wait(2000)
		TriggerClientEvent('pis:weapon', -1)
		TriggerClientEvent('pis:notification', -1)
	elseif message == "/id" then
		
		--------------
		TriggerClientEvent('pis:footid', s)
		Wait(2000)
		
	elseif message == "/callout cityknife" then
		
		CancelEvent()
		--------------
		TriggerClientEvent('pis:mirrorknifeCallout', 1)
		Wait(2000)
		TriggerClientEvent('pis:notification', -1)		
		
	end
end)