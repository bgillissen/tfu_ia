/*
@filename: feats\mods\tfar\preInit.sqf
Author:
	Ben
Description:
	run on server
	include TFAR assets definition
*/

MOD_tfar = true;
#ifdef DEBUG
	conWhite("mods: TFAR is present");
#endif
#ifndef TFAR_INC
#include "_include.hpp"
#endif
