/*
@filename: feats\voiceControl\keyDown.sqf
Credit:
	KiloSwiss
Author:
	Ben
Description:
	a key has been pressed
*/

if (!VC_isOn) then {
	if (!isNull findDisplay 55 && !isNull findDisplay 63) then {
		VC_isOn = true;
		[ctrlText (findDisplay 63 displayCtrl 101)] call voiceControl_fnc_event;
		findDisplay 55 displayAddEventHandler ["Unload", {VC_isOn = false;[""] call voiceControl_fnc_event;}]; 
	};
};

false