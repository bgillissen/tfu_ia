/*
@filename: feats\playerSpawn\playerPreInit.sqf
Author:
	Ben
Description:
	this run player side
	black out player screen if not already done.
*/

if ( isNil "BLACKSCREEN" ) then { BLACKSCREEN = false; };

if ( BLACKSCREEN ) exitWith {};

BLACKSCREEN = true;

"loading" cutText ["Please wait, loading...", "BLACK", 0.1, true];