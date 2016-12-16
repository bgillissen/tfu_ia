/*
@filename: ia\fob\thread.sqf
Author:
	Ben
Description:
	this script is executed once on server side only,
	it keeps track of the active FOB thread, and spawn a new one when needed 
*/

private ["_mkey"];

while( true ) do {
	
	waitUntil {
		private ["_out"];
		sleep 2;
		_out = true;
		if ( isNil AO_zone ) then {
			_out = false;
		} else {
			if ( (count FOB_markers select AO_zone) == 0 ) _out = false;
		};
		_out
	};
	
	_mkey =  floor random count FOB_markers select AO_zone;
	FOB_marker = FOB_markers select AO_zone select _mkey;
	
	[false] call zeusMission_fnc_checkAndWait;
	FOB = true;
	_thread = spawn { [_x] call FOB_fnc_start; };
	waitUntil {
		sleep IA_checkDelay;
		scriptDone _thread
	};
	FOB = false;
	sleep IA_loopDelay;	
};