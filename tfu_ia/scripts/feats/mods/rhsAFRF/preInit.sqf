/*
@filename: feats\mods\rhsAFRF\preInit.sqf
Author:
	Ben
Description:
	run on server
	include RHS AFRF assets definition
*/

missionNamespace setVariable ["MOD_rhsAFRF", true, false];
#ifdef DEBUG
	conWhite("mods: AFRF is present");
#endif
#ifndef AFRF_INC
#include "_include.hpp"
#endif
