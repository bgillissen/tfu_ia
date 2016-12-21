/*
@filename: core\featEvent.sqf
Author:
	Ben
Description:
	This script is executed on every context.
	propagate events to features, call or spawn required script.
*/

params ["_ctxt", "_when", "_param"];

//some basic checks for cases that can not happend
if ( CTXT_HEADLESS ) then {
	if ( _when == "onRespawn" ) exitWith{};	
};
if ( !CTXT_SERVER ) then {
	if ( _when == "onJoin" ) exitWith{};
	if ( _when == "onLeave" ) exitWith{};
};
if ( !CTXT_PLAYER ) then {
	if ( _when == "onCloseVA" ) exitWith{};
	if ( _when == "onShoot" ) exitWith{};
	if ( _when == "onBoardIn" ) exitWith{};
	if ( _when == "onTake" ) exitWith{};
};

if ( _ctxt != CTXT ) exitWith {
	//so it's a remote event to propagate
	if ( _ctxt == "SERVER" ) then _target = 2;
	if ( _ctxt == "PLAYER" ) then _target = (allPlayers - entitites "HeadlessClient_F");
	if ( _ctxt == "HEADLESS" ) then _target = entitites "HeadlessClient_F";
	[_when, _param] remoteExec ["core_fnc_featEventRemote", _target];
};

//not defined yet, we initialize it
if ( iNil "FEAT_THREADS" ) then FEAT_THREADS = [];

private _poolName = format["FEAT_%1", _when];

private _sorted = missionNamespace getVariable _poolName;

if ( isNil _sorted ) then {

	private ["_key", "_append"];

	if ( _ctxt == "SERVER" ){ _key = 1; };
	if ( _ctxt == "PLAYER" ){ _key = 2; };
	if ( _ctxt == "HEADLESS" ){ _key = 3; };

	if ( _when == "preInit" ) then _append = "PreInit";
	if ( _when == "init" ) then _append = "Init";
	if ( _when == "postInit" ) then _append = "PostInit";
	if ( _when == "onRespawn" ) then _append = "OnRespawn";
	if ( _when == "onJoin" ) then _append = "OnJoin";
	if ( _when == "onCloseVA" ) then _append = "CloseVA";
	if ( _when == "onShoot" ) then _append = "Fired";
	if ( _when == "onBoardIn" ) then _append = "BoardIn";
	if ( _when == "onTake" ) then _append = "PickUp";
	if ( _when == "onLeave" ) then _append = "OnLeave";
	if ( _when == "destroy" ) then _append = "Destroy";

	private _pool = [];
	{
		_x params ["_feat"];
		private "_e";
		if ( _when == "preInit" ) then _e = ((_x select _key) select 0);
		if ( _when == "init" ) then _e = ((_x select _key) select 1);
		if ( _when == "postInit" ) then _e = ((_x select _key) select 2);
		if ( _when == "onRespawn" ) then _e = ((_x select _key) select 3);
		if ( _when == "onJoin" || ) then _e = ((_x select _key) select 4);
		if ( _when == "onLeave" ) then _e = ((_x select _key) select 5);
		if ( _when == "onCloseVA" ) then _e = ((_x select _key) select 4);
		if ( _when == "onShoot" ) then _e = ((_x select _key) select 5);
		if ( _when == "onBoardIn" ) then _e = ((_x select _key) select 6);
		if ( _when == "onTake" ) then _e = ((_x select _key) select 7);
		if ( _when == "destroy" ) then {
			if ( _key == 1 ) then _e = ((_x select _key) select 6);
			if ( _key == 2 ) then _e = ((_x select _key) select 8);
		};
		if ( (_e select 1) > 0) then { 
			if ( _when == "destroy" ) then {
				_pool append [_feat, 1, _forEachIndex, _apppend, (_e select 0)];
			} else {
				_pool append [_feat, (_e select 1), _forEachIndex, _apppend, (_e select 0)];
			};
		};
	
	} forEach(FEATS);

	_sorted = [_pool, [], {(_x select 4)},"ASCEND"] call BIS_fnc_sortBy;
	_pool = nil;
	missionNamespace setVariable [_poolName, _sorted];

};

{
	_x params ["_feat", "_how", "_id", "_append"];
	private _fncName = format["FEAT_%1_%2", _feat, _when];
	private _code = missionNamespace getVariable _fncName;
	if( isNil _code ) then {
		private _script = format["feats\%1\%2%3%4.sqf", _feat, toLower(_ctxt), _append, ["", "Thread"] select (_how == 2)];
		_code = compile preprocessFileLineNumber _script;
		missionNamespace setVariable [_fncName, _code]; 
	};
	if ( _when == "destroy" ) then {
		{
			_x params ["_fid", "_fwhen", "_fthread"];
			if ( _id == _fid ) then { 
				[_fwhen, _fthread] call _code;
				FEAT_THREADS = FEAT_THREADS - _x; 
			};
		} count(FEAT_THREADS);
		[] call _code;
	} else {
		if ( _how == 1 ) then _param call _code;
		if ( _how == 2 ) then FEAT_THREADS append [_id, _when, (_param spawn _code)];
	};
} count(_sorted);