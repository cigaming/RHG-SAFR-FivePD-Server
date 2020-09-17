# esx_handcuffs
# Example of implementation (esx_policejob)
# THIS RESOURCE WAS MODIFIED BY KRIZFROST
Client
```
    if data2.current.value == 'handcuff' then
      TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(player))
    end

    if data2.current.value == 'unhandcuff' then
      TriggerServerEvent('esx_policejob:unhandcuff', GetPlayerServerId(player))
    end
 ```
 
Server
 ```
    RegisterServerEvent('esx_policejob:handcuff')
    AddEventHandler('esx_policejob:handcuff', function(source)
      TriggerClientEvent('esx_handcuffs:cuff', source)
    end)

    RegisterServerEvent('esx_policejob:unhandcuff')
    AddEventHandler('esx_policejob:unhandcuff', function(source)
     TriggerClientEvent('esx_handcuffs:uncuff', source)
    end)
```

# Based on:
# https://github.com/TomGrobbe/Realistic-Handcuffs-FiveM
# as welll as 
# https://github.com/scorpio686/esx_handcuffs
# I KRIZ FROST TAKE 0 CREDIT FOR ANYTHING DONE ON HERE ALL I DID WAS CHANGE A FEW THINGS AROUND.
