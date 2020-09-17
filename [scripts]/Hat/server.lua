--[[Written by Monty Piper for Compton RP
	Join our discord http://discord.gg/ERYZtea
	commands are /hat /sg /gloves /mask /hood
	Any question, comments, or concerns contact
	me via discord :)                      ]]--

--Sunglasses on
TriggerEvent('es:addCommand', 'sg', function(source, args, user)
	TriggerClientEvent('sung', source, {})
end, {help = "Put on your sunglasses"})
