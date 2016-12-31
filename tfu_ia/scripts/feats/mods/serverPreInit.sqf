/*
@filename: feats\mods\serverPreInit.sqf
Author:
	Ben
Description:
	run on server
	check which mods are available in those we support and define their assets
*/

#include "..\..\core\debug.hpp"

{
	_x params ["_mod", "_cfg"];
	private _isPresent = isClass(configFile >> "CfgPatches" >> _cfg);
	missionNamespace setVariable [format["MOD_%1", _mod], _isPresent, true];
	if ( _isPresent ) then {
#ifdef DEBUG
		private _debug = format["mods: %1 is present (%2)", _mod, _cfg];
		conWhite(_debug);
#endif
		private _incVar = format["%1_INC", toUpper(_mod)];
		if ( isNil _incVar ) then {
			call compileFinal preprocessFileLineNumbers format["feats\mods\%1\preInit.sqf", _mod];
			missionNamespace setVariable [_incVar, true, false];
		};
#ifdef DEBUG
	} else {
		private _debug = format["mods: %1 is not present (%2)", _mod, _cfg];
		conWhite(_debug);
#endif		
	};
} count (["mods"] call BIS_fnc_GetCfgData);