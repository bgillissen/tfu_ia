/*
@filename: feats\supportCrate\serverInitThread.sqf
Author:
	Ben
Description:
	this run on server,
	must be spawn, not called,
	add action to base things with a support action,
	a loop that act as a coolDown for supportCrate
*/

if ( !(["supportCrate"] call core_fnc_getConf) ) exitWith{};

SC_cooldown = ["supportCrate_cooldown"] call core_fnc_getConf;
SC_maxcrate = ["supportCrate_maxcrate"] call core_fnc_getConf;
SC_avail = true;
publicVariable "SC_avail";
SC_crates = [];
publicVariable "SC_crates";

{
	{
		_x params ["_thing", "_actions"];
		{
			if ( _x == "support") then {
				_thing addAction [SC_actionFuel, supporCrate_fnc_spawn, ["fuel"], 0, false, true, '', '[] call supplyDrop_fnc_condition', 2];
				_thing addAction [SC_actionMedic, supporCrate_fnc_spawn, ["medic"], 0, false, true, '', '[] call supplyDrop_fnc_condition', 2];
				_thing addAction [SC_actionRepair, supporCrate_fnc_spawn, ["repair"], 0, false, true, '', '[] call supplyDrop_fnc_condition', 2];
				_thing addAction [SC_actionSupply, supporCrate_fnc_spawn, ["supply"], 0, false, true, '', '[] call supplyDrop_fnc_condition', 2];
			};
		} count _actions;
	} count _x;
} count [BA_vehicle, BA_npc, BA_object];

while ( true ) do {
	if ( !SC_avail ) then {
		sleep SC_cooldown;
		if ( (count SC_crates) > SC_maxCrate ) then {
			private _crate = SC_crates select 0;
			SC_crates = SC_crates - [_crate];
			publicVariable "SC_crates";
			deleteVehicle _crate;
		};
		[PLAYER_SIDE, SC_msgFrom] sideChat SC_msgAvail;
		SC_avail = true;
		publicVariable "SC_avail";
	}
	sleep SC_checkDelay;
};