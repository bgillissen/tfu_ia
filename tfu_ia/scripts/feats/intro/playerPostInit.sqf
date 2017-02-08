/*
@filename: feats\intro\playerPostInit.sqf
Author:
	Ben
Description:
	run on player,
	display the server's rule dialog on join.
Params:
	none
Environment:
	missionParamaters
		intro
	missionSetting
		intro >> timeout
	missionNamespace:
		INTRO_SHOWN
		BLACKSCREEN
	ui:
		SRV_RULES
Return:
	nothing	
*/

if ( (["intro"] call core_fnc_getParam) == 0 ) exitWith {};

if !( isNil "INTRO_SHOWN" ) exitWith {};

private _uid = getPlayerUID player;
if ( ({_uid isEqualTo (_x select 0)} count memberData) > 0 ) exitWith {};

INTRO_DELAY = ["intro", "timeout"] call core_fnc_getSetting;

[] spawn {
	if !( isNil "LOCKED" ) then {
		waitUntil {
			sleep 1;
			!LOCKED
		};
	};
	waitUntil {
		sleep 1;
		!BLACKSCREEN
	};
	INTRO_SHOWN = true;
	sleep 3;
	createdialog "SRV_RULES";	
};