/*
@filename: feats\intro\show.sqf
Author:
	Ben
Description:
	run on player side
	check if rule dialog has already been shown,
	if not, wait for the screen to be UNBLACKED and display the server rules dialog.
*/

if ( !isNil "INTRO_SHOWN") exitWith {};

waitUntil {
	sleep 1;
	!BLACKSCREEN
};

INTRO_SHOWN = true;
private _handle = createdialog "SRV_RULES";
