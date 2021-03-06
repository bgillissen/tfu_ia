/*
@filename: feats\playerSide\serverPreInit.sqf
Author:
	Ben
Description:
	this run on server,
	define player and enemy side
	create the defined squads (see @ _settings.hpp)
*/

#include "..\..\core\debug.hpp"

//do not know why, but the first call sometimes return 0
("side" call BIS_fnc_getParamValue);

//check what is the players side
missionNamespace setVariable ["PLAYER_SIDE", [east, west, independent] select (["side"] call core_fnc_getParam), true];

if ( PLAYER_SIDE isEqualTo east ) then {
#ifdef DEBUG
	conWhite("Player side is EAST");
#endif
	missionNamespace setVariable ["PLAYER_SIDETXT", "EAST", true];
	missionNamespace setVariable ["PLAYER_SIDEDSP", "OPFOR", true];
	missionNamespace setVariable ["OPFOR_ARE_ENEMY", false, true];
	missionNamespace setVariable ["BLUFOR_ARE_ENEMY", true, true];
	missionNamespace setVariable ["IND_ARE_ENEMY", [false, true] select (["indEnemy"] call core_fnc_getParam), true];
};
if ( PLAYER_SIDE isEqualTo west ) then {
#ifdef DEBUG
	conWhite("Player side is WEST");
#endif
	missionNamespace setVariable ["PLAYER_SIDETXT", "WEST", true];
	missionNamespace setVariable ["PLAYER_SIDEDSP", "BLUFOR", true];
	missionNamespace setVariable ["OPFOR_ARE_ENEMY", true, true];
	missionNamespace setVariable ["BLUFOR_ARE_ENEMY", false, true];
	missionNamespace setVariable ["IND_ARE_ENEMY", [false, true] select (["indEnemy"] call core_fnc_getParam), true];
};
if ( PLAYER_SIDE isEqualTo independent ) then {
#ifdef DEBUG
	conWhite("Player side is IND");
#endif
	missionNamespace setVariable ["PLAYER_SIDETXT", "IND", true];
	missionNamespace setVariable ["PLAYER_SIDEDSP", "INDEPENDENT", true];
	missionNamespace setVariable ["OPFOR_ARE_ENEMY", [false, true] select (["opforEnemy"] call core_fnc_getParam), true];
	missionNamespace setVariable ["BLUFOR_ARE_ENEMY", [false, true] select (["bluforEnemy"] call core_fnc_getParam), true];
	missionNamespace setVariable ["IND_ARE_ENEMY", false, true];
};

//change friendship according to parameters
civilian setFriend [PLAYER_SIDE, 1];
PLAYER_SIDE setFriend [civilian, 1];
if ( (PLAYER_SIDE isEqualTo east) || (PLAYER_SIDE isEqualTo west) ) then {
	independent setFriend [west, [0, 1] select BLUFOR_ARE_ENEMY];
	west setFriend [independent, [0, 1] select BLUFOR_ARE_ENEMY];	
	independent setFriend [east, [0, 1] select OPFOR_ARE_ENEMY];
	east setFriend [independent, [0, 1] select OPFOR_ARE_ENEMY];
} else {
	independent setFriend [east, [1, 0] select OPFOR_ARE_ENEMY];
	east setFriend [independent, [1, 0] select OPFOR_ARE_ENEMY];
	independent setFriend [west, [1, 0] select BLUFOR_ARE_ENEMY];
	west setFriend [independent, [1, 0] select BLUFOR_ARE_ENEMY];	
	if ( BLUFOR_ARE_ENEMY && OPFOR_ARE_ENEMY ) then {
		west setFriend [east, 1];
		east setFriend [west, 1];
	};
};

//define enemies array
ENEMIES = [];
ALLIES = [];
if ( OPFOR_ARE_ENEMY ) then {
	OPFOR_ENEMY_KEY = count ENEMIES;
	ENEMIES append [east]; 
} else {
	ALLIES append [east];
};
if ( BLUFOR_ARE_ENEMY ) then {
	BLUFOR_ENEMY_KEY = count ENEMIES;
	ENEMIES append [west];
} else {
	ALLIES append [west];
};
if ( IND_ARE_ENEMY ) then {
	IND_ENEMY_KEY = count ENEMIES;
	ENEMIES append [independent]; 
} else {
	ALLIES append [independent];
};
#ifdef DEBUG
	private _debug = format["Enemies are : %1", (ENEMIES joinString ", ")];
	conWhite(_debug);
	private _debug = format["Allies are : %1", (ALLIES joinString ", ")];
		conWhite(_debug);
#endif

publicVariable "ALLIES";
publicVariable "ENEMIES";