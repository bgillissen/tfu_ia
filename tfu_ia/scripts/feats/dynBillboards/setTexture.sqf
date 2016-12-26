/*
@filename: feats\dynBillboards\setTexture.sqf
Author:
	Ben
Description:
	called on player side.
	It changes the texture displayed on the billboards.
*/

params ["_obj", "_mode"];

if ( isNil "DB_list" ) then {
	DB_list = [];
	for( "_x" from 1 to (["dynBillboards", "totRandom"] call BIS_fnc_GetCfgData) ) do { DB_list append [_x]; };
};

private _path = ["dynBillboards", "path"] call BIS_fnc_GetCfgData;

if ( _mode == "random" ) exitWith {
	if ( isNil "DB_queue" ) then DB_queue = DB_list;
	if ( (count DB_queue) == 0 ) then DB_queue = DB_list;
	private _bill = selectRandom DB_queue;
	_obj setObjectTexture [0, format[_path, _bill]];
	DB_queue = DB_queue - [_bill];
};

_obj setObjectTexture [0, format[_path, _mode]];