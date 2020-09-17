local ForceTog = false

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["INSERT"] = 121,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118,
	["MOUSE1"] = 24
  }
  
RegisterCommand('force', function(source, args)
	ForceMod()
end, false)

function ForceMod()
	ForceTog = not ForceTog

	if ForceTog then

	Citizen.CreateThread(function()
	ShowInfo("Force ~g~ENABLED ~r~\nPress E to use")

	local ForceKey = Keys["E"]
	local Force = 0.5
	local KeyPressed = false
	local KeyTimer = 0
	local KeyDelay = 15
	local ForceEnabled = false
	local StartPush = false

	function forcetick()

	if (KeyPressed) then
		KeyTimer = KeyTimer + 1
		if(KeyTimer >= KeyDelay) then
			KeyTimer = 0
			KeyPressed = false
		end
	end



	if IsControlPressed(0, ForceKey) and not KeyPressed and not ForceEnabled then
		KeyPressed = true
		ForceEnabled = true
	end

	if (StartPush) then

		StartPush = false
		local pid = PlayerPedId()
		local CamRot = GetGameplayCamRot(2)

		local force = 5

		local Fx = -( math.sin(math.rad(CamRot.z)) * force*10 )
		local Fy = ( math.cos(math.rad(CamRot.z)) * force*10 )
		local Fz = force * (CamRot.x*0.2)

		local PlayerVeh = GetVehiclePedIsIn(pid, false)

		for k in EnumerateVehicles() do
			SetEntityInvincible(k, false)
			if IsEntityOnScreen(k) and k ~= PlayerVeh then
				ApplyForceToEntity(k, 1, Fx, Fy,Fz, 0,0,0, true, false, true, true, true, true)
			end
		end

		for k in EnumeratePeds() do
			if IsEntityOnScreen(k) and k ~= pid then
				ApplyForceToEntity(k, 1, Fx, Fy,Fz, 0,0,0, true, false, true, true, true, true)
			end
		end

	end


	if IsControlPressed(0, ForceKey) and not KeyPressed and ForceEnabled then
		KeyPressed = true
		StartPush = true
		ForceEnabled = false
	end

	if (ForceEnabled) then
		local pid = PlayerPedId()
		local PlayerVeh = GetVehiclePedIsIn(pid, false)

		Markerloc = GetGameplayCamCoord() + (RotationToDirection(GetGameplayCamRot(2)) * 20)

		DrawMarker(28, Markerloc, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 180, 0, 0, 35, false, true, 2, nil, nil, false)

		for k in EnumerateVehicles() do
			SetEntityInvincible(k, true)
			if IsEntityOnScreen(k) and (k ~= PlayerVeh) then
				RequestControlOnce(k)
				FreezeEntityPosition(k, false)
				Oscillate(k, Markerloc, 0.5, 0.3)
			end
		end

		for k in EnumeratePeds() do
			if IsEntityOnScreen(k) and k ~= PlayerPedId() then
				RequestControlOnce(k)
				SetPedToRagdoll(k, 4000, 5000, 0, true, true, true)
				FreezeEntityPosition(k, false)
				Oscillate(k, Markerloc, 0.5, 0.3)
			end
		end

	end

	end

	while ForceTog do forcetick() Wait(0) end
end)
else ShowInfo("Force ~r~Disabled") end

end

function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, false)
end

function RotationToDirection(rotation)
	local retz = math.rad(rotation.z)
	local retx = math.rad(rotation.x)
	local absx = math.abs(math.cos(retx))
	return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
end

function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
	  local iter, id = initFunc()
	  if not id or id == 0 then
		disposeFunc(iter)
		return
	  end
  
	  local enum = {handle = iter, destructor = disposeFunc}
	  setmetatable(enum, entityEnumerator)
  
	  local next = true
	  repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
	  until not next
  
	  enum.destructor, enum.handle = nil, nil
	  disposeFunc(iter)
	end)
end

function RequestControlOnce(entity)
	if not NetworkIsInSession or NetworkHasControlOfEntity(entity) then
		return true
	end
	SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
	return NetworkRequestControlOfEntity(entity)
end

function Oscillate(entity, position, angleFreq, dampRatio)
	local pos1 = ScaleVector(SubVectors(position, GetEntityCoords(entity)), (angleFreq*angleFreq))
	local pos2 = AddVectors(ScaleVector(GetEntityVelocity(entity), (2.0 * angleFreq * dampRatio)), vector3(0.0, 0.0, 0.1))
	local targetPos = SubVectors(pos1, pos2)

	ApplyForce(entity, targetPos)
end

function ApplyForce(entity, direction)
	ApplyForceToEntity(entity, 3, direction, 0, 0, 0, false, false, true, true, false, true)
end

function SubVectors(vect1, vect2)
	return vector3(vect1.x - vect2.x, vect1.y - vect2.y, vect1.z - vect2.z)
end

function ScaleVector(vect, mult)
	return vector3(vect.x*mult, vect.y*mult, vect.z*mult)
end

function AddVectors(vect1, vect2)
	return vector3(vect1.x + vect2.x, vect1.y + vect2.y, vect1.z + vect2.z)
end