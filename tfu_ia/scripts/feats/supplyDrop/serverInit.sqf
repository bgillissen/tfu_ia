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

if ( (["supplyDrop"] call core_fnc_getParam) == 0 ) exitWith {};

private _cooldown = ["supplyDrop_cooldown"] call core_fnc_getParam;
private _maxcrate = ["supplyDrop_maxcrate"] call core_fnc_getParam;
private _from =  ["supplyDrop", "msgFrom"] call core_fnc_getSetting;
private _msg =  ["supplyDrop", "msgAvail"] call core_fnc_getSetting;
private _checkDelay =  ["supplyDrop", "checkDelay"] call core_fnc_getSetting;

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
		[PLAYER_SIDE, _from, _msg] call common_fnc_globalSideChatServer;
		SD_avail = true;
		publicVariable "SD_avail";
	};
	sleep _checkDelay;
};