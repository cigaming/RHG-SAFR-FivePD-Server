var speedLimit = 10.0;
var speedLimitRadius = 50.0;

var standAlone = true; // Disable for using hooks only.
var keyPress = 38; // E

var speedZones = []; // {FlareObject: id, FlareObjectPos: arr, ZoneId: id}
var didSync = false;
var flareHash = GetHashKey("weapon_flare");
RequestModel("w_am_flare");
RequestWeaponAsset(flareHash, 31, 0);

if (standAlone) {
	setTick(() => {
		if (IsControlJustReleased(0, keyPress)) {
			var playerPos = GetEntityCoords(GetPlayerPed(-1), true);
			if (GetSelectedPedWeapon(GetPlayerPed(-1)) == flareHash) {
				if (!IsPedInAnyVehicle(GetPlayerPed(-1), true) && GetSelectedPedWeapon(GetPlayerPed(-1)) == flareHash) {
					emitNet('roadflare:Server:Place', playerPos);
					console.log("roadflare:Send:Place", playerPos);
				}
			} else {
				if (!IsPedInAnyVehicle(GetPlayerPed(-1), true) && GetSelectedPedWeapon(GetPlayerPed(-1)) != flareHash) {
					var objectNear = GetClosestObjectOfType(playerPos[0], playerPos[1], playerPos[2], 5.0, "w_am_flare", false, false, false);
					if (objectNear) {
						var ObjectPos = GetEntityCoords(objectNear, true);
						emitNet('roadflare:Server:Pickup', ObjectPos);
						console.log("roadflare:Send:Pickup", ObjectPos);
					}
				}
			}
		}
	});
}

onNet('roadflare:Sync', (flarePoses) => {
	for(var i = 0; i < flarePoses.length; i++) {
		emit('roadflare:Place', flarePoses[i]);
	}
});

onNet('roadflare:Place', (flarePos) => {
	console.log("roadflare:Place", flarePos);
	var flareObject = CreateWeaponObject(flareHash, 1, flarePos[0], flarePos[1], flarePos[2], true, 0.0, false);
	PlaceObjectOnGroundProperly(flareObject);
	var flareObjectPos = GetEntityCoords(flareObject, true);
	var zoneId = N_0x2ce544c68fb812a0(flareObjectPos[0], flareObjectPos[1], flareObjectPos[2], speedLimitRadius, speedLimit, false);
	speedZones.push({FlareObject: flareObject, FlareObjectPos: flareObjectPos, ZoneId: zoneId});
	console.log( {FlareObject: flareObject, FlareObjectPos: flareObjectPos, ZoneId: zoneId} );
});

onNet('roadflare:Pickup', (flarePos) => {
	console.log("roadflare:Pickup", flarePos);
	var objectNear = GetClosestObjectOfType(flarePos[0], flarePos[1], flarePos[2], 5.0, "w_am_flare", false, false, false);
	if (objectNear) {
		console.log("Finding Zone/Flare");
		var ObjectPos = GetEntityCoords(objectNear, true);
		var indexToRemove = -1;
		for(var i = 0; i < speedZones.length; i++) {
			if (speedZones[i].FlareObject == objectNear) {
				console.log("Remove Zone/Flare");
				DeleteObject(speedZones[i].FlareObject);
				N_0x1033371fc8e842a7(speedZones[i].ZoneId);
				indexToRemove = i;
			}
		}
		if (indexToRemove != -1) {
			speedZones.splice(indexToRemove, 1);
		} else {
			console.log("Flare not found. Removing anyway? (Walk away if still around. The world will clean it up)", objectNear);
			DeleteObject(objectNear);
		}
	}
});

onNet('playerSpawned', () => {
	if (!didSync) {
		emitNet('roadflare:Server:Sync');
		didSync = true;
	}
});