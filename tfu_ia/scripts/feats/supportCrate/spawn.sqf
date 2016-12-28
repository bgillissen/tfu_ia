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

params ["_type"];

SC_avail = false;
publicVariable "SC_avail";

private "_class";
if ( _type isEqualTo "supply" ) then {
	_class = (selectRandom SD_crates);
} else {
	_class = ["suppportCrate", "types", _type] call BIS_fnc_GetCfgData;
};


private _crate = createVehicle [_class, getMarkerPos "SC_spawn", [], 0, 'NONE']; 
_crate allowdamage false;

SC_crates append [_crate];
publicVariable "SC_crates";

if ( _type isEqualTo "supply" ) then {
	[_crate, SD_backpacks, SD_items, SD_weapons, SD_ammo] call common_fnc_setCargo;
};

private _from = ["suppportCrate", "msgFrom"] call BIS_fnc_GetCfgData;
private _msg = ["suppportCrate", "msgDeployed"] call BIS_fnc_GetCfgData;
[PLAYER_SIDE, _from] sideChat _msg;
