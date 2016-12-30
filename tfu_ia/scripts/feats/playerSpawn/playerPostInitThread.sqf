/*
@filename: feats\playerSpawn\playerPostInitThread.sqf
Author:
	Ben
Description:
	this run player side
	remove blackscreen, and tell player where he is and on which side
*/

waitUntil {
	!PLAYER_INIT
};

"loading" cutFadeOut 2;
BLACKSCREEN = false;
sleep 3;
titleText [format["Welcome to %1, you are %2", BASE_NAME, PLAYER_SIDEDSP], "PLAIN", 0.5];