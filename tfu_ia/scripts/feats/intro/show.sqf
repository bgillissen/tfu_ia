/*
@filename: feats\intro\show.sqf
Author:
	Ben
Description:
	run on player,
	spawn by feats\intro\playerPostInit.sqf
	check the server's rule dialog has not already been shown,
	if not, wait for the screen to be UNBLACKED and display it.
Params:
	none
Environment:
	missionNamespace:
		INTRO_SHOWN
		BLACKSCREEN
	ui:
		SRV_RULES
Return:
	nothing
*/

if ( !isNil "INTRO_SHOWN") exitWith {};

waitUntil {
	sleep 1;
	!BLACKSCREEN
};

INTRO_SHOWN = true;

createdialog "SRV_RULES";
