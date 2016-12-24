/*
@filename: feats\voiceControl\keyUp.sqf
Credit:
	KiloSwiss
Author:
	Ben
Description:
	run on player
	a key has been released
*/

if (VC_isOn) then {
	private _ctrlText = ctrlText (findDisplay 63 displayCtrl 101);
	if (VC_currentTxt != _ctrlText) then {
		[_ctrlText] call voiceControl_fnc_event;
	};
};

false