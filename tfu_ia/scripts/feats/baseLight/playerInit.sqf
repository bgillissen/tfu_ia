/*
@filename: feats\baseLight\playerInit.sqf
Author:
	Ben
Description:
	run on player
	add action the things with baselight action to allow players to switch base lights on or off
*/

private _on = (["baseLight", "on"] call core_fnc_getSetting);
private _off = (["baseLight", "off"] call core_fnc_getSetting);

{
	{
		_x params ["_thing", "_actions"];
		{
			if ( (configName _x) isEqualTo "baseLight" ) then {
				diag_log format["adding baseLight action to %1", _thing];
				_thing addAction [_on, {call baseLight_fnc_switchLight}, true, 0, false, true, "", "call baseLight_fnc_condition", 2];
				_thing addAction [_off, {call baseLight_fnc_switchLight}, false, 0, false, true, "", "call baseLight_fnc_condition", 2];
			};
		} forEach _actions;
	} forEach _x;
} forEach [BA_npc, BA_obj, BA_veh];