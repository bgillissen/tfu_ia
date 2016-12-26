/*
@filename: feats\mods\rhsUSAF\preInit.sqf
Author:
	Ben
Description:
	run on server
	include RHS USAF assets definition
*/

missionNamespace setVariable ["MOD_rhsUSAF", true, false];
#ifdef DEBUG
	conWhite("mods: USAF is present");
#endif
#ifndef USAF_INC
#include "_include.hpp"
#endif
