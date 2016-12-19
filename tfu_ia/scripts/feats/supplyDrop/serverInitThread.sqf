/*
@filename: feats\supplyDrop\serverInitThread.sqf
Author:
	Ben
Description:
	this run on server,
	must be spawn, not called,
	a loop that act as a coolDown for supplyDrop avaibility
*/

supplyDropAvail = true;
publicVariable "supplyDropAvail";
supplyDropCrates = [];
publicVariable "supplyDropCrates";

while ( true ) do {
	if ( !supplyDropAvail ) then {
		sleep SD_coolDown;
		if ( (count supplyDropCrates) > SD_maxCrate ) then {
			_crate = supplyDropCrates select 0;
			supplyDropCrates = supplyDropCrates - [_crate];
			publicVariable "supplyDropCrates";
			deleteVehicle _crate;
		};
		[PLAYER_SIDE, SD_msgFrom] sideChat SD_msgAvail;
		supplyDropAvail = true;
		publicVariable "supplyDropAvail";
	}
	sleep SD_checkDelay;
};