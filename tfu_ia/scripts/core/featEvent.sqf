/*
@filename: core\featEvent.sqf
Author:
	Ben
Description:
	This script is executed on every context.
	propagate events to features, call or spawn required script.
*/

params ["_ctxt", "_when", "_param"];

#include "featEvent.hpp"

//some basic checks for cases that can not happend
if ( CTXT_HEADLESS ) then {
	if ( _when isEqualTo "onRespawn" ) exitWith{};	
};
if ( !CTXT_SERVER ) then {
	if ( _when isEqualTo "onJoin" ) exitWith{};
	if ( _when isEqualTo "onLeave" ) exitWith{};
};
if ( !CTXT_PLAYER ) then {
	if ( _when isEqualTo "onCloseVA" ) exitWith{};
	if ( _when isEqualTo "onShoot" ) exitWith{};
	if ( _when isEqualTo "onGetIn" ) exitWith{};
	if ( _when isEqualTo "onGetOut" ) exitWith{};
	if ( _when isEqualTo "onSwitchSeat" ) exitWith{};
	if ( _when isEqualTo "onTake" ) exitWith{};
};

if ( _ctxt != CTXT ) exitWith {
	//so it's a remote event to propagate
	_target = call {
		if ( _ctxt isEqualTo "SERVER" ) exitWith { 2 };
		if ( _ctxt isEqualTo "PLAYER" ) exitWith { (allPlayers - entities "HeadlessClient_F") };
		(entities "HeadlessClient_F")
	};
	[_when, _param] remoteExec ["core_fnc_featEventRemote", _target];
};

//not defined yet, we initialize it
if ( isNil "FEAT_THREADS" ) then { FEAT_THREADS = []; };

private _poolName = format["FEAT_%1", _when];

private _sorted = missionNamespace getVariable _poolName;

if ( isNil _sorted ) then {

	private ["_key", "_append"];
	_key = _ctxt call {
		if ( _this isEqualTo "SERVER" ) exitWith { 2 };
		if ( _this isEqualTo "PLAYER" ) exitWith { 3 };
		4
	};
	_append = _when call {
		if ( _this isEqualTo "preInit" ) exitWith { "PreInit" };
		if ( _this isEqualTo "init" ) exitWith { "Init" };
		if ( _this isEqualTo "postInit" ) exitWith { "PostInit" };
		if ( _this isEqualTo "onRespawn" ) exitWith { "OnRespawn" };
		if ( _this isEqualTo "onJoin" ) exitWith { "OnJoin" };
		if ( _this isEqualTo "onCloseVA" ) exitWith { "CloseVA" };
		if ( _this isEqualTo "onShoot" ) exitWith { "Fired" };
		if ( _this isEqualTo "onGetIn" ) exitWith { "GetIn" };
		if ( _this isEqualTo "onSwitchSeat" ) exitWith { "SwitchSeat" };
		if ( _this isEqualTo "onGetOut" ) exitWith {"GetOut" };
		if ( _this isEqualTo "onPickUp" ) exitWith { "PickUp" };
		if ( _this isEqualTo "onLeave" ) exitWith { "OnLeave" };
		"Destroy"
	};
	private _pool = [];
	{
		_x params ["_feat", "_path"];
		private _e = (_x select _key) call {
			if ( _when isEqualTo "preInit" ) exitWith { (_this select 0) };
			if ( _when isEqualTo "init" ) exitWith { (_this select 1) };
			if ( _when isEqualTo "postInit" ) exitWith { (_this select 2) };
			if ( _when isEqualTo "onRespawn" ) exitWith { (_this select 3) };
			if ( _when isEqualTo "onJoin" ) exitWith { (_this select 4) };
			if ( _when isEqualTo "onLeave" ) exitWith { (_this select 5) };
			if ( _when isEqualTo "onCloseVA" ) exitWith { (_this select 4) };
			if ( _when isEqualTo "onShoot" ) exitWith { (_this select 5) };
			if ( _when isEqualTo "onGetIn" ) exitWith { (_this select 6) };
			if ( _when isEqualTo "onGetOut" ) exitWith { (_this select 7) };
			if ( _when isEqualTo "onSwitchSeat" ) exitWith { (_this select 8) };
			if ( _when isEqualTo "onPickUp" ) exitWith { (_this select 9) };
			//destroy
			if ( _key isEqualTo 1 ) exitWith { (_this select 6) };
			if ( _key isEqualTo 2 ) exitWith { (_this select 10) };
		};
		if ( (_e select 1) > 0) then { 
			if ( _when isEqualTo "destroy" ) then {
				_pool append [_feat, _path, 1, _forEachIndex, _apppend, (_e select 0)];
			} else {
				_pool append [_feat, _path, (_e select 1), _forEachIndex, _apppend, (_e select 0)];
			};
		};
	
	} forEach(FEATS);

	_sorted = [_pool, [], {(_x select 5)},"ASCEND"] call BIS_fnc_sortBy;
	_pool = nil;
	missionNamespace setVariable [_poolName, _sorted];
};

{
	_x params ["_feat", "_path", "_how", "_id", "_append"];
	private _fncName = format["FEAT_%1_%2", _feat, _when];
	private _code = missionNamespace getVariable _fncName;
	if( isNil _code ) then {
		private _script = format["%1\%2\%3%4%5.sqf", _path, _feat, toLower(_ctxt), _append, ["", "Thread"] select (_how isEqualTo 2)];
		_code = compileFinal preprocessFileLineNumber _script;
		missionNamespace setVariable [_fncName, _code, false]; 
	};
	if ( _when isEqualTo "destroy" ) then {
		{
			_x params ["_fid", "_fwhen", "_fthread"];
			if ( _id isEqualTo _fid ) then { 
				[_fwhen, _fthread] call _code;
				FEAT_THREADS = FEAT_THREADS - _x; 
			};
		} count(FEAT_THREADS);
		[] call _code;
	} else {
		if ( _how isEqualTo 1 ) then { _param call _code; };
		if ( _how isEqualTo 2 ) then { FEAT_THREADS append [_id, _when, (_param spawn _code)]; };
	};
} count(_sorted);