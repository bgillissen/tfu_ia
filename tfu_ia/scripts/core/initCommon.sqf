/*
@filename: core\initCommon.sqf
Author:
	Ben
Description:
	This script is executed by main init once on all context (server, headless client, player)
	set player side, set independant friendship, init assets containers, init and implent detected mods
*/

//our global vars
#define RG 0
#define A 1
#define C 2
#define SD 3
#define AV 4
#define BV 5
#define S 6
#define RL 7
#define GV [\
			//restricted gear categories
			["RG", ["launcher", "mg", "sRfile", "mRifle", "sScope", "mScope", "oScope"]],\
			//arsenal types
			["A", ["backpacks", "items", "weapons", "ammo"]],\
			//cargo types
			["C", ["backpacks", "items", "weapons", "ammo"]],\
			//supply drop
			["SD", ["gears", "crates"]],\
			//allowed Vehicle types
			["AV", ["heli", "plane", "tank"]],\
			//base vehicle types
			["BV", ["car", "apc", "tank", "planeCAS", "planeAA", "planeTransport",\ 
			        "heliSmall", "heliMedium", "heliMedEvac", "heliBig", "heliAttack",\
			        "boatSmall", "boatAttack", "boatBig", "uav"]],\
			//spawn types
			["S", ["radioTower", "pGroup", "sGroup", "pilot", "crew", "officer", "garrison",\
			       "aa", "arti", "static", "cas", "tank", "apc", "car", "aPatrol"]],\
			//roles loadout
			["RL", ["hq", "sl", "tl", "medic", "lmg", "hmg", "assHMG", "at", "assAT", "sniper",\ 
			        "marksman", "repair", "demo", "engineer", "grenadier", "rifleman", "jtac",\ 
			        "pilot", "mortar"]]\	
           ];
//initialize assets global vars
{
    param ["_prefix", "_keys"];
	{
		missionNamespace setVariable [format["%1_%2", _prefix, _x], [], false];
	} count _keys;
} count GV;

//check what is the players side
PLAYER_SIDE  = east;
if ( ["side"] call core_fnc_getConf ) then PLAYER_SIDE = west;

//check if independent are ennemy to players
IND_ARE_ENEMY = ( ["indEnemy"] call core_fnc_getConf );

//blacklisted things pool
missionNamespace setVariable ["BLACKLIST", [[],[],[],[],[],[],[]], false];

//uav
missionNamespace setVariable ["UAV", [], false];

//revards
missionNamespace setVariable ["REWARDS", [], false];

//define current map settings
call compile preprocessFile format["maps\%1.sqf", worldName];

//detect loaded mods and init them
if ( isClass(configFile >> "CfgPatches" >> "ace_main") ) then call compile preprocessFile "mods\ace\init.sqf";
if ( isClass(configFile >> "CfgPatches" >> "??????") ) then call compile preprocessFile "mods\rhsAFRF\init.sqf"; 
if ( isClass(configFile >> "CfgPatches" >> "??????") ) then call compile preprocessFile "mods\rhsGREF\init.sqf";
if ( isClass(configFile >> "CfgPatches" >> "??????") ) then call compile preprocessFile "mods\rhsUSAF\init.sqf";
if ( isClass(configFile >> "CfgPatches" >> "????") ) then call compile preprocessFile "mods\tfar\init.sqf";

call common_fnc_arsenalAuto;

//implent detected mods
call compile preprocessFile "mods\vanilla.sqf";
if ( MOD_ace ) then call compile preprocessFile "mods\ace\implent.sqf";
if ( MOD_rhsAFRF ) then call compile preprocessFile "mods\rhsAFRF\implent.sqf"; 
if ( MOD_rhsGREF ) then call compile preprocessFile "mods\rhsGREF\implent.sqf";
if ( MOD_rhsUSAF ) then call compile preprocessFile "mods\rhsUSAF\implent.sqf";
if ( MOD_tfar ) then call compile preprocessFile "mods\tfar\implent.sqf";