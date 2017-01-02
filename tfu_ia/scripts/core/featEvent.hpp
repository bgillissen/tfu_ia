/*
@filename: core\featEvent.hpp
Author:
	Ben
Description:
		included by core\featEvent.sqf
		define features and how/where/what must be executed and in which order
		name,
		path,
		server [preInit, init, postInit, onRespawn, onJoin, onLeave, destroy],
		player [preInit, init, postInit, onRespawn, closeVA, onShoot, onGetIn, onSwitchSeat, onGetOut, onTake, destroy],
		headless [preInit, init, postInit, destroy],
		[order, do] do: 0 = nothing, 1 = call, 2 = spawn
*/
//																	 SERVER										  							PLAYER						   						HEADLESS
//		 									      pre   init   post   resp   join   leave  dest       pre   init   post   resp   vaout  shoot  getIn  switch getOut  take   dest      pre    init   post   dest
#define FEATS [["assetAuto", "feats",			[[14,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["baseAtmosphere", "feats",		[[20,0],[13,1],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["baseProtection", "feats",		[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,2],[20,0],[20,0],[20,0],[10,1],[20,0],[20,0],[20,0],[20,0],[20,1]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["baseVehicle", "feats",			[[20,0],[14,1],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["curator", "feats",				[[20,0],[20,1],[20,1],[20,0],[20,1],[20,1],[20,1]], [[20,0],[20,1],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["dynBillboards", "feats",		[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["earPlugs", "feats",			[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["fatigue", "feats",				[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["gearRestrictions", "feats",	[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["groupManagement", "feats", 	[[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["hallOfShame", "feats",			[[20,0],[20,0],[20,1],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["AO", "feats\ia",	 			[[20,0],[20,0],[97,2],[20,0],[20,0],[20,0],[12,1]], [[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["FOB", "feats\ia",	 			[[20,0],[20,0],[98,2],[20,0],[20,0],[20,0],[11,1]], [[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["SIDE", "feats\ia", 			[[20,0],[20,0],[99,2],[20,0],[20,0],[20,0],[10,1]], [[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["intro", "feats",				[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[99,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["loadBalance", "feats", 		[[20,0],[20,2],[20,0],[20,0],[20,0],[20,0],[20,1]], [[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["maps", "feats",	 			[[11,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["mapTracker", "feats",			[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["mods", "feats",	 			[[12,1],[12,1],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["noRenegade", "feats", 			[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["playerSide", "feats",			[[10,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["playerSpawn", "feats",			[[20,0],[20,0],[20,0],[20,0],[20,0],[10,1],[20,0]], [[10,1],[99,1],[98,2],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["radioFreq", "feats",			[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,1],[20,1],[20,0],[20,1],[20,0],[20,0],[20,1],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["restrictArti", "feats",		[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["revive", "feats",  			[[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["roleLoadout", "feats",			[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[10,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["squadHint", "feats", 			[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,1]], [[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["startTime", "feats", 			[[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["supplyDrop", "feats", 			[[20,0],[20,2],[20,0],[20,0],[20,0],[20,0],[20,1]], [[20,0],[20,0],[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["supportCrate", "feats", 		[[20,0],[20,2],[20,0],[20,0],[20,0],[20,0],[20,1]], [[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["va", "feats",  				[[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,1]], [[20,0],[20,1],[20,0],[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["vehicleCrew", "feats", 		[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,2],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,1]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["vehicleRespawn", "feats",		[[13,1],[20,2],[20,0],[20,0],[20,0],[20,0],[20,1]], [[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["vehicleRestrictions", "feats",	[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,1],[20,1],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["viewDistance", "feats", 		[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,1],[20,0],[20,1],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["voiceControl", "feats", 		[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,2],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,1]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["vonHint", "feats", 			[[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[99,2],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,1]], [[20,0],[20,0],[20,0],[20,0]]],\
			   ["zeusMission", "feats", 		[[20,0],[20,1],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0],[20,0]], [[20,0],[20,0],[20,0],[20,0]]]]
