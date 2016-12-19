/*
@filename: feats\playerSpawn\playerPostInitThread.sqf
Author:
	Ben
Description:
	this run player side
	remove blackscreen, and tell player where he is and on which side
*/

sleep 2
titleFadeOut 3;
cutText [format["Welcome to %1 base, you are %1", ((BASES select BASE) select 0), PLAYER_SIDETXT], "PLAIN"];
sleep 4;
titleFadeOut 3;
BLACKSCREEN = false;