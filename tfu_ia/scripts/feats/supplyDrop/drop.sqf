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
		supplyDrop >> minChuteAltitude
		supplyDrop >> light
		supplyDrop >> msgFrom
		supplyDrop >> msgDeployed
		supplyDrop >> smoke
Return:
	nothing
*/

params ["_target", "_caller", "_id", "_args"];

_caller spawn {
	_veh = vehicle _this;

	SD_avail = false;
	publicVariable "SD_avail";
	
	private _doChute = ( ((position _veh) select 2) >= (["supplyDrop", "minChuteAltitude"] call core_fnc_getSetting) ); 
	
	private _chute = objNull;
	private ["_crate", "_posCrate"];
	if ( _doChute ) then {
		private _chuteType = PLAYER_SIDE call {
			if ( _this == west ) exitWith { "B_Parachute_02_F" };
			if ( _this == east ) exitWith { "O_Parachute_02_F" };
			"I_Parachute_02_F"
		};
		_chute = createVehicle [_chuteType, [100, 100, 200], [], 0, 'FLY'];
		_chute setPos [getPosASL _veh select 0, getPosASL _veh select 1, (getPosASL _veh select 2) - 42];
		
		_crate = createVehicle [(selectRandom SD_crates), position _chute, [], 0, 'NONE'];
		_crate attachTo [_chute, [0, 0, -1.3]];
	} else {
		_crate = createVehicle [(selectRandom SD_crates), [0,0,0], [], 0, 'NONE'];
		private _relPos = _veh call {
			if ( _this isKindOf "Helicopter" ) exitWith { [3, 1.5, -1] };
			[0, -10, 0]
		};
		_crate attachTo [_veh, _relPos];
		 detach _crate;
		_crate enableSimulationGlobal true;
	};
	private _posCrate = position _crate;
	_crate allowdamage false;
	
	[_crate, SD_backpacks, SD_items, SD_weapons, SD_ammo] call common_fnc_setCargo;

	private _from = ["supplyDrop", "msgFrom"] call core_fnc_getSetting;
	private _msg = ["supplyDrop", "msgDeployed"] call core_fnc_getSetting;
	private _cooldown = ["supplyDrop_cooldown"] call core_fnc_getParam;
	[_from, format[_msg, profileName, floor (_cooldown / 60)]] call common_fnc_globalSideChat;
	_cooldown = nil;
	_from = nil;
	_msg = nil;
	
	if ( _doChute ) then {
		waitUntil {
			sleep 0.2;
			( position _crate select 2 < 1 || isNull _chute )
		};
		detach _crate;
		_crate enableSimulationGlobal true;
		//to make it touch the ground next to the crate, it's needed or it never collapse
		_chute setPos [(_posCrate select 0) + 0.5 , (_posCrate select 1) + 0.5, (_posCrate select 2)];
	} else {
		waitUntil {
			sleep 0.2;
			(velocity _crate) params ["_x", "_y", "_z"];
			( _x < 0.1 && _y < 0.1 && _z < 0.1)
		};
	};
	
	_posCrate = position _crate;
	
	private _smoke = ["supplyDrop", "smoke"] call core_fnc_getSetting;
	_smoke = _smoke createVehicle [_posCrate select 0, _posCrate select 1, 2];
	
	private _light = ["supplyDrop", "light"] call core_fnc_getSetting;
	_light = _light createVehicle [(_posCrate select 0) + 0.5, (_posCrate select 1) + 0.5, 2];

	[[_crate, _light, _smoke], false] call curator_fnc_addEditable;
	
	SD_spawnedCrates append [[_crate, _chute, _light, _smoke]];
	publicVariable "SD_spawnedCrates";
};