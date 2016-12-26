/*
@filename: feats\mods\tfar\preInit.sqf
Author:
	Ben
Description:
	run on server
	include TFAR assets definition
*/

missionNamespace setVariable ["MOD_tfar", true, false];
#ifdef DEBUG
	conWhite("mods: TFAR is present");
#endif
#ifndef TFAR_INC
#include "_include.hpp"
#endif
