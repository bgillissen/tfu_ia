/*
@filename: feats\earPlugs\playerPostInit.sqf
Author:
	Ben
Description:
	run on player side
	this add the key binding to plugs in/out the earplugs
	optionaly display a hint to let player know about this feature
*/

if ( (["earPlugs"] call core_fnc_getConf) == 0 ) exitWith{};

if ( MOD_ace ) exitWith {};

earPlug_state = false; 

if ( (["earPlugs", "showHint"] call BIS_fnc_GetCfgData) == 1 ) then {
	hint parseText (["earPlugs", "hint"] call BIS_fnc_GetCfgData);
};

if ( isNil "EP_EH" ) then {
	[] spawn {
		waituntil {!isnull (finddisplay 46)};
		EP_availAt = time;
		EP_EH = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call earPlugs_fnc_swapState;"];
	};
};