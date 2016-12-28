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
{
	private _veh = vehicle _x;
	if ((side _veh == PLAYER_SIDE) || {(captive _x)}) then {
		private _toSkip = ( _isGPS && (_x distance player) > MT_gpsDist );
		if ( !_toSkip ) then {
			if ( !_isGPS ) then {
				_text = [_veh] call mapTracker_fnc_iconText;
			};
			_iconType = [_veh] call mapTracker_fnc_iconType;
			_iconSize = [_veh] call mapTracker_fnc_iconSize;
			_color = [_x] call mapTracker_fnc_iconColor;	
			_pos = getPosASL _v;		
			_dir = getDir _x;		
			if (_x == crew _veh select 0 || {_x in allUnitsUav}) then {	
				_control drawIcon [_iconType,
				                   _color,
				                   _pos,
				                   _iconSize,
				                   _iconSize,
				                   _dir,
				                   _text,
				                   MT_shadow,
				                   MT_textSize,
				                   MT_textFont,
				                   MT_textOffset]
			};
		};
	};
} count (playableUnits + switchableUnits + allUnitsUav);