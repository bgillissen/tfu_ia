/*
@filename: feats\assetAuto\serverPreInit.sqf
Author:
	Ben
Description:
	run on server
	if assetAuto is set to 1 in mission parameters, 
	it overvewrite specific arsenal/reward/spawn parameters, 
	just to make our live easyer ;)
*/

if ( (["assetAuto"] call core_fnc_getConf) == 0 ) exitWith {};

private "_bool";
private _isTanoa = (worldName == "Tanoa");
//vanilla OPFOR
_bool = ( !OPFOR_ARE_ENEMY && !MOD_rhsAFRF  && !_isTanoa );
gear_vo_backpacks = _bool;
gear_vo_items = _bool;
gear_vo_weapons = _bool;
reward_vo = _bool;
spawn_vo = ( OPFOR_ARE_ENEMY && !MOD_rhsAFRF && !_isTanoa );
//vanilla BLUFOR
_bool = ( !BLUFOR_ARE_ENEMY && !MOD_rhsUSAF && !_isTanoa );
gear_vb_backpacks = _bool;
gear_vb_items = _bool;
gear_vb_weapons = _bool;
reward_vb = _bool;
spawn_vb = ( BLUFOR_ARE_ENEMY && !MOD_rhsUSAF && !_isTanoa );
//vanilla IND
_bool = ( !IND_ARE_ENEMY && !MOD_rhsUSAF && !_isTanoa );
gear_vi_backpacks = _bool;
gear_vi_items = _bool;
gear_vi_weapons = _bool;
reward_vi = _bool;
spawn_vi = ( IND_ARE_ENEMY && !MOD_rhsGREF && !_isTanoa );

//apex OPFOR
_bool = ( OPFOR_ARE_ENEMY && !MOD_rhsAFRF && _isTanoa  );
gear_ao_backpacks = _bool;
gear_ao_items = _bool;
gear_ao_weapons = _bool;
reward_ao = _bool;
spawn_ao = ( OPFOR_ARE_ENEMY && !MOD_rhsAFRF && _isTanoa );
//apex BLUFOR
_bool = ( !BLUFOR_ARE_ENEMY && !MOD_rhsUSAF && _isTanoa );
gear_ab_backpacks = _bool;
gear_ab_items = _bool;
gear_ab_weapons = _bool;
reward_ab = _bool;
spawn_ab = ( BLUFOR_ARE_ENEMY && !MOD_rhsUSAF && _isTanoa );
//apex IND
_bool = ( !IND_ARE_ENEMY && !MOD_rhsUSAF && _isTanoa );
gear_ai_backpacks = _bool;
gear_ai_items = _bool;
gear_ai_weapons = _bool;
reward_ai = _bool;
spawn_ai = ( IND_ARE_ENEMY && !MOD_rhsGREF && _isTanoa );

//RHS AFRF
_bool = ( !OPFOR_ARE_ENEMY && MOD_rhsAFRF );
gear_afrf_backpacks = _bool;
gear_afrf_items = _bool;
gear_afrf_weapons = _bool;
reward_afrf = _bool;
spawn_afrf = ( OPFOR_ARE_ENEMY && MOD_rhsAFRF );
//RHS USAF
_bool = ( !BLUFOR_ARE_ENEMY && MOD_rhsUSAF );
gear_usaf_backpacks = _bool;
gear_usaf_items = _bool;
gear_usaf_weapons = _bool;
reward_usaf = _bool;
spawn_usaf = ( BLUFOR_ARE_ENEMY && MOD_rhsUSAF );
//RHS GREF
_bool = ( !IND_ARE_ENEMY && MOD_rhsGREF );
gear_gref_backpacks = _bool;
gear_gref_items = _bool;
gear_gref_weapons = _bool;
reward_gref = _bool;
spawn_gref = ( IND_ARE_ENEMY && MOD_rhsGREF );