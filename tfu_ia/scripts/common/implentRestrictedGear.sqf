/*
@filename: common\implentRestrictedGear.sqf
Author:
	Ben
Description:
	run on all context
	it is used to append given things in the restricted gear pools
	params MUST follow GV => RG definition!
	launcher, mg, sRifle, mRfile, sScope, mScope, oScope  
*/

if ( !(["restrictGear"] call core_fnc_getConf) ) ewitWith {};

private ["_filter", "_target"];

{
	_filter = ["item", "weapon"] select ( _forEachIndex <= 3 );
	_target = format["%1_%2", ((GV select RG) select 0), (((GV select RG) select 1) select _forEachIndex)]; 
	[_x, _target, _filter] call common_fnc_implent;
} forEach (_this);