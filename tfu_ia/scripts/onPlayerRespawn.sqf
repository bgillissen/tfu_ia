/*
@filename: onPlayerRespawn.sqf
Author:
	Ben
Description:
	This file is executed on player side each time player (re)spawn.
*/

waitUntil {!isNull player};
waitUntil {player == player};

//features onRespawn (player side)(local)
[CTXT, "onRespawn"] call common_fnc_featInit;
//features onRespawn (server side)(remote)
["SERVER", "onRespawn"] call common_fnc_featInit;