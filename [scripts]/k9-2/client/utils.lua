Utils = {}

Utils.DoorIndicies = {
  ["BackL"] = 2,
  ["BackR"] = 3
}
Utils.DoorBones = {
  ["BackL"] = "door_dside_r",
  ["BackR"] = "door_dside_f"
}
Utils.DoorSeats = {
  ["BackL"] = "seat_dside_r",
  ["BackR"] = "seat_pside_r"
}

function Utils.GetClosestVehicleDoor(pos, vehicle)
  local closestBonePos = nil
  local closestDoor = nil
  local closestDistance = nil

  for k, v in pairs(Utils.DoorIndicies) do
    local doorBone = Utils.DoorBones[k]
    local doorBoneIndex = GetEntityBoneIndexByName(vehicle, doorBone)
    local bonePos = GetWorldPositionOfEntityBone(vehicle, doorBoneIndex)

    if bonePos then
      local distance = Vdist2(pos.x, pos.y, pos.z, bonePos.x, bonePos.y, bonePos.z)
      if closestDistance == nil or closestDistance > distance then
        closestBonePos = bonePos
        closestDoor = k
        closestDistance = distance
      end
    end
  end
  return closestBonePos, closestDoor, closestDistance
end

function Utils.GetSeatBoneFromDoor(door)
  return Utils.DoorSeats[door]
end

function Utils.GetClosestPlayer()
  local closestPlayer = -1
  local players = GetActivePlayers()
  for _, v in pairs(players) do
    
  end
end

function Utils.RegisterKeyMap(cmd, pressAction, releaseAction, description, type, key)
  RegisterCommand("+"..cmd, pressAction, false)
  RegisterCommand("-"..cmd, releaseAction, false)
  RegisterKeyMapping("+"..cmd, description, type, key)
end