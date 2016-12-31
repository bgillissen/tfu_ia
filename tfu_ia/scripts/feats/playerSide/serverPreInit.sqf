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
missionNamespace setVariable ["PLAYER_SIDE", [east, west, independent] select (["side"] call core_fnc_getConf), true];

if ( PLAYER_SIDE isEqualTo east ) then {
#ifdef DEBUG
	diag_log "Player side is EAST";
#endif
	missionNamespace setVariable ["PLAYER_SIDETXT", "EAST", true];
	missionNamespace setVariable ["PLAYER_SIDEDSP", "OPFOR", true];
	missionNamespace setVariable ["OPFOR_ARE_ENEMY", false, true];
	missionNamespace setVariable ["BLUFOR_ARE_ENEMY", true, true];
	missionNamespace setVariable ["IND_ARE_ENEMY", [false, true] select (["indEnemy"] call core_fnc_getConf), true];
};
if ( PLAYER_SIDE isEqualTo west ) then {
#ifdef DEBUG
	diag_log "Player side is WEST";
#endif
	missionNamespace setVariable ["PLAYER_SIDETXT", "WEST", true];
	missionNamespace setVariable ["PLAYER_SIDEDSP", "BLUFOR", true];
	missionNamespace setVariable ["OPFOR_ARE_ENEMY", true, true];
	missionNamespace setVariable ["BLUFOR_ARE_ENEMY", false, true];
	missionNamespace setVariable ["IND_ARE_ENEMY", [false, true] select (["indEnemy"] call core_fnc_getConf), true];
};
if ( PLAYER_SIDE isEqualTo independent ) then {
#ifdef DEBUG
	diag_log "Player side is IND";
#endif
	missionNamespace setVariable ["PLAYER_SIDETXT", "IND", true];
	missionNamespace setVariable ["PLAYER_SIDEDSP", "INDEPENDENT", true];
	missionNamespace setVariable ["OPFOR_ARE_ENEMY", [false, true] select (["opforEnemy"] call core_fnc_getConf), true];
	missionNamespace setVariable ["BLUFOR_ARE_ENEMY", [false, true] select (["bluforEnemy"] call core_fnc_getConf), true];
};

//change friendship according to parameters
if ( (PLAYER_SIDE isEqualTo east) || (PLAYER_SIDE isEqualTo west) ) then {
	independent setFriend [west, [1, 0] select BLUFOR_ARE_ENEMY];
	west setFriend [independent, [1, 0] select BLUFOR_ARE_ENEMY];	
	independent setFriend [east, [1, 0] select OPFOR_ARE_ENEMY];
	east setFriend [independent, [1, 0] select OPFOR_ARE_ENEMY];
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

//create player's groups
{
	_x params ["_varName", "_groupID", "_color"];
	_color = _color call {
		if ( _this isEqualTo "Black" ) exitWith { 1 };
		if ( _this isEqualTo "Red" ) exitWith { 2 };
		if ( _this isEqualTo "Green" ) exitWith { 3 };
		if ( _this isEqualTo "Blue" ) exitWith { 4 };
		if ( _this isEqualTo "Yellow" ) exitWith { 5 };
		if ( _this isEqualTo "Orange" ) exitWith { 6 };
		7;
	};
	private _group = createGroup PLAYER_SIDE;
	_group setGroupIdGlobal [_groupID, format["GroupColor%1", _color]];
	missionNamespace setVariable [format["SQUAD_%1", _varName], _group, true];
} count (["squads"] call BIS_fnc_GetCfgData);