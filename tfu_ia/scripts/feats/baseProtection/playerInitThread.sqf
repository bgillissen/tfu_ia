/*
@filename: feats\baseProtection\playerInitThread.sqf
Author:
	Ben
Description:
	this is run on player side when a player join
	keep track of player distance from the saveZone and add/remove the eventHandler that prevent him to fire accordingly
*/

private ["_in", "_coord", "_first", "_eh"];

if ( !(["baseProtection"] call core_fnc_getConf) ) exitWith {};

_in = false;
_first = true;
_coord = getMarkerPos "SZ";

while {true} do {
	if ( _in && !_first ) then {
		if ((player distance _coord) > SZ_RADIUS) then {
			_in = false;
	        player removeEventHandler ["Fired", _eh];
		};
	}
	if ( !_in || _first ) then {
		if ((player distance _coord) < SZ_RADIUS) then { 
	        _in = true;
	        _eh = player addEventHandler ["Fired", baseProtection_fnc_fired];
		};
	};
	_first = false;
};