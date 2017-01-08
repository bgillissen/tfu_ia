/*
@filename: feats\assets\serverInit.sqf
Author:
	Ben
Description:
	run on server
	check which mods are available and init them
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