/*
@filename: feats\viewDistance\playerInit.sqf
Author: 
	Bryan "Tonic" Boardwine
Description:
	run on client
	just define default value for TAW View Distance.
*/

tawvd_foot = ["viewDistance", "foot"] call BIS_fnc_GetCfgData;;
tawvd_car = ["viewDistance", "car"] call BIS_fnc_GetCfgData;
tawvd_air = ["viewDistance", "air"] call BIS_fnc_GetCfgData;
tawvd_addon_disable = true;

private _action = ["viewDistance", "action"] call BIS_fnc_GetCfgData;

{
	{
		_x params ["_thing", "_actions"];
		if ( "arsenal" in _actions ) then {
			_thing addAction [_action, {call viewDistance_fnc_open}, [], 0, false, true, "", "true", 4];
		};
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];