/*
@filename: feats\playerSpawn\playerPreInit.sqf
Author:
	Ben
Description:
	this run player side
	black our player screen if not already done.
*/

if ( BLACKSCREEN ) exitWith{};
BLACKSCREEN = true;
cutText ["Please wait, loading...", "BLACK OUT"];