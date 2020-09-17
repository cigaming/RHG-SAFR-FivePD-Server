TriggerEvent('es:addCommand', 'huk', function(source, args, user)
	TriggerClientEvent('KneelHU', source, {})
end, {help = "Get down on your knees and put your hands on your head"})

-- SERVER SIDE CODE --
AddEventHandler("chatMessage", function(source, n, message)
    if message == "/hu" then
        TriggerClientEvent("csrp_Handsup", source)
    end
    CancelEvent()
end)

-- Hand on Radio Comand
AddEventHandler( 'chatMessage', function( source, n, msg )  

    msg = string.lower( msg )
    
    if ( msg == "/r" ) then 
    
        CancelEvent() 

        TriggerClientEvent( 'Radio', source )
    end
end )