/*
@filename: feats\mods\rhsGREF\preInit.sqf
Author:
	Ben
Description:
	run on server
	include RHS GREF assets definition
*/

missionNamespace setVariable ["MOD_rhsGREF", true, false];
#ifdef DEBUG
	conWhite("mods: GREF is present");
#endif
#ifndef GREF_INC
#include "_include.hpp"
#endif
