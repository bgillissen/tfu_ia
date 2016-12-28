/*
@filename: feats\supportCrate\serverInitThread.sqf
Author:
	Ben
Description:
	this run on server,
	must be spawn, not called,
	add action to base things with a support action,
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
		supportCrate >> actions >> fuel
		supportCrate >> actions >> medic
		supportCrate >> actions >> repair
		supportCrate >> actions >> supply
		supportCrate >> msgFrom
		supportCrate >> msgAvail
		supportCrate >> checkDelay
Return:
	nothing
*/

if ( !(["supportCrate"] call core_fnc_getConf) ) exitWith{};

SC_avail = true;
publicVariable "SC_avail";
SC_crates = [];
publicVariable "SC_crates";

private _types = ["fuel", "medic", "repair", "supply"];

{
	{
		_x params ["_thing", "_actions"];
		{
			if ( _x == "support") exitWith {
				{
					private _action = ["suppportCrate", "actions", _x] call BIS_fnc_GetCfgData;
					_thing addAction [_action, supportCrate_fnc_spawn, [_x], 0, false, true, '', 'call supportCrate_fnc_condition', 2];	
				} count _types;
			};
		} count _actions;
	} count _x;
} count [BA_vehicle, BA_npc, BA_object];

_types = nil;

private _cooldown = ["supportCrate_cooldown"] call core_fnc_getConf;
private _maxCrate = ["supportCrate_maxcrate"] call core_fnc_getConf;
private _from =  ["supportCrate", "msgFrom"] call BIS_fnc_GetCfgData;
private _msg =  ["supportCrate", "msgAvail"] call BIS_fnc_GetCfgData;
private _checkDelay =  ["supportCrate", "checkDelay"] call BIS_fnc_GetCfgData;

while ( true ) do {
	if ( !SC_avail ) then {
		sleep _cooldown;
		if ( (count SC_crates) > _maxCrate ) then {
			private _crate = SC_crates select 0;
			deleteVehicle _crate;
			SC_crates = SC_crates - [_crate];
			publicVariable "SC_crates";
		};
		[PLAYER_SIDE, _from] sideChat _msg;
		SC_avail = true;
		publicVariable "SC_avail";
	}
	sleep _checkDelay;
};