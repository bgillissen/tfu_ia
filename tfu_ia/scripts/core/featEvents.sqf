/*
@filename: common\featInit.sqf
Author:
	Ben
Description:
	This script is executed on every context.
	propagate events to declared features, call or spawn required script.
*/

params ["_ctxt", "_when", "_param"];

if ( _when == "onRespawn" && CTXT == "HEADLESS" ) then exitWith{};
if ( _when == "onJoin" && CTXT != "SERVER" ) then exitWith{};
if ( _when == "onLeave" && CTXT != "SERVER" ) then exitWith{};

private _key;
if ( _ctxt == "SERVER" ){ _key = 1; };
if ( _ctxt == "PLAYER" ){ _key = 2; };
if ( _ctxt == "HEADLESS" ){ _key = 3; };

private _append = "";
if ( _when == "preInit" ) then _append = "PreInit";
if ( _when == "init" ) then _append = "Init";
if ( _when == "postInit" ) then _append = "PostInit";
if ( _when == "onRespawn" ) then _append = "OnRespawn";
if ( _when == "onJoin" ) then _append = "OnJoin";
if ( _when == "onLeave" ) then _append = "OnLeave";

private _pool = [];
{
	private _e;
	if ( _when == "preInit" ) then _e = ((_x select _key) select 0);
	if ( _when == "init" ) then _e = ((_x select _key) select 1);
	if ( _when == "postInit" ) then _e = ((_x select _key) select 2);
	if ( _when == "onRespawn" ) then _e = ((_x select _key) select 3);
	if ( _when == "onJoin" ) then _e = ((_x select _key) select 4);
	if ( _when == "onLeave" ) then _e = ((_x select _key) select 5);
	if ( (_e select 1) > 0) then { _pool append [(_x select 0), _e]; };
} forEach(FEATS);

private _sorted = [_pool,[],{((_x select 1) select 0)},"ASCEND"] call BIS_fnc_sortBy;

{
	_x params ["_feat", "_order", "_switch"];
	if ( _switch == 1 ) then { 
		private _script = format["feats\%1\%2%3.sqf", _feat, toLower(_ctxt), _append];
		if ( _ctxt == "SERVER" && CTXT == "PLAYER") then {
			[_param, _script, false, false, true] call BIS_fnc_MP;
		} else {
			_param call compile preprocessFile _script  
		};
	};
	if ( _switch == 2 ) then { 
		private _script = format["feats\%1\%2%3Thread.sqf", _feat, toLower(_ctxt), _append];
		if ( _ctxt == "SERVER" && CTXT == "PLAYER") then {
			[_param, _script, false, false, false] call BIS_fnc_MP;
		} else {
			_param execVM _script;   
		};
	}; 
} forEach(_pool);