/*
@filename: feats\mods\rhsUSAF\preInit.sqf
Author:
	Ben
Description:
	run on server
	include RHS USAF assets definition
*/

MOD_rhsUSAF = true;
#ifdef DEBUG
	conWhite("mods: USAF is present");
#endif
#ifndef USAF_INC
#include "_include.hpp"
#endif
