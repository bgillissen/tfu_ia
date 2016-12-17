/*
@filename: common\featInit.sqf
Author:
	Ben
Description:
	This script is executed on every context.
	propagate events to declared features, call or spawn required script.
*/

param ["_ctxt", "_when", "_param"];
private ["_key", "_prepend", "_switch", "_script"];

if ( !isNil "FEAT_INIT" ) then exitWith{};
if ( _when == "onRespawn" && CTXT != "PLAYER" ) then exitWith{};
if ( _when == "onJoin" && CTXT != "SERVER" ) then exitWith{};
if ( _when == "onLeave" && CTXT != "SERVER" ) then exitWith{};

switch(_ctxt) do {
	case "SERVER" : { _key = 1; };
	case "PLAYER" : { _key = 2; };
	case "HEADLESS" : { _key = 3; };
};

_append = "";
if ( _when == "onRespawn" ) then _append = "OnRespawn";
if ( _when == "onJoin" ) then _append = "OnJoin";
if ( _when == "onLeave" ) then _append = "OnLeave";

{
	_switch = 0;
	if ( _when == "init" ) then _switch = _x select _key select 0;
	if ( _when == "onRespawn" ) then _switch = _x select _key select 1;
	if ( _when == "onJoin" ) then _switch = _x select _key select 2;
	if ( _when == "onLeave" ) then _switch = _x select _key select 3;
	
	switch( _switch ) do {
		case 0 : { };
		case 1 : { 
					_script = format["feats\%1\%2%3.sqf", (_x select 0), toLower(_ctxt), _append];
					if ( _ctxt == "SERVER" && CTXT == "PLAYER") then {
						[_param, _script, false, false, true] call BIS_fnc_MP;
					} else {
						_param call compile preprocessFile _script  
					};
				 };
		case 2 : { 
					_script = format["feats\%1\%2%3Thread.sqf", (_x select 0), toLower(_ctxt), _append]
					if ( _ctxt == "SERVER" && CTXT == "PLAYER") then {
						[_param, _script, false, false, false] call BIS_fnc_MP;
					} else {
						_param execVM _script;   
					};
				 }; 
	};
} forEach(FEATS);