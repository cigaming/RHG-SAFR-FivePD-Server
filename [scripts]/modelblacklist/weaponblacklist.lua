-- CONFIG --

-- Blacklisted weapons
weaponblacklist = {
	"WEAPON_MINIGUN",
	"WEAPON_RPG",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_RAILGUN",
	"WEAPON_STICKYBOMB",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_GRENADE",
	"WEAPON_PROXMINE",
	"WEAPON_BZGAS",
	"WEAPON_RAYMINIGUN",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_AUTOSHOTGUN",
	"WEAPON_RAYCARBINE",
	"WEAPON_RAYPISTOL"
}

-- Don't allow any weapons at all (overrides the blacklist)
disableallweapons = false

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			nothing, weapon = GetCurrentPedWeapon(playerPed, true)

			if disableallweapons then
				RemoveAllPedWeapons(playerPed, true)
			else
				if isWeaponBlacklisted(weapon) then
					RemoveWeaponFromPed(playerPed, weapon)
					sendForbiddenMessage("This weapon is blacklisted!")
				end
			end
		end
	end
end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(weaponblacklist) do
		if model == GetHashKey(blacklistedWeapon) then
			return true
		end
	end

	return false
end