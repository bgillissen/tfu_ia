/*
@filename: feats\supportCrate\spawn.sqf
Credit:
	Jester [AW]
Author:
	Ben
Description:
	this run on client,
	it spawn an support crate, can be (medic, fuel, repair, supply) 
*/

params ["_type"];

SC_avail = false;
publicVariable "SC_avail";

private "_class";
if ( _type == "medic" ) then _class = "???";
if ( _type == "fuel" ) then _class = "???";
if ( _type == "repair" ) then _class = "???";
if ( _type == "supply" ) then _class = (selectRandom S_crates);

_crate = createVehicle [_class, getMarkerPos SC_spawn, [], 0, 'NONE']; 
_crate allowdamage false;

SC_crates append _crate;
publicVariable "SC_crates";

if ( _type == "supply" ) then {
	[_crate, SD_backpacks, SD_items, SD_weapons, SD_ammo] call common_fnc_setCargo;
};

[PLAYER_SIDE, SC_msgFrom] sideChat SC_msgDeployed;