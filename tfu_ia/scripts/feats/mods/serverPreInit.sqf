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
	preprocessFileLineNumbers "feats\mods\ace\init.hpp";
};

if ( isClass(configFile >> "CfgPatches" >> "??????") ) then {
	preprocessFileLineNumbers "feats\mods\rhsAFRF\init.hpp";
};

if ( isClass(configFile >> "CfgPatches" >> "??????") ) then {
	preprocessFileLineNumbers "feats\mods\rhsGREF\init.hpp";
};

if ( isClass(configFile >> "CfgPatches" >> "??????") ) then {
	preprocessFileLineNumbers "feats\mods\rhsUSAF\init.hpp";
};

if ( isClass(configFile >> "CfgPatches" >> "????") ) then {
	preprocessFileLineNumbers "feats\mods\tfar\init.hpp";
};