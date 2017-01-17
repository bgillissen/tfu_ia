/*
@filename: core\featEvent.sqf
Author:
	Ben
Description:
	This script is executed on every context.
	propagate events to features, call or spawn required script.
*/

#include "debug.hpp"

params ["_ctxt", "_when", ["_arg", []]];

if ( isNil "_arg" ) then { _arg = []; };
if ( isNil "FEAT_THREADS" ) then { FEAT_THREADS = []; };

#ifdef DEBUG
private _debug = format["featEvent: %1, %2", _ctxt, _when];
conWhite(_debug);
#endif

//some basic checks for cases that can not happend
if ( CTXT_HEADLESS ) then {
	if ( _when isEqualTo "respawn" ) exitWith{};	
	if ( _when isEqualTo "killed" ) exitWith{};
};
if ( !CTXT_SERVER ) then {
	if ( _when isEqualTo "leave" ) exitWith{};
};
if ( !CTXT_PLAYER ) then {
	if ( _when isEqualTo "closeVA" ) exitWith{};
	if ( _when isEqualTo "shoot" ) exitWith{};
	if ( _when isEqualTo "getIn" ) exitWith{};
	if ( _when isEqualTo "getOut" ) exitWith{};
	if ( _when isEqualTo "switchSeat" ) exitWith{};
	if ( _when isEqualTo "take" ) exitWith{};
};

private _remote = false;
if ( (_ctxt isEqualTo "SERVER") && (!CTXT_SERVER) ) then { _remote = true; };
if ( (_ctxt isEqualTo "PLAYER") && (!CTXT_PLAYER) ) then { _remote = true; };
if ( (_ctxt isEqualTo "HEADLESS") && (!CTXT_HEADLESS) ) then { _remote = true; };
if ( _remote ) exitWith {
#ifdef DEBUG
	conWhite("featEvent: is remote");
#endif
	//so it's a remote event to propagate
	_target = call {
		if ( _ctxt isEqualTo "SERVER" ) exitWith { 2 };
		if ( _ctxt isEqualTo "PLAYER" ) exitWith { (allPlayers - entities "HeadlessClient_F") };
		(entities "HeadlessClient_F")
	};
	[_when, _arg] remoteExec ["core_fnc_featEventRemote", _target];
};

//not defined yet, we initialize it
if ( isNil "FEAT_THREADS" ) then { FEAT_THREADS = []; };

private _poolName = format["FEAT_%1_%2", _ctxt, _when];

private _pool = missionNamespace getVariable _poolName;

if ( isNil "_pool" ) then {
	_pool = [];
	private _buff = [];
	{
		if ( getNumber(_x >> _ctxt >> _when >> "enable") == 1 ) then {
			_buff pushback [(configName _x), 
			                getNumber(_x >> _ctxt >> _when >> 'thread'), 
			                getNumber(_x >> _ctxt >> _when >> 'order')];
		};
	} forEach ("true" configClasses (missionConfigFile >> "features"));

	if ( count _buff > 0 ) then {
		_buff = [_buff, [], {_x select 2}, "ASCEND"] call BIS_fnc_sortBy;
		{
			_x params ["_feat", "_thread"];
			private _fnc = format["%1_fnc_%2%3", _feat, _ctxt, _when];
			if ( isNil _fnc ) then {
				#ifdef DEBUG
				private _debug = format["featEvent: function %1 is not declared", _fnc];
				conWhite(_debug);
				#endif				
			} else {
				private _code = _thread call {
					if ( _this isEqualTo 1 ) exitWith { compile format["_this spawn %1", _fnc] };
					compile format["_this call %1", _fnc]
				};
				_pool pushback [_feat, _forEachIndex, _thread, _code];
			};
		} forEach _buff;
		_buff = nil;
	};
	missionNamespace setVariable [_poolName, _pool, false];
};

{
	_x params ["_feat", "_id", "_thread", "_code"];
	#ifdef DEBUG
	private _debug = format["featEvent: %1, %2 => %3", _ctxt, _when, _feat];
	conWhite(_debug);
	#endif
	try {
		if ( _when isEqualTo "destroy" ) then {
			{
				_x params ["_fid", "_fwhen", "_fthread"];
				if ( _id isEqualTo _fid ) then { 
					[_fwhen, _fthread] call _code;
					FEAT_THREADS = FEAT_THREADS - _x; 
				};
				true
			} count FEAT_THREADS;
			private _result = [] call _code;
		} else {
			if ( _thread isEqualTo 1 ) then { 
				FEAT_THREADS pushback [_id, _when, (_arg call _code)];
				true
			} else {
				_arg call _code;
				true
			};
		};
	} catch {
		#ifdef DEBUG
		private _debug = format["featEvent Exception caugh for : %1, %2 => %3, message: ", _ctxt, _when, _feat, _exception];
		conWhite(_debug);
		#endif		
	};
	true
} count _pool;