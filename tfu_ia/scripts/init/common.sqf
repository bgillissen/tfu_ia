/*
@filename: init\common.sqf
Author:
	Ben
Description:
	This script is executed by main init once on all context (server, headless client, player)
*/

//define parameters variables
{
	call compile format ["PARAMS_%1 = %2", (configName ((missionConfigFile >> "Params") select _forEachIndex)), (paramsArray _x)];
} forEach(paramsArray);

//define known features and how/where they must be init
#define FEATS [\//folder, server[init,onRespawn], player[init,onRespawn], headless[init,onRespawn] (0: none, 1: call, 2: spawn)
				["baseProtection", 	[0,0], [1,0], [0,0]],\
				["cleanup", 		[2,0], [0,0], [0,0]],\
				["dynBillboards", 	[0,0], [0,1], [0,0]],\
				["earPlugs", 		[0,0], [1,0], [0,0]],\
				["fatigue", 		[0,0], [0,1], [0,0]],\
				["filteredArsenal", [0,0], [1,0], [0,0]],\
				["gearRestrictions",[0,0], [2,0], [0,0]],\
				["groupManagement", [1,0], [1,0], [0,0]],\
				["intro", 			[0,0], [1,0], [0,0]],\
				["loadBalance", 	[2,0], [0,0], [0,0]],\
				["mapTracker", 		[0,0], [2,0], [0,0]],\
				["radioFreq", 		[0,0], [1,1], [0,0]],\
				["restrictArty", 	[0,0], [1,0], [0,0]],\
				["restrictHeli", 	[0,0], [1,0], [0,0]],\
				["restrictPlane", 	[0,0], [1,0], [0,0]],\
				["restrictTank", 	[0,0], [1,0], [0,0]],\
				["revive",  		[1,0], [1,0], [0,0]],\
				["squadHint",  		[0,0], [1,0], [0,0]],\
				["supplyCrate",  	[0,0], [0,0], [0,0]],\
				["supplyDrop",  	[0,0], [1,1], [0,0]],\
				["va",  			[0,0], [0,0], [0,0]],\
				["vas",  			[0,0], [0,0], [0,0]],\
				["vehicleCrew", 	[0,0], [2,0], [0,0]],\
			  /*["vehicleRespawn",	[0,0], [0,0], [0,0]],\*/
				["vehicleRespawn2", [2,0], [0,0], [0,0]],\
				["viewDistance", 	[0,0], [1,0], [0,0]],\
				["voiceControl", 	[2,0], [1,0], [0,0]],\
				["vonHint", 		[0,0], [2,0], [0,0]],\
				["zeusMission", 	[0,0], [0,0], [0,0]]\
			]

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

//load detected mods assets
call compile preprocessFile "mods\vanilla.sqf";
if ( isClass(configFile >> "CfgPatches" >> "????") ) then call compile preprocessFile "mods\tfar.sqf";
if ( isClass(configFile >> "CfgPatches" >> "??????") ) then call compile preprocessFile "mods\rhsUSAF.sqf";
if ( isClass(configFile >> "CfgPatches" >> "??????") ) then call compile preprocessFile "mods\rhsAFRF.sqf"; 
if ( isClass(configFile >> "CfgPatches" >> "??????") ) then call compile preprocessFile "mods\rhsGREF.sqf";
if ( isClass(configFile >> "CfgPatches" >> "ace_main") ) then call compile preprocessFile "mods\ace.sqf";