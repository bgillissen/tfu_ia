/*
@filename: feats\mods\serverPreInit.sqf
Author:
	Ben
Description:
	run on server
	check which mods are available and preInit them
*/

MOD_ace = false;
MOD_rhsAFRF = false;
MOD_rhsGREF = false;
MOD_rhsUSAF = false;
MOD_tfar = false;

#ifndef VANILLA_INC
#include "vanilla\_include.hpp"
#endif
#ifndef APEX_INC
#include "apex\_include.hpp"
#endif

if ( isClass(configFile >> "CfgPatches" >> "ace_main") ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\ace\preInit.sqf";
};

if ( isClass(configFile >> "CfgPatches" >> "??????") ) then {
	call compileFile preprocessFileLineNumbers "feats\mods\rhsAFRF\preInit.sqf";
};

if ( isClass(configFile >> "CfgPatches" >> "??????") ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\rhsGREF\preInit.sqf";
};

if ( isClass(configFile >> "CfgPatches" >> "??????") ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\rhsUSAF\preInit.sqf";
};

if ( isClass(configFile >> "CfgPatches" >> "????") ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\tfar\preInit.sqf";
};