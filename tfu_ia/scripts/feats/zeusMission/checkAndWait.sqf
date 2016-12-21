/*
@filename: feats\zeusMission\checkAndWait.sqf
Author:
	Ben
Description:
	this script is executed on server side only,
	it check for the value of zeusMission global variable
	if true, it sits there and wait for it to pass back to false  
*/

param ["_hint", "_globalSwitch"];

if ( zeusMission ) then {
	if ( _hint ) then {
		//Todo a global Hint that says that a zeus mission is in preparation
	};
	waitUntil {
		sleep 5;
		_extBool = false;
		if ( !(isNil _globalSwitch) ) then {
			private _extBool = missionNamespace getVariable _globalSwitch;
		};
		(!zeusMission || _extBool)
	};
};