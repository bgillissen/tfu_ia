/*
@filename: feats\radioFreq\playerGetIn.sqf
Author:
	Ben
Description:
	called player side when a player enter a vehicle.
	set the long range radio side and channel frequencies of that vehicle
*/

if ( !MOD_tfar ) exitWith{};
if ( (["radioFreq"] call core_fnc_getConf) == 0 ) exitWith{}; 

params ["_unit", "_pos", "_veh", "_turret"];
		
if ( _pos == "cargo" ) exitWith {}; 

if ( _veh call TFAR_fnc_hasVehicleRadio ) then {
	private _side = PLAYER_SIDE call {
		if ( _this isEqualTo west ) exitWith { "west" };
		if ( _this isEqualTo east ) exitWith { "east" };
		"independent"
	};
	_veh setVariable ["tf_side", _side, true];
	call radioFreq_fnc_setLongRange;
};