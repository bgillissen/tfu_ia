/*
@filename: feats\mods\serverPreInit.sqf
Author:
	Ben
Description:
	run on server
	check which mods are available and preInit them
*/

#define MOD_ace false
#define MOD_rhsAFRF false
#define MOD_rhsGREF false
#define MOD_rhsUSAF false
#define MOD_tfar false

#include "feats\mods\vanilla\_include.hpp"
#include "feats\mods\apex\_include.hpp"

if ( isClass(configFile >> "CfgPatches" >> "ace_main") ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\ace\preInit.sqf";
};

if ( isClass(configFile >> "CfgPatches" >> "??????") ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\rhsAFRF\preInit.sqf";
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