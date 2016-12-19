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

{
	private _filter;
	if ( _forEachIndex < 4 ) then _filter = "weapon";
	if ( _forEachIndex >= 4 && _forEachIndex < 7) then _filter = "item";
	if ( _forEachIndex >= 7 ) then _filter = "backpack";
	[_x, format["%1_%2", ((GV select RG) select 0), (((GV select RG) select 1) select _forEachIndex)], _filter] call common_fnc_implent;
} forEach (_this);