-- C o n f i g s --

companyName = "APlusTowing" 
companyIcon = "CHAR_PROPERTY_TOWING_IMPOUND" -- https://wiki.gtanet.work/index.php?title=Notification_Pictures
                
spawnRadius = 400                            -- Default value: 500

drivingStyle = 786603                        -- Change the driving behaviour of the truck: https://vespura.com/drivingstyle/

-- To change the chat command (def. /tow), see line 1 of client.lua

-- You can add more vehicle models to the two existing categories.
towTruckModels = {        
            
                ['flatbeds'] = { 
                    model = 'flatbed',                                                 -- Change the model here (https://wiki.gtanet.work/index.php?title=Vehicle_Models)
                        ['offset'] = {['x'] = 1.0, ['y'] = -6.5, ['z'] = 1.0},},      -- Edit the offset of where the vehicle gets attached
                        
                        
                ['boxtrucks'] = {
                    model = 'mule3',
                        ['offset'] = {['x'] = 0.5, ['y'] = 2.0, ['z'] = 1.0},},
                } 


-- Edit / Add Drivers and their information here!
towTruckDrivers = {

                [1] = {name = "Driver Bob", icon = "CHAR_MP_ARMY_CONTACT", ped = "S_M_M_TRUCKER_01", colour = 88, 
                                [1] = {"I wont charge you a arm and a leg! ~n~ I only want your tows.", 
                                "Howdy partner! I'll get it towed!",
                                "You called the right guy, ~n~ because I got puns from head to tow.",
                                "Tow'nt worry about it, ~n~ I'll get it towed!",
                                "Do you even lift bro? ~n~ Because I do!",
                                "You want too hook up ~n~ some time?",
                                "Sorry I took so long!",
                                "We have some of the best ~n~ hookers in town!",
                                "There ya go!",
                                "Bob's here to the rescue!",
                                "That will look good in the impound!",
                                "No worries, I've got this!",
                                "Can't wait to see my wife and kids...",
                                "I love my job!",
                                "I'll be taking that...",
                                "Good Morning! What do we have here?",
                                "You're coming with me!",}},
                                
                [2] = {name = "Driver Joe", icon = "CHAR_JOE", ped = "MP_M_WAREMECH_01", colour = 27,
                                [1] = {"Fuck you.",
                                "I hate my job.",
                                "You could've at least sent me a good looking one...",
                                "I'll take it from here.",
                                "What do we have here...",
                                "I've got it.",
                                "It will be at the compound.",
                                "Oh, was I late?",
                                "No need to thank me.",
                                "You're lucky I'm doing this for free...",
                                "So how's your day going?",
                                "I wanna go home...",
                                "I'm tired of this shit.",
                                "Guess who!",
                                "I'll be taking that.",
                                "When will my shift end...",}},
                                
                                
                -- You can use this template to make your own driver.

                --  * Find the icons here:      https://wiki.gtanet.work/index.php?title=Notification_Pictures
                --  * Find the ped models here: https://wiki.gtanet.work/index.php?title=Peds
                --  * Find the colours here:    https://wiki.gtanet.work/index.php?title=Vehicle_Colors
                --  * Driver ID needs to be a number (in sequential order from the previous one. In this example it would be 3).
                --[[
                
                --Edit the NAME, ICON, PED MODEL and TRUCK COLOUR here:
                [driver_ID] = {name = "driver_name", icon = "driver_icon", ped = "ped_model", color = 'driver_colour',

                                --You can add or edit any existing vehicle pickup lines here:
                                [1] = {"Sample text 1","Sample text 2",}}, -- lines of dialogue. use ~n~ to separate long ones.

                  
                ]]
 
                }   
                


