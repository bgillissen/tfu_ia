/*
@filename: feats\skipBriefing\preInit.sqf
Credits:
	killzonekid.com
Author:
	Ben
Description:
	this script is executed during preInit,
	it press CONTINUE button on behalf of the user using the ctrlActivate command
*/
if ( ! hasInterface) exitWith {};

if (!isNumber (missionConfigFile >> "briefing")) exitWith {};

if (getNumber (missionConfigFile >> "briefing") == 1) exitWith {};

[] spawn {
	waitUntil {
		if (getClientState isEqualTo "BRIEFING READ") exitWith {true};
		if (!isNull findDisplay _display) exitWith {
			private _dsp = [52, 53] select (isDedicated);
			ctrlActivate (findDisplay _dsp displayCtrl 1);
			findDisplay _dsp closeDisplay 1;
			true
		};
		false
	};
};