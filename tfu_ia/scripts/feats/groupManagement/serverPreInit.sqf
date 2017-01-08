//create player's groups

//TO REWRITE
/*
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
} count (["squads"] call core_fnc_getSetting);
*/