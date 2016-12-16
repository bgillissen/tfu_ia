/*
@filename: feats\dynBillboards\playerOnRespawn.sqf
Author:
	Ben
Description:
	called on player side each time player (re)spawn.
	It changes the texture displayed on the billboards.
*/

[DB_right, DB_rightMode] call dynBillboards_fnc_setTexture;
[DB_left, DB_leftMode] call dynBillboards_fnc_setTexture;
