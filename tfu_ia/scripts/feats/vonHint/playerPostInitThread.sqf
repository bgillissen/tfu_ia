/*
@filename: feats\vonHint\playerPostInitThread.sqf
Author:
	Ben
Description:
	run on player,
	wait for screen to be "unblacked" then display periodicaly a Hint about server TS
*/

if ( !(["vonHint"] call core_fnc_getConf) ) then exitWith{};

waitUntil {
	sleep 1;
	!BLACKSCREEN
};

while {true} do {
	sleep VH_delay;
	[format[VH_joinUS, VH_tsAddr]] remoteExec ["common_fnc_globalHint", 0, false];
	sleep VH_delay;
	[format[VH_noVON, VH_tsAddr] remoteExec ["common_fnc_globalHint", 0, false];
};