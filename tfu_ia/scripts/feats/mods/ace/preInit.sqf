/*
@filename: feats\mods\ace\preInit.sqf
Author:
	Ben
Description:
	Run on server
	include ACE assets definition
*/

MOD_ace = true;
#ifdef DEBUG
	conWhite("mods: ACE is present");
#endif
#ifndef ACE_INC
#include "_include.hpp"
#endif