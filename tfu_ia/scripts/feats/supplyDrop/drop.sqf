/*
@filename: feats\supplyDrop\drop.sqf
Credit:
	Jester [AW]
Author:
	Ben
Description:
	run on player,
	spawn a paradropped ammobox below the player vehicle
Params:
	OBJECT, player's vehicle
Environment:
	missionNamespace:
		SD_avail
		PLAYER_SIDE
		S_crates
		SD_light
		SD_backpacks
		SD_items
		SD_weapons
		SD_ammo
		SD_crates
	vehicle:
		supplyDrop
	missionConfig:
		supplyDrop >> minAltitude
		supplyDrop >> light
		supplyDrop >> msgFrom
		supplyDrop >> msgDeployed
		supplyDrop >> smoke
Return:
	nothing
*/

params ["_veh"];

[_veh] spawn {
	params ["_veh"];
	
	SD_avail = false;
	publicVariable "SD_avail";

	private "_chuteType";
	if ( PLAYER_SIDE == west ) then {
		_chuteType = "B_Parachute_02_F";
	} else {
		_chuteType = "O_Parachute_02_F";
	};

	private _chute = createVehicle [_chuteType, [100, 100, 200], [], 0, 'FLY'];
	_chute setPos [getPosASL _veh select 0, getPosASL _veh select 1, (getPosASL _veh select 2) - 50];

	private _crate = createVehicle [(selectRandom S_crates), position _chute, [], 0, 'NONE']; 
	_crate attachTo [_chute, [0, 0, -1.3]];
	_crate allowdamage false;

	

	private _light = ["supplyDrop", "light"] call BIS_fnc_GetCfgData;
	_light = createVehicle [_light, position _chute, [], 0, 'NONE'];
	_light attachTo [_chute, [0, 0, 0]];

	[_crate, SD_backpacks, SD_items, SD_weapons, SD_ammo] call common_fnc_setCargo;

	private _from = ["supplyDrop", "msgFrom"] call BIS_fnc_GetCfgData;
	private _msg = ["supplyDrop", "msgDeployed"] call BIS_fnc_GetCfgData;
	[PLAYER_SIDE, _from] sideChat _msg;
	_from = nil;
	_msg = nil;
	
	waitUntil {
		sleep 0.2;
		( position _crate select 2 < 2 || isNull _chute )
	};

	detach _crate;
	_crate setPos [position _crate select 0, position _crate select 1, 0];
	_crate setVectorUp [0,0,1];
	_crate enableSimulationGlobal true;
	private _smoke = ["supplyDrop", "smoke"] call BIS_fnc_GetCfgData;
	_smoke = _smoke createVehicle [getPos _crate select 0, getPos _crate select 1, 5];
	
	SD_crates append [[_crate, _chute, _light, _smoke]];
	publicVariable "SD_crates";
};