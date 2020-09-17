<p align="center">
  <img src="https://i.imgur.com/jPYeXxF.png">
</p>

## RocketCAD FiveM Integration

The RocketCAD Integration is built to integrate RocketCAD and your FiveM Server.

## Installation Instructions

To install this resource, simply install it just as you would any other resource into your FiveM Server. 

1) Download the latest version from the releases page
2) Place the resource into your server-data/resources directory
3) Configure the resources by using the Configuration Guide
4) Once configured, add "start rc-integration" to your server.cfg file
5) Start your server and enjoy!

## Configuration Guide

Configuring the RocketCAD source is incredibly simple. Use the resources below to find quickly understand each option to get your server back up and running!

**You only need to edit the "config.lua" file, all other files will operate without editing!**

#### Settings

Name: The "name" setting is the name of your Communications Department. For example, "San Andreas Communications" or "Acme City Dispatch"

Code: The "code" setting is your Unique ID of your community, this can ONLY be found under the Billing Center. Head to https://therocketcad.com/amc > Billing Center > Community ID and paste this in here.

#### Alert

Alert 1: The "alert1" setting is the title of your Emergency Traffic Only alert, this should match the alert title you have configured in your CAD already. For example, "Signal 100"

Alert 2: The "alert2" setting is the title of your Stop Transmitting alert, this should match the alert title you have configured in your CAD already. For example, "10-3"

## Integration Features

#### 1) Call Notification & Directions

The Call Notification feature will notify you in-game when you are assigned to a new call and will provide you with the title and postal location. Accompanied by the CAD that will play an audible sound, you will now when you get a call and where you are supposed to go without even opening up the CAD! If the location is apart of our large database of locations around the map, you will be auto-waypointed to the location to begin responding to.

#### 2) Panic Notification & Directions

The Panic Notification feature automatically notifys all Fire and LEO units of a panic button press and automatically waypoints all units to the presser's location.

#### 3) Automatic Location Updating

The Automatic Location Update feature allows for Dispatch and Units to be aware of all player's locations at all times. Every 60 seconds, a player's location will be updated in CAD giving Dispatch an almost instant picture of where every unit is. LEO and Fire units can also view each other's locations under the new "Units" tab of the MDT.

#### 4) Plate Searches

The Plate Searching feature allows you to quickly type the plate of any vehicle in chat (Using the /plate command) and will return the results instantly as a sleek notification above your game map. This removes the need to tab into your Steam Browser or open the MDT externally.

#### 5) Emergency and Stop Transmitting Tone Alerts

If you have opted to mute your MDT whilst patrolling, you will not hear the audible effects of Emergency Broadcast Only and Stop Transmitting alerts being placed into effect. You now will receive alerts in-game notifying you of these alerts, whether you have the MDT muted or not.
