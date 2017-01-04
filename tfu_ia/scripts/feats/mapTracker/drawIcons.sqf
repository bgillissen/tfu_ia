/*
@filename: feats\mapTracker\drawIcons.sqf
Credits: 
	Quiksilver
Author:
	Ben
Description:
	run on client
	draw the icons on the given ui control
*/

params ["_isGPS", "_control"];

private _text = "";
private _toshow = (playableUnits + switchableUnits + allUnitsUav);
private ["_sides", "_unit"];

if ( remoteUnit isEqualTo objNull ) then {
	_sides = missionNamespace getVariable "ALLIES";
	_unit = player;
} else {
	_sides = [side remoteUnit, [civilian]] call common_fnc_getFriends;
	_unit = remoteUnit;
	_toShow = allUnits - _toShow;
};

{
	private _veh = vehicle _x;
	//if ( (side _veh == PLAYER_SIDE) || {(captive _x)} ) then {
	if ( (side _veh) in _sides ) then {
		private _toSkip = ( _isGPS && (_x distance _unit) > MT_gpsDist );
		if ( !_toSkip ) then {
			if ( !_isGPS ) then {
				_text = [_veh] call mapTracker_fnc_iconText;
			};
			private _type = [_veh] call mapTracker_fnc_iconType;		
			private _size = [_veh] call mapTracker_fnc_iconSize;
			private _color = [_x] call mapTracker_fnc_iconColor;	
			private _pos = getPosASL _veh;		
			private _dir = getDir _x;
			if ( (_x == crew _veh select 0) || {_x in allUnitsUav} ) then {
				_control drawIcon [_type,
				                   _color,
				                   _pos,
				                   _size,
				                   _size,
				                   _dir,
				                   _text,
				                   MT_shadow,
				                   MT_textSize,
				                   MT_textFont,
				                   MT_textOffset];
			};
		};
	};
} count _toShow;