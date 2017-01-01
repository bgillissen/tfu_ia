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

if ( (["supportCrate"] call core_fnc_getConf) == 0 ) exitWith{};

SC_avail = true;
publicVariable "SC_avail";
SC_crates = [];
publicVariable "SC_crates";

private _types = (["supportCrate", "types"] call BIS_fnc_GetCfgData);

{
	{
		_x params ["_thing", "_actions"];
		if ( "support" in _actions ) then {
			{
				private _action = ["supportCrate", "actions", _x] call BIS_fnc_GetCfgData;
				_thing addAction [_action, {call supportCrate_fnc_spawn}, _x, 0, false, true, '', 'call supportCrate_fnc_condition', 4];
				true
			} count _types;
		};
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];

_types = nil;

private _cooldown = ["supportCrate_cooldown"] call core_fnc_getConf;
private _maxCrate = ["supportCrate_maxcrate"] call core_fnc_getConf;
private _from =  ["supportCrate", "msgFrom"] call BIS_fnc_GetCfgData;
private _msg =  ["supportCrate", "msgAvail"] call BIS_fnc_GetCfgData;
private _checkDelay =  ["supportCrate", "checkDelay"] call BIS_fnc_GetCfgData;

while { true } do {
	if ( !SC_avail ) then {
		sleep _cooldown;
		if ( (count SC_crates) > _maxCrate ) then {
			private _crate = SC_crates select 0;
			deleteVehicle _crate;
			SC_crates = SC_crates - [_crate];
			publicVariable "SC_crates";
		};
		[_from, _msg] call common_fnc_globalSideChatServer;
		SC_avail = true;
		publicVariable "SC_avail";
	};
	sleep _checkDelay;
};