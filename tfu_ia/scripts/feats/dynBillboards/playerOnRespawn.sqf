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
	private _tot = (["dynBillboards", "totRandom"] call BIS_fnc_GetCfgData);
	for "_x" from 1 to  _tot do { DB_list append [_x]; };
};

{
	_x params ["_thing", "_actions", "_mode"];
	if ( "billboard" in _actions ) then {
		[_thing, _mode] call dynBillboards_fnc_setTexture;
	};
	true
} count BA_obj;