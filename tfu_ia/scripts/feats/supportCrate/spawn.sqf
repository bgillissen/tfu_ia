/*
@filename: feats\supportCrate\spawn.sqf
Credit:
	Jester [AW]
Author:
	Ben
Description:
	run on player,
	it spawn a support crate, can be (medic, fuel, repair, supply)
Params:
	_type	STRING,	type of support crate to spawn
Environment:
	missionNamespace:
		SC_avail
		SD_crates
		SD_backpacks
		SD_items
		SD_weapons
		SD_ammo
		PLAYER_SIDE
	marker:
		SC_spawn
	missionConfig:
		supportCrate >> types >> medic
		supportCrate >> types >> fuel
		supportCrate >> types >> repair
		supportCrate >> types >> supply
Return:
	nothing 
*/
params ["_thing", "_caller", "_id", "_type"];

SC_avail = false;
publicVariable "SC_avail";

private "_class";

if ( _type isEqualTo "supply" ) then {
	_class = (selectRandom SD_crates);
} else {
	_class = (["supportCrate", "typeClass", _type] call core_fnc_getSetting);
};

private _crate = createVehicle [_class, getMarkerPos "SC_spawn", [], 0, 'NONE']; 
_crate setDir markerDir "SC_spawn";
_crate allowdamage false;

SC_crates append [_crate];
publicVariable "SC_crates";

if ( _type isEqualTo "supply" ) then {
	[_crate, SD_backpacks, SD_items, SD_weapons, SD_ammo] call common_fnc_setCargo;
};

private _from =  ["supportCrate", "msgFrom"] call core_fnc_getSetting;
private _msg = (["supportCrate", "msgDeployed"] call core_fnc_getSetting);
private _cooldown = ["supportCrate_cooldown"] call core_fnc_getParam;
[_from, format[_msg, profileName, _type, floor (_cooldown / 60)]] call common_fnc_globalSideChat;

[[_crate], false] call curator_fnc_addEditable;