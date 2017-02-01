/*
@filename: feats\gearRestriction\playerInit.sqf
Author:
	Ben
Description:
	run on player side,
	restrict avaibility of the artillery computer to the player with an arti role
	apply restrictions once player get out of the Firing Range
*/

if ( (["restrictGear"] call core_fnc_getParam) == 0 ) exitWith {
	enableEngineArtillery true;
};

if ( (["restrictArti"] call core_fnc_getParam) == 1 ) then {
	private _allowed = (["gearRestrictions", "artiRoles"] call core_fnc_getSetting);
	enableEngineArtillery ((player getVariable "role") in _allowed);
} else {
	enableEngineArtillery true;
};

private _delay = (["gearRestrictions", "loopDelay"] call core_fnc_getSetting);
private _inFR = false;
private _wasInFR = false;

while { true }  do {
	_inFR = ( (player distance (getMarkerPos "FR")) < FR_RADIUS );  
	if ( _inFR ) then { 
		_wasInFR = true; 
	} else {
		if ( _wasInFR ) then {
			call gearRestrictions_fnc_checkGears
			_wasInFR = false;
		};
	};
	sleep _delay;
};