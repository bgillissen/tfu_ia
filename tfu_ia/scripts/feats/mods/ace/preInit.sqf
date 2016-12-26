/*
@filename: feats\mods\ace\preInit.sqf
Author:
	Ben
Description:
	Run on server
	include ACE assets definition
*/

missionNamespace setVariable ["MOD_ace", true, false];
#ifdef DEBUG
	conWhite("mods: ACE is present");
#endif
#ifndef ACE_INC
#include "_include.hpp"
#endif