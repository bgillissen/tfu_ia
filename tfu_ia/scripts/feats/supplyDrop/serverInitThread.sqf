/*
@filename: feats\supplyDrop\serverInitThread.sqf
Author:
	Ben
Description:
	this run on server,
	must be spawn, not called,
	a loop that act as a coolDown for supplyDrop avaibility
*/

if ( !(["supplyDrop"] call core_fnc_getConf) ) exitWith{};

SD_cooldown = ["supplyDrop_cooldown"] call core_fnc_getConf;
SD_maxcrate = ["supplyDrop_maxcrate"] call core_fnc_getConf;
SD_avail = true;
publicVariable "SD_avail";
SD_crates = [];
publicVariable "SD_crates";

while ( true ) do {
	if ( !SD_avail ) then {
		sleep SD_cooldown;
		if ( (count SD_crates) > SD_maxCrate ) then {
			private _crate = SD_crates select 0;
			SD_crates = SD_crates - [_crate];
			publicVariable "SD_crates";
			deleteVehicle _crate;
		};
		[PLAYER_SIDE, SD_msgFrom] sideChat SD_msgAvail;
		SD_avail = true;
		publicVariable "SD_avail";
	}
	sleep SD_checkDelay;
};