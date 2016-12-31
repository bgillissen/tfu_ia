/*
@filename: feats\vonHint\playerPostInitThread.sqf
Author:
	Ben
Description:
	run on player,
	wait for screen to be "unblacked" then display periodicaly a Hint about server TS
*/

if ( (["vonHint"] call core_fnc_getConf) == 0 ) exitWith {};

waitUntil {
	sleep 1;
	!BLACKSCREEN
};

sleep (["vonHint", "initialDelay"] call BIS_fnc_GetCfgData);

private _delay = (["vonHint", "delay"] call BIS_fnc_GetCfgData);
private _ts = (["vonHint", "tsAddr"] call BIS_fnc_GetCfgData);

while { true } do {
	{
		[format[_x, _ts]] remoteExec ["common_fnc_globalHint", 0, false];
		sleep _delay;	
	} count (["vonHint", "Messages"] call BIS_fnc_GetCfgData);
};