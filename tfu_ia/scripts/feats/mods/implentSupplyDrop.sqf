/*
@filename: common\implentSupplyDrop.sqf
Author:
	Ben
Description:
	run on server
	implents the given gear/crates/vehicles into the supplyDrop pool
*/

if ( (["supplyDrop"] call core_fnc_getConf) == 0 ) exitWith{};

{
	private _filter = _forEachIndex call {
		if ( _this isEqualTo 0 ) exitWith { "backpack" };
		if ( _this isEqualTo 1 ) exitWith { "item" };
		if ( _this isEqualTo 2 ) exitWith { "weapon" };
		if ( _this isEqualTo 3 ) exitWith { "ammo" };
		if ( _this isEqualTo 4 ) exitWith { "object" };
		"vehicle"
	};
	private _target = format["%1_%2",((PV select SD_k) select 0), (((PV select SD_k) select 1) select _forEachIndex) ];
	if ( _forEachIndex < 4 ) then {
		[_x, _target, _filter, 0] call common_fnc_implent;
	} else {
		[_x, _target, _filter] call common_fnc_implent;
	}
} forEach _this;