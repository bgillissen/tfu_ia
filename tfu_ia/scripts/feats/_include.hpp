/*
@filename: feats\include.hpp
Author:
	Ben
Description:
		included by game engine (description.ext)
		define features and how/where they must be init
		0: none, 1: call, 2: spawn
		[folder, server[init,onRespawn,onJoin,onLeave], player[init,onRespawn], headless[init,onRespawn]]
*/

#define FEATS [\
				["baseProtection", 		[0,0,0,0], [1,0], [0,0]],\
				["curator", 			[1,0,1,1], [1,0], [0,0]],\
				["dynBillboards", 		[0,0,0,0], [0,1], [0,0]],\
				["earPlugs", 			[0,0,0,0], [1,0], [0,0]],\
				["fatigue", 			[0,0,0,0], [0,1], [0,0]],\
				["filteredArsenal", 	[0,0,0,0], [1,0], [0,0]],\
				["gearRestrictions",	[0,0,0,0], [2,0], [0,0]],\
				["groupManagement", 	[1,0,0,0], [1,0], [0,0]],\
				["intro", 				[0,0,0,0], [1,0], [0,0]],\
				["loadBalance", 		[2,0,0,0], [0,0], [0,0]],\
				["mapTracker", 			[0,0,0,0], [2,0], [0,0]],\
				["radioFreq", 			[0,0,0,0], [1,1], [0,0]],\
				["restrictArty", 		[0,0,0,0], [1,0], [0,0]],\
				["revive",  			[1,0,0,0], [1,0], [0,0]],\
				["squadHint",  			[0,0,0,0], [1,0], [0,0]],\
				["supplyDrop",  		[0,0,0,0], [1,1], [0,0]],\
				["supportCrate",  		[0,0,0,0], [0,0], [0,0]],\
				["va",  				[0,0,0,0], [0,0], [0,0]],\
				["vas",  				[0,0,0,0], [0,0], [0,0]],\
				["vehicleCrew", 		[0,0,0,0], [2,0], [0,0]],\
				["vehicleRespawn", 		[2,0,0,0], [0,0], [0,0]],\
				["vehicleRestrictions",	[0,0,0,0], [1,0], [0,0]],\
				["viewDistance", 		[0,0,0,0], [1,0], [0,0]],\
				["voiceControl", 		[2,0,0,0], [1,0], [0,0]],\
				["vonHint", 			[0,0,0,0], [2,0], [0,0]],\
				["zeusMission", 		[1,0,0,0], [0,0], [0,0]],\
				["iaAO",	 			[2,0,0,0], [0,0], [0,0]],\
				["iaFOB",	 			[2,0,0,0], [0,0], [0,0]],\
				["iaSIDE",	 			[2,0,0,0], [0,0], [0,0]]\
			]

//some features need also an include
#include "feats\intro\_include.hpp"
#include "feats\vas\_include.hpp"
#include "feats\vehicleCrew\_include.hpp"
#include "feats\viewDistance\_include.hpp"
#include "feats\revive\_include.hpp"
