/*
@filename: feats\supplyDrop\serverThread.sqf
Author:
	Ben
Description:
	this script will run on server side,
	must be spawn, not called,
	a loop that act as a coolDown for supplyDrop avaibility
*/

private ["_side"];

if ( PLAYER_SIDE == "blufor" ) then {
	_side = west;
} else {
	_side = east;
}

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
		[_side, SD_msgFrom] sideChat SD_msgAvail;
		supplyDropAvail = true;
		publicVariable "supplyDropAvail";
	}
	sleep SD_checkDelay;
};