/*
@filename: mods\tfar\implent.sqf
Author:
	Ben
Description:
	Run once by server and players.
	implent TFAR assets
*/

//so player do not spawn with longrange radio as backpacks
tf_no_auto_long_range_radio = true;

//so player do not have Dagr in their inventory
TF_give_microdagr_to_soldier = false;

//To reduce the terrain interception coefficient
TF_terrain_interception_coefficient = 1;

//implent BLUFOR radios into arsenal pool
if ( PLAYER_SIDE == west ) exitWith {
	private _b =  call compileFinal preprocessFileLineNumbers "feats\mods\tfar\assetBlufor.sqf";
	[_b select A__BACKPACKS, _b select A__ITEMS, [], []] call mods_fnc_implentArsenal;
};

//implent OPFOR radios into arsenal pool
if ( PLAYER_SIDE == east ) exitWith {
	private _o =  call compileFinal preprocessFileLineNumbers "feats\mods\tfar\assetOpfor.sqf";
	[_o select A__BACKPACKS, _o select A__ITEMS, [], []] call mods_fnc_implentArsenal;
};

//implent IND radios into arsenal pool
if ( PLAYER_SIDE == independent ) exitWith {
	private _i =  call compileFinal preprocessFileLineNumbers "feats\mods\tfar\assetInd.sqf";
	[_i select A__BACKPACKS, _i select A__ITEMS, [], []] call mods_fnc_implentArsenal;
};