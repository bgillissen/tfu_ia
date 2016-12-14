/*
@filename: feats\voiceControl\keyUp.sqf
Credit:
	KiloSwiss
Author:
	Ben
Description:
	a key has been released
*/

private ["_ctrlText"];

if (VC_isOn) then {
	_ctrlText = ctrlText (findDisplay 63 displayCtrl 101);
	if (VC_currentTxt != _ctrlText) then {
		[_ctrlText] call voiceControl_fnc_event;
	};
};

false