/*
@filename: init\common.sqf
Author:
	Ben
Description:
	This script is executed by main init once on all context (server, headless client, player)
	define PARAMS_... vars, player_side, assets arrays
	init and implent the detected mods
*/

//copy mission parameters object properties into variables
{
	call compile format ["PARAMS_%1 = %2", (configName ((missionConfigFile >> "Params") select _forEachIndex)), (paramsArray _x)];
} forEach(paramsArray);

//check what is the players side
if ( PARAMS_side == 1 ) then {
	#define PLAYER_SIDE west;
} else {
	#define PLAYER_SIDE east;
}

//check if independent are ennemy to players
if ( PARAMS_indSide == 1 ) then {
	#define IND_ARE_ENEMY true
} else {
	#define IND_ARE_ENEMY false
}
//define current map setting
call compile preprocessFile format["maps\%1.sqf", toLower(worldName)];

//initialize assets arrays
UNIT_pilot = [];
UNIT_crew  = [];
UNIT_mg = [];
UNIT_at = [];
UNIT_marksman = [];
UNIT_sniper = [];
UNIT_medic = [];
UNIT_officer = [];
UNIT_arti = [];

VA_backpacks = [];
VA_items = [];
VA_weapons = [];
VA_ammo = [];

VEH_allowed_heli = [];
VEH_allowed_plane = [];
VEH_allowed_tank = [];
VEH_uav = [];
VEH_rewards = [];
VEH_supplyDrop = [];
VEH_supplyCrates = [];

IA_radioTower = [];
IA_pilot = [];
IA_cas = [];
IA_patrolGroups []
IA_sniperGroups []
IA_aaTank []
IA_arti []
IA_statics []
IA_tank []
IA_apc []
IA_car []
IA_airPatrol []
IA_garrison = [];

//detect loaded mods and init them
if ( isClass(configFile >> "CfgPatches" >> "ace_main") ) then call compile preprocessFile "mods\ace\init.sqf";
if ( isClass(configFile >> "CfgPatches" >> "??????") ) then call compile preprocessFile "mods\rhsAFRF\init.sqf"; 
if ( isClass(configFile >> "CfgPatches" >> "??????") ) then call compile preprocessFile "mods\rhsGREF\init.sqf";
if ( isClass(configFile >> "CfgPatches" >> "??????") ) then call compile preprocessFile "mods\rhsUSAF\init.sqf";
if ( isClass(configFile >> "CfgPatches" >> "????") ) then call compile preprocessFile "mods\tfar\init.sqf";

//implent detected mods
call compile preprocessFile "mods\vanilla.sqf";
if ( MOD_ace ) then call compile preprocessFile "mods\ace\implent.sqf";
if ( MOD_rhsAFRF ) then call compile preprocessFile "mods\rhsAFRF\implent.sqf"; 
if ( MOD_rhsGREF ) then call compile preprocessFile "mods\rhsGREF\implent.sqf";
if ( MOD_rhsUSAF ) then call compile preprocessFile "mods\rhsUSAF\implent.sqf";
if ( MOD_tfar ) then call compile preprocessFile "mods\tfar\implent.sqf";