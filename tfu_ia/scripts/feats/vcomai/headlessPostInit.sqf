/*
@filename: feats\vcomai\headlessPostInit.sqf
Author:
	Ben
Description:
	run on headless,
	init vcomAI
*/

VcomAI_ActiveList = [];

private _sides = ["vcomai", "sideBaseExecution"] call core_fnc_getSetting;
private _loopDelay = ["vcomai", "loopDelay"] call core_fnc_getSetting;

while { true } do {
	{
		if ( _x in VcomAi_ActiveList )  then {
			if ( (isNull _x) || !(alive _x) ) then { 
				VcomAi_ActiveList = VcomAi_ActiveList deleteAt _forEachIndex;
			};
		} else {
			if ( (local _x) && (_x getVariable ["NOAI", false]) && ((side _x) in _sides) ) then {
				[_x] execFSM "feats\vcomai\fsm\aiBehavior.fsm";
			};
			VcomAI_ActiveList pushback _x;
		};
	} forEach allUnits;
	sleep loopDelay;
};