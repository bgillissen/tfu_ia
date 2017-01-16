/*
@filename: feats\groupManagement\serverPreInit.sqf
Author:
	Ben
Description:
	run on server,
	create player's squads
*/

SQUADS = [];

{
	private _id = configName _x;
	private _name = getText (_x >> "name");
	private _color = getText (_x >> "color") call {
		if ( _this isEqualTo "Black" ) exitWith { 1 };
		if ( _this isEqualTo "Red" ) exitWith { 2 };
		if ( _this isEqualTo "Green" ) exitWith { 3 };
		if ( _this isEqualTo "Blue" ) exitWith { 4 };
		if ( _this isEqualTo "Yellow" ) exitWith { 5 };
		if ( _this isEqualTo "Orange" ) exitWith { 6 };
		7
	};
	private _group = createGroup PLAYER_SIDE;
	_group setGroupIdGlobal [_name, format["GroupColor%1", _color]];
	missionNamespace setVariable [format["SQUAD_%1", _id], _group, true];
	SQUADS pushback _group;
	true
} count ("true" configClasses (missionConfigFile >> "settings" >> "groupManagement"));
