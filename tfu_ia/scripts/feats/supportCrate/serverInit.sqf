/*
@filename: feats\supportCrate\serverInitThread.sqf
Author:
	Ben
Description:
	this run on server,
	must be spawn, not called,
	a loop that act as a coolDown for supportCrate
Params:
	none
Environment:
	missionParameters:
		supportCrate
		supportCrate_cooldown
		supportCrate_maxcrate
	missionNamespace:
		SC_avail
		SC_crates
	missionConfig:
		supportCrate >> msgFrom
		supportCrate >> msgAvail
		supportCrate >> checkDelay
Return:
	nothing
*/

if ( (["supportCrate"] call core_fnc_getParam) == 0 ) exitWith{};

SC_avail = true;
publicVariable "SC_avail";
SC_crates = [];
publicVariable "SC_crates";

private _cooldown = ["supportCrate_cooldown"] call core_fnc_getParam;
private _maxCrate = ["supportCrate_maxcrate"] call core_fnc_getParam;
private _from =  ["supportCrate", "msgFrom"] call core_fnc_getSetting;
private _msg =  ["supportCrate", "msgAvail"] call core_fnc_getSetting;
private _checkDelay =  ["supportCrate", "checkDelay"] call core_fnc_getSetting;

while { true } do {
	if ( !SC_avail ) then {
		sleep _cooldown;
		if ( (count SC_crates) > _maxCrate ) then {
			private _crate = SC_crates select 0;
			deleteVehicle _crate;
			SC_crates = SC_crates - [_crate];
			publicVariable "SC_crates";
		};
		[1, _msg, [_from, PLAYER_SIDE]] call global_fnc_chat;
		SC_avail = true;
		publicVariable "SC_avail";
	};
	sleep _checkDelay;
};