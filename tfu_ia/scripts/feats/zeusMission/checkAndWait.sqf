/*
@filename: feats\zeusMission\checkAndWait.sqf
Author:
	Ben
Description:
	this script is executed on server side only,
	it check for the value of zeusMission global variable
	if true, it sits there and wait for it to pass back to false  
*/

param ["_hint"];

if ( zeusMission ) then {
	if ( _hint ) then {
		//Todo a global Hint that says that a zeus mission is in preparation
	};
	waitUntil {
		sleep 5;
		!zeusMission
	};
};