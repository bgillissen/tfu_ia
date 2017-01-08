/*
@filename: feats\dynBillboards\setTexture.sqf
Author:
	Ben
Description:
	called on player side.
	It changes the texture displayed on the billboards.
*/

params ["_obj", "_mode"];

private _path = ["billboards", "path"] call core_fnc_getSetting;

if ( _mode isEqualTo "random" ) then {
	if ( isNil "DB_queue" ) then { DB_queue = DB_list; };
	if ( (count DB_queue) == 0 ) then { DB_queue = DB_list; };
	_mode = selectRandom DB_queue;
	DB_queue = DB_queue - [_mode];
};

_obj setObjectTexture [0, format[_path, _mode]];