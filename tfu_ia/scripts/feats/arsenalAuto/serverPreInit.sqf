/*
@filename: feats\arsenalAuto\serverPreInit.sqf
Author:
	Ben
Description:
	this run on server
	if ArsenalAuto is set to 1 in mission parameters, 
	it overvewrite specific gear arsenal avaibility, just to make our live easyer ;)
*/

if ( (["arsenalAuto"] call core_fnc_getConf) == 0 ) exitWith {};

private "_bool";

//vanilla BLUFOR
_bool = ( PLAYER_SIDE == west && !MOD_rhsUSAF && worldName != "Tanoa");
gear_vb_backpacks = _bool;
gear_vb_items = _bool;
gear_vb_weapons = _bool;
//vanilla OPFOR
_bool = ( PLAYER_SIDE == east && !MOD_rhsAFRF  && worldName != "Tanoa");
gear_vo_backpacks = _bool;
gear_vo_items = _bool;
gear_vo_weapons = _bool;
//apex BLUFOR
_bool = ( PLAYER_SIDE == west && !MOD_rhsUSAF && worldName == "Tanoa" );
gear_ab_backpacks = _bool;
gear_ab_items = _bool;
gear_ab_weapons = _bool;
//apex OPFOR
_bool = ( PLAYER_SIDE == east && !MOD_rhsAFRF && worldName == "Tanoa" );
gear_ao_backpacks = _bool;
gear_ao_items = _bool;
gear_ao_weapons = _bool;
//RHS AFRF
_bool = ( PLAYER_SIDE == east && MOD_rhsAFRF );
gear_afrf_backpacks = _bool;
gear_afrf_items = _bool;
gear_afrf_weapons = _bool;
//RHS GREF
_bool = ( !IND_ARE_ENEMY && MOD_rhsGREF );
gear_gref_backpacks = _bool;
gear_gref_items = _bool;
gear_gref_weapons = _bool;
//RHS USAF
_bool = ( PLAYER_SIDE == west && MOD_rhsUSAF );
gear_usaf_backpacks = _bool;
gear_usaf_items = _bool;
gear_usaf_weapons = _bool;