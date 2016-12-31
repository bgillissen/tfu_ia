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

"loading" cutText [format["Welcome to %1, you are %2", BASE_NAME, PLAYER_SIDEDSP], "PLAIN", 0.1, true];
sleep 3;
"loading" cutFadeOut 4;
BLACKSCREEN = false;