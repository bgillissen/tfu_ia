/*
@filename: feats\assets\serverInit.sqf
Author:
	Ben
Description:
	run on server
	check which mods are available and init them,
	broadcast assets list to players
*/

#include "..\..\core\debug.hpp"

{
	_x params ["_name", "_isPresent", "_sides"];
	if ( _isPresent ) then {
		private _fnc =  format["%1_fnc_init", _name];
		if ( !isNil _fnc ) then {
			private _code = compile format["call %1", _fnc];
#ifdef DEBUG			
			private _debug = format["assets: Implenting %1", _name];
			conWhite(_debug);
#endif
			call _code;
		
#ifdef DEBUG
		} else {
			private _debug = format["assets: function %1 is not defined", _fnc];
			conWhite(_debug);
#endif
		};
	};
} count MODS;

//broadcast computed assets to clients
{
	_x params ["_prefix", "_vars", "_broadcast"];
	if ( _broadcast ) then {
		{
			publicVariable format["%1_%2", _prefix, _x];
		} count _vars;
	};
	true
} count PV;