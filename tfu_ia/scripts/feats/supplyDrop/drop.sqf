/*
@filename: feats\supplyDrop\serverThread.sqf
Credit:
	Jester [AW]
Author:
	Ben
Description:
	this script will run on client side,
	it spawn an paradroped ammobox
*/

param ["_veh"];
private ["_side", "_chuteType", "_chute", "_crate", "_light", "_smoke"];

supplyDropAvail = false;
publicVariable "supplyDropAvail";

if ( PLAYER_SIDE == "blufor" ) then {
	_side = west;
	_chuteType = "B_Parachute_02_F";
} else {
	_chuteType = "O_Parachute_02_F";
	_side = east;
};

_chute = createVehicle [_chuteType, [100, 100, 200], [], 0, 'FLY'];
_chute setPos [getPosASL _veh select 0, getPosASL _veh select 1, (getPosASL _veh select 2) - 50];

_crate = createVehicle [selectRandom VEH_supplyCrates, position _chute, [], 0, 'NONE']; 
_crate attachTo [_chute, [0, 0, -1.3]];
_crate allowdamage false;

supplyDropCrates append _crate;
publicVariable "supplyDropCrates";

_light = createVehicle [SD__light, position _chute, [], 0, 'NONE'];
_light attachTo [_chute, [0, 0, 0]];

[_crate] call common_fnc_setCargo;

[_side, SD_msgFrom] sideChat SD_msgDeployed;

waitUntil {
	position _crate select 2 < 2 || isNull _chute
};

detach _crate;
_crate setPos [position _crate select 0, position _crate select 1, 0];
_crate setVectorUp [0,0,1];
_crate enableSimulationGlobal true;
_smoke = _smokeType createVehicle [getPos _crate select 0, getPos _crate select 1, 5];
