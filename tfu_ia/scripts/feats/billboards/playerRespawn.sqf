/*
@filename: feats\dynBillboards\playerOnRespawn.sqf
Author:
	Ben
Description:
	called on player side each time player (re)spawn.
	It changes the texture displayed on the billboards with a mode set to random.
*/

if ( isNil "DB_list" ) then {
	DB_list = [];
	private _tot = (["billboards", "totRandom"] call core_fnc_getSetting);
	for "_x" from 1 to  _tot do { DB_list pushback _x; };
};

{
	_x params ["_thing", "_actions"];
	{
		_x params ["_action", "_mode"];
		if ( "billboard" isEqualTo _action ) then { 
			[_thing, _mode] call billboards_fnc_setTexture;
		};
		true
	} count _actions;
	true
} count BA_obj;