/*
@filename: feats\earPlugs\playerPostInit.sqf
Author:
	Ben
Description:
	run on player side
	this add the key binding to plugs in/out the earplugs
	optionaly display a hint to let player know about this feature
*/

if ( !(["earPlugs"] call core_fnc_getConf) ) exitWith{};
if ( (missionNamespace getVariable "MOD_ace") ) exitWith {};

earPlug_state = false; 

if ( ["earPlugs", "showHint"] call BIS_fnc_GetCfgData ) then {
	hint parseText (["earPlugs", "hint"] call BIS_fnc_GetCfgData);
};

if ( isNil "EP_EH" ) then {
	EP_EH = (findDisplay 46) displayAddEventHandler ["KeyDown", {[_this select 1] call earPlugs_fnc_swapSate;}];
};