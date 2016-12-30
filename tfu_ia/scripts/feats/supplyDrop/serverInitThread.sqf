/*
@filename: feats\supplyDrop\serverInitThread.sqf
Author:
	Ben
Description:
	run on server,
	must be spawn, not called,
	a loop that act as a coolDown for supplyDrop avaibility
Params:
	none
Environment:
	missionParameters:
		supplyDrop
		supplyDrop_cooldown
		supplyDrop_maxcrate
	missionNamespace:
		SD_avail
		SD_crates
	missionConfig:
		supplyDrop >> msgFrom
		supplyDrop >> msgAvail
		supplyDrop >> checkDelay
Return:
	nothing
*/

if ( (["supplyDrop"] call core_fnc_getConf) == 0 ) exitWith {};

private _cooldown = ["supplyDrop_cooldown"] call core_fnc_getConf;
private _maxcrate = ["supplyDrop_maxcrate"] call core_fnc_getConf;
private _from =  ["supplyDrop", "msgFrom"] call BIS_fnc_GetCfgData;
private _msg =  ["supplyDrop", "msgAvail"] call BIS_fnc_GetCfgData;
private _checkDelay =  ["supplyDrop", "checkDelay"] call BIS_fnc_GetCfgData;

SD_avail = true;
publicVariable "SD_avail";
SD_spawnedCrates = [];
publicVariable "SD_spawnedCrates";

while { true } do {
	if ( !SD_avail ) then {
		sleep _cooldown;
		if ( (count SD_spawnedCrates) > _maxCrate ) then {
			private _crate = SD_spawnedCrates select 0;
			{ deleteVehicle _x; } count _crate;
			SD_spawnedCrates = SD_spawnedCrates - [_crate];
			publicVariable "SD_spawnedCrates";
		};
		[PLAYER_SIDE, _from] sideChat _msg;
		SD_avail = true;
		publicVariable "SD_avail";
	};
	sleep _checkDelay;
};