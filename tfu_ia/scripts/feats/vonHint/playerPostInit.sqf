/*
@filename: feats\vonHint\playerPostInitThread.sqf
Author:
	Ben
Description:
	run on player,
	wait for screen to be "unblacked" then display periodicaly a Hint about server TS
*/

if ( (["vonHint"] call core_fnc_getParam) == 0 ) exitWith {};

waitUntil {
	sleep 1;
	!BLACKSCREEN
};

sleep (["vonHint", "initialDelay"] call core_fnc_getSetting);

private _delay = (["vonHint", "delay"] call core_fnc_getSetting);
private _ts = (["vonHint", "tsAddr"] call core_fnc_getSetting);

while { true } do {
	{
		hint parseText format[_x, _ts];
		sleep _delay;	
	} count (["vonHint", "Messages"] call core_fnc_getSetting);
};