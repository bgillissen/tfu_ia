/*
@filename: feats\dynBillboards\playerOnRespawn.sqf
Author:
	Ben
Description:
	called on player side each time player (re)spawn.
	It changes the texture displayed on the billboards.
*/

private ["_bill", "texture"];

[Bill_2, DB_left] call dynBillboards_fnc_setTexture;
[Bill_1, DB_righ] call dynBillboards_fnc_setTexture;

//Random
if ( DB_mode == "random" ) then {
	if ( isNil "DB_list" ) then { DB_list = [1,2,3,4,5,6]; };
	if ( (count DB_list) == 0 ) then { DB_list = [1,2,3,4,5,6]; };
	_bill = selectRandom imageList;
	Bill_2 setObjectTexture [0, format["media\billboards\billboard%1.paa", _bill]];
	DB_list = DB_list - [_bill];
};

//For Christmast
if ( DB_mode == "christmast" ) then {
	Bill_2 setObjectTexture [0, "media\billboards\billboardNoel.paa"];
};