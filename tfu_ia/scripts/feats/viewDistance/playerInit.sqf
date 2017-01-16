/*
@filename: feats\viewDistance\playerInit.sqf
Author: 
	Bryan "Tonic" Boardwine
Description:
	run on client
	just define default value for TAW View Distance.
*/

tawvd_foot = ["viewDistance", "foot"] call core_fnc_getSetting;;
tawvd_car = ["viewDistance", "car"] call core_fnc_getSetting;
tawvd_air = ["viewDistance", "air"] call core_fnc_getSetting;
tawvd_addon_disable = true;

private _act = ["viewDistance", "action"] call core_fnc_getSetting;

{
	{
		_x params ["_thing", "_actions"];
		{
			_x params ["_action", "_conf"];
			if ( "vd" isEqualTo _action ) then {
				_thing addAction [_act, {call viewDistance_fnc_open}, [], 0, false, true, "", "true", 4];
			};
			true
		} count _actions;
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];