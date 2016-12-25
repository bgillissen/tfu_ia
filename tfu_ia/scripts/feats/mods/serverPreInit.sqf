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
#ifdef DEBUG
	conWhite("mods: ACE is present");
#endif
	preprocessFileLineNumbers "feats\mods\ace\init.hpp";
};

if ( isClass(configFile >> "CfgPatches" >> "??????") ) then {
#ifdef DEBUG
	conWhite("mods: AFRF is present");
#endif
	preprocessFileLineNumbers "feats\mods\rhsAFRF\init.hpp";
};

if ( isClass(configFile >> "CfgPatches" >> "??????") ) then {
#ifdef DEBUG
	conWhite("mods: GREF is present");
#endif
	preprocessFileLineNumbers "feats\mods\rhsGREF\init.hpp";
};

if ( isClass(configFile >> "CfgPatches" >> "??????") ) then {
#ifdef DEBUG
	conWhite("mods: USAF is present");
#endif
	preprocessFileLineNumbers "feats\mods\rhsUSAF\init.hpp";
};

if ( isClass(configFile >> "CfgPatches" >> "????") ) then {
#ifdef DEBUG
	conWhite("mods: TFAR is present");
#endif
	preprocessFileLineNumbers "feats\mods\tfar\init.hpp";
};