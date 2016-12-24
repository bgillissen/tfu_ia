/*
@filename: feats\playerSide\serverPreInit.sqf
Author:
	Ben
Description:
	this run on server,
	define player and enemy side
	create the defined squads (see @ _settings.hpp)
*/

call playerSide_fnc_preInit;

{
	_x params ["_varName", "_groupID", "_color"];
	if ( _color == "Black" ) then _color = 1;
	if ( _color == "Red" ) then _color = 2;
	if ( _color == "Green" ) then _color = 3;
	if ( _color == "Blue" ) then _color = 4;
	if ( _color == "Yellow" ) then _color = 5;
	if ( _color == "Orange" ) then _color = 6;
	if ( _color == "Pink" ) then _color = 7;
	private _group = createGroup PLAYER_SIDE;
	_group setGroupIdGlobal [_groupID, format["GroupColor%1", _color]];
	missionNamespace setVariable [format["SQUAD_%1", _varName], _group, true];
} count SQUADS;