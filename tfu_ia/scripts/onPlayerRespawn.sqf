/*
@filename: onPlayerRespawn.sqf
Author:
	Ben
Description:
	This file is executed on player side each time player (re)spawn.
*/

waitUntil {!isNull player};
waitUntil {player == player};

//fatigue param
if (PARAMS_Fatigue == 0) then { player enableFatigue FALSE; };

//add supplyDrop action
if (PARAMS_supplyDrop == 1) then { call supplyDrop_onRespawn; };

#ifdef MOD_tfar
	//to be sure the anprc152 has not been replaced
	if ( PARAMS_radioFreqPreset == 1 ) then { call tfar_onRespawn; };
#endif

//replace right billboards texture
call compile preprocessFile "feats\dynBillboards\onRespawn.sqf";