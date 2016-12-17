/*
@filename: common\arsenalAuto.sqf
Author:
	Ben
Description:
	This script is executed by initCommon once on all context (server, headless client, player)
	if ArsenalAuto is set to 1 in mission parameters, 
	it overvewrite specific mod gear avaibility in the arsenals
*/

private ["_bool"];

if ( !(["ArsenalAuto"] call core_fnc_getConf) ) then exitWith{};
//vanilla BLUFOR
_bool = ( PLAYER_SIDE == west && !MOD_rhsUSAF && worldName != "Tanoa");
Arsenal_vb_backpacks = _bool;
Arsenal_vb_items = _bool;
Arsenal_vb_weapons = _bool;
//vanilla OPFOR
_bool = ( PLAYER_SIDE == east && !MOD_rhsAFRF  && worldName != "Tanoa");
Arsenal_vo_backpacks = _bool;
Arsenal_vo_items = _bool;
Arsenal_vo_weapons = _bool;
//apex BLUFOR
_bool = ( PLAYER_SIDE == west && !MOD_rhsUSAF && worldName == "Tanoa" );
Arsenal_ab_backpacks = _bool;
Arsenal_ab_items = _bool;
Arsenal_ab_weapons = _bool;
//apex OPFOR
_bool = ( PLAYER_SIDE == east && !MOD_rhsAFRF && worldName == "Tanoa" );
Arsenal_ao_backpacks = _bool;
Arsenal_ao_items = _bool;
Arsenal_ao_weapons = _bool;
//RHS AFRF
_bool = ( PLAYER_SIDE == east && MOD_rhsAFRF );
Arsenal_afrf_backpacks = _bool;
Arsenal_afrf_items = _bool;
Arsenal_afrf_weapons = _bool;
//RHS GREF
_bool = ( !IND_ARE_ENEMY && MOD_rhsGREF );
Arsenal_gref_backpacks = _bool;
Arsenal_gref_items = _bool;
Arsenal_gref_weapons = _bool;
//RHS USAF
_bool = ( PLAYER_SIDE == west && MOD_rhsUSAF );
Arsenal_usaf_backpacks = _bool;
Arsenal_usaf_items = _bool;
Arsenal_usaf_weapons = _bool;