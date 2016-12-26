/*
@filename: feats\mods\serverPreInit.sqf
Author:
	Ben
Description:
	run on server
	check which mods are available and preInit them
*/

#ifndef VANILLA_INC
#include "vanilla\_include.hpp"
#endif
#ifndef APEX_INC
#include "apex\_include.hpp"
#endif

{
	_x params ["_mod", "_cfg"];
	missionNamespace setVariable [format["MOD_%1", _mod], false, false];
	if ( isClass(configFile >> "CfgPatches" >> _cfg) ) then {
		call compileFinal preprocessFileLineNumbers format["feats\mods\%1\preInit.sqf", _mod];
	};
	
} count [["ace", "ace_main"], ["rhsAFRF", "patchEntry"], ["rhsGREF", "patchEntry"], ["rhsUSAF", "patchEntry"], ["tfar", "patchEntry"]];