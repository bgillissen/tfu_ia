/*
@filename: feats\assets\serverPreInit.sqf
Author:
	Ben
Description:
	run on server
	check which mods are available in those we support and define their assets
*/

#include "..\..\core\debug.hpp"

MODS = [];

{
	private _name = getText(_x >> "name");
	if ( _name isEqualto "" ) then { 
		_name = (configName _x); 
	};
	private _cfgPatch = getText(_x >> "cfgPatch");
	private _sides = getArray(_x >> "sides");
	private _isPresent = true;
	if ( !(_cfgPatch isEqualto "") ) then {
		_isPresent = isClass(configFile >> "CfgPatches" >> _cfgPatch);
	};
	missionNamespace setVariable [format["MOD_%1", _name], _isPresent, true];
	MODS pushback [_name, _isPresent, _sides];
	if ( _isPresent ) then {
		#ifdef DEBUG
		private _debug = format["assets: %1 is present", _name];
		conWhite(_debug);
		#endif
		private _fnc =  format["%1_fnc_preInit", _name];
		if ( !isNil _fnc ) then {
			private _code = compile format["call %1", _fnc];
			0 = call _code;
		};
	#ifdef DEBUG
	} else {
		private _debug = format["assets: %1 is not present (%2)", _name, _cfgPatch];
		conWhite(_debug);
	#endif		
	};
} count ("true" configClasses (missionConfigFile >> "settings" >> "assets"));