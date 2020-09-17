var flarePosArr = [];

onNet('roadflare:Server:Sync', () => {
	pushEventNet('roadflare:Sync', source, flarePosArr);
	console.log("Sync Flare to", source, "Total:", flarePosArr.length);
});

onNet('roadflare:Server:Place', (flarePos) => {
	flarePosArr.push(flarePos);
	pushEventNet('roadflare:Place', -1, flarePos);
	console.log("Add Flare To Sync", flarePos);
});

onNet('roadflare:Server:Pickup', (flarePos) => {
	console.log("Searching through flarePosArr", flarePosArr.length, "for flare...",flarePos);
	var indexsToRemove = [];
	for(var i = 0; i < flarePosArr.length; i++) {
		if (Math.trunc(flarePosArr[i][0]) == Math.trunc(flarePos[0]) && Math.trunc(flarePosArr[i][1]) == Math.trunc(flarePos[1])) {
			indexsToRemove.push(i);
		}
	}
	for(var i = 0; i < indexsToRemove.length; i++) {
		pushEventNet('roadflare:Pickup', -1, flarePosArr[indexsToRemove[i]]);
		flarePosArr.splice(indexsToRemove[i], 1);
		console.log("Remove Flare From Sync", flarePos);
	}
});

// JS Emit Sync
emitNetSync = [];
emitSync = [];

setTick(() => {
	if (emitNetSync.length != 0) {
		var argsS = emitNetSync.shift()
		emitNet.apply(this, argsS);
	}
	if (emitSync.length != 0) {
		var args = emitSync.shift()
		emit.apply(this, args);
	}
});

function pushEventNet(eventName, source, eventArgs) {
	var args = [eventName, source, eventArgs];
	//args = args.concat(eventArgs)
	emitNetSync.push(args);
}

function pushEvent(eventName, eventArgs) {
	var args = [eventName, eventArgs];
	//args = args.concat(eventArgs)
	emitSync.push(args);
}