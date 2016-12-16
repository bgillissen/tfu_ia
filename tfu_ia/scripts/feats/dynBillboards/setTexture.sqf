/*
@filename: feats\dynBillboards\setTexture.sqf
Author:
	Ben
Description:
	called on player side.
	It changes the texture displayed on the billboards.
*/

param ["_obj", "_mode"];
private ["_bill"];

if ( isNil "DB_list" ) then {
	DB_list = [];
	for( "_x" from 1 to DB_totRandom ) do { DB_list append _x; };
};

if ( _mode == "random" ) then {
	if ( isNil "DB_queue" ) then DB_queue = DB_list;
	if ( (count DB_queue) == 0 ) then DB_queue = DB_list;
	_bill selectRandom DB_queue;
	_obj setObjectTexture [0, format[DB_path, _bill]];
	DB_queue = DB_queue - [_bill];
} else {
	_obj etObjectTexture [0, format[DB_path, _mode]];
};