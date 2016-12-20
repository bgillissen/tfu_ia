/*
@filename: feats\earPlugs\playerPostInit.sqf
Author:
	Ben
Description:
	run on player side
	this add the key binding to plugs in/out the earplugs
	optionaly display a hint to let player know about
*/

if ( !(["earPlugs"] call core_fnc_getConf) ) exitWith{};
if ( MOD_ace ) exitWith {};

earPlug_state = 0; 

if ( EP_showHint ) then hint parseText (EP_hint);

if ( isNil "EP_EH" ) then {
	EP_EH = (findDisplay 46) displayAddEventHandler ["KeyDown", {[_this select 1] call earPlugs_fnc_swapSate;}];
};