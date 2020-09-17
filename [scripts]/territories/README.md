# REQUIREMENTS
- es_extended
- meta_libs (v1.2 or newer) (https://github.com/meta-hub/meta_libs/releases)
* progbars (included with mod, optional via config.lua)
* Some type of IPL loader. Recommend fivem-ipl as it loads all required drug interiors fully set up as default.

# INSTALLATION
Make sure you have the required dependencies installed.
Check the config.lua for options you might want to change.
Set your credential in credentials.lua (found on modit.store, more info in extra notes).
Execute the SQL file to add the required items to your database.
Start the mod in server.cfg.

# INFO
Territories will aim to provide gangs with "zones" to control.
Each zone will be controlled by influencing the area through various activites, including:
  - Selling drugs.
  - Killing other gang members.
  - Taking out police in the area.

The gang that controls the area will have access to the zones resources.
Resources will include things such as:
  - Drug manufacturing locations
  - Drug selling locations                   
  - Money laundering locations   

Police will be able to temporarily neutralize an area by having an overwhelming presence in the zone
Police presence includes things such as:
  - More police then gang members in the area
  - Police arresting gang members in the area

# USAGE
If player job is apart of the "gang jobs" in config.lua, they will influence the area simply by being in the zone.
Whoever controls the zone (with the most influence) will be able to sell AND produce drugs in that area.
The drug production locations are hidden, while players can sell drugs from anywhere in the zone with /selldrugs, or pressing the hotkey set in config.lua.
Police arresting the controlling gangs members while inside the zone will decrease the gangs influence in the area.
Gang members killing other gang members (or police) inside a zone will decrease/increase influence in that area accordingly.
* Also added money laundering at the biker HQ.

# EXTRA NOTES
Make sure you set your receipt and email in the credentials.lua before attempting to start the mod.
Your email must be the same one that the order was purchased from, which you can check on https://modit.store
It may take up to 12 hours after your purchase for your mod to be authorized, but generally instant.
If your mod does not work correctly, contact us through the discord link above.