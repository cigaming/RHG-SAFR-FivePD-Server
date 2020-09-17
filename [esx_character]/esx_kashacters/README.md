# KASHacters - ESX Multi Characters

## Introduction

> I've seen a lot of request to have ESX Multi Character, while working on my own framework I've made it multiple times and wanted to try it out with ESX. I tried to edit as less possible to the core of essentialmode or es_extended and it worked well :) PS. just don't mind the name...

## Support

> Because of the many questions I get that are different from the script I've decided to **not support** any not esx_kashacters script. Many errors are caused because of another script which might have something like 'playerJoined' as an event. There are too many different ESX scripts installed for different servers so I can't help everyone.

## Installation

> First of all to get this working you need to comment out the `NetworkIsSessionStarted()` Citizen.CreateThread() in *essentialmode\client\main.lua* on line *6 - 16*

>Second you need to upload the SQL file to your database **BEFORE** you start the resource.

>At last you will put the resource (*esx_kashacters*) in your resource folder.

>In the *esx_kashacters\server\main.lua* you can edit the tables where an identifier is needed as such:
```
local IdentifierTables = {
    {table = "users", column = "identifier"},
    {table = "owned_vehicles", column = "owner"},
    {table = "user_accounts", column = "identifier"},
}
```
> **Pay ATTENTION: You have to call the resource 'esx_kashacters' in order for the javascript to work!!!**

## How it works
> What this script does it manipulates ESX for loading characters
So when you are choosing your character it changes your steam id which is normally steam: to Char: this prevents ESX from loading another character because it is looking for you exact steamid. So when you choose your character it will change it from Char: to your normal steam id (steam:). When creating a new character it will spawn you without an exact steamid which creates a new database entry for your steamid

## Credits

> ESX Framework and **KASH** AND **Onno204** for creating the resource. You can do whatever the f with it what you want but it is nice to give the main man credits ;)
