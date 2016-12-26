/*
@filename: feats\playerSide\serverPreInit.sqf
Author:
	Ben
Description:
	this run on server,
	define player and enemy side
	create the defined squads (see @ _settings.hpp)
*/

//check what is the players side, TODO move into a feature playerSide
missionNamespace setVariable ["PLAYER_SIDE", [east, west] select ( ["side"] call core_fnc_getConf ), true];
missionNamespace setVariable ["ENEMY_SIDE", [west, east] select ( ["side"] call core_fnc_getConf ), true];
if ( PLAYER_SIDE isEqualTo east ) then {
	missionNamespace setVariable ["PLAYER_SIDETXT", "EAST", true];
	missionNamespace setVariable ["ENEMY_SIDETXT", "WEST", true];
} else {
	missionNamespace setVariable ["PLAYER_SIDETXT", "WEST", true];
	missionNamespace setVariable ["ENEMY_SIDETXT", "EAST", true];
};

//check if independent are ennemy to players
missionNamespace setVariable ["IND_ARE_ENEMY", [false, true] select (["indEnemy"] call core_fnc_getConf), true];
//missionNamespace setVariable ["IND_ARE_ENEMY", ["indEnemy"] call core_fnc_getConf, true];

//change independent friendship according to parameters
independent setFriend [PLAYER_SIDE, [0, 1] select IND_ARE_ENEMY];
PLAYER_SIDE setFriend [independent, [0, 1] select IND_ARE_ENEMY];
independent setFriend [ENEMY_SIDE, [1, 0] select IND_ARE_ENEMY];
ENEMY_SIDE setFriend [independent, [1, 0] select IND_ARE_ENEMY];

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