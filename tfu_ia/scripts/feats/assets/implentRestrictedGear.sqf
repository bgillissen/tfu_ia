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

if ( (["restrictGear"] call core_fnc_getParam) == 0 ) exitWith {};

{
	private _filter = _forEachIndex call {
		if ( _this < 4 ) exitWith { "weapon" };
		if ( _this >= 4 && _this < 8 ) exitWith { "item" };
		"backpack"
	};
	[_x, format["%1_%2", ((PV select RG_k) select 0), (((PV select RG_k) select 1) select _forEachIndex)], _filter] call common_fnc_implent;
} forEach (_this);