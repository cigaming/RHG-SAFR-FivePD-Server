-------------------
-- C o n f i g s --
-------------------
Config = {}
Config.doktor = 2

companyName = "Pillbox Hill Medical"       
companyIcon = "CHAR_CALL911" -- https://wiki.gtanet.work/index.php?title=Notification_Pictures
spawnRadius = 60              -- Default Value: 
drivingStyle = 1074528293           -- Default Value: 786603
simplerRepair = false           -- When enabled, instead of getting out of the vehicle to repair, the mechanic stops his vehicle and the repair happens automatically.
repairComsticDamage = false     -- When enabled, the vehicle's cosmetic damage gets reset.
flipVehicle = false             -- When enabled, the vehicle will be flipped if on roof or side after repair.
 
-- To change the chat command (def. /mechanic), see line 1 of client.lua

-- Edit / Add Drivers and their information here!

mechPeds = {
                --  * Find the icons here:      https://wiki.gtanet.work/index.php?title=Notification_Pictures
                --  * Find the ped models here: https://wiki.gtanet.work/index.php?title=Peds
                --  * Find the vehicles here    https://wiki.gtanet.work/index.php?title=Vehicle_Models
                --  * Find the colours here:    https://wiki.gtanet.work/index.php?title=Vehicle_Colors

                [1] = {name = "EMT Leck", icon = "CHAR_CALL911", model = "s_m_m_paramedic_01", vehicle = 'ambulance', colour = 111, 
                                ['lines'] = {
                                        "Take care of yourself, get well soon.",}},

                -- You can use this template to make your own driver.

                --  * Find the icons here:      https://wiki.gtanet.work/index.php?title=Notification_Pictures
                --  * Find the ped models here: https://wiki.gtanet.work/index.php?title=Peds
                --  * Find the colours here:    https://wiki.gtanet.work/index.php?title=Vehicle_Colors
                --  * Driver ID needs to be a number (in sequential order from the previous one. In this example it would be 3).
                --[[
                
                --Edit the NAME, ICON, PED MODEL and TRUCK COLOUR here:
                [driver_ID] = {name = "driver_name", icon = "driver_icon", model = "ped_model", vehicle = 'vehicle_model' colour = 'driver_colour',

                                --You can add or edit any existing vehicle fix lines here:
                                [1] = {"Sample text 1","Sample text 2",}}, -- lines of dialogue.

                  
                ]]
                }

---- Orjinal AI Mechanic : https://forum.fivem.net/t/release-ai-mechanic/756664

---- EMS edited by benpazzo: https://forum.fivem.net/u/KomsuTeyze/activity