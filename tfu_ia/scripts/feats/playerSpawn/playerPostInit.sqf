/*
@filename: feats\playerSpawn\playerPostInitThread.sqf
Author:
	Ben
Description:
	this run player side
	remove blackscreen, and tell player where he is and on which side
*/

if ( !BLACKSCREEN ) exitWith {};

waitUntil {
	!PLAYER_INIT
};

"welcome" cutText [format["Welcome to %1, you are %2", BASE_NAME, PLAYER_SIDEDSP], "BLACK", 1, true];

sleep 1;

"loading" cutFadeOut 2;

sleep 3;

"welcome" cutFadeOut 1;

BLACKSCREEN = false;