/*
@filename: common\featInit.sqf
Author:
	Ben
Description:
	This script is executed once by each context init.
	init declared features and call or spawn required script depending on context
*/

param ["_ctxt", "_where"];
private ["_key", "_prepend", "_switch", "_script"];

if ( !isNil "FEAT_INIT" ) then exitWith{};

switch(_ctxt) do {
	case "SERVER" : { _key = 1; };
	case "PLAYER" : { _key = 2; };
	case "HEADLESS" : { _key = 3; };
};

_prepend = "";
if ( _where == "onRespawn" ) then _file = "OnRespawn";
		
{
	if ( _where == "onRespawn" && CTXT != "PLAYER" ) then continue;
	_switch = 0;
	if ( _where == "init" ) then _switch = _x select _key select 0;
	if ( _where == "onRespawn" ) then _switch = _x select _key select 1;
	
	switch( _switch ) do {
		case 0 : { };
		case 1 : { 
					_script = format["feats\%1\%2%3.sqf", (_x select 0), toLower(_ctxt), _prepend];
					if ( _ctxt == "SERVER" && CTXT == "PLAYER") then {
						[[player], _script, false, false, true] call BIS_fnc_MP;
					} else {
						call compile preprocessFile _script  
					};
				 };
		case 2 : { 
					_script = format["feats\%1\%2%3Thread.sqf", (_x select 0), toLower(_ctxt), _prepend]
					if ( _ctxt == "SERVER" && CTXT == "PLAYER") then {
						[[player], _script, false, false, false] call BIS_fnc_MP;
					} else {
						[] execVM _script;   
					};
				 }; 
	};
} forEach(FEATS);