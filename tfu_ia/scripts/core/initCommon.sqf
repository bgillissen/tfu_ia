/*
@filename: core\initCommon.sqf
Author:
	Ben
Description:
	This script is executed by main init once on all context (server, headless client, player)
	init assets variables, set player side, preInit mods
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
			//Restricted Gear
			["RG", ["launcher", "mg", "sRfile", "mRifle", "sScope", "mScope", "oScope", "backpack"], true],\
			//arsenal types
			["A", ["backpacks", "items", "weapons", "ammo"], true],\
			//cargo types
			["C", ["backpacks", "items", "weapons", "ammo"], true],\
			//supply drop
			["SD", ["backpacks", "items", "weapons", "ammo", "crates"]],\
			//allowed Vehicle types
			["AV", ["heli", "plane", "tank"], true],\
			//base vehicle types
			["BV", ["car", "apc", "tank", "planeCAS", "planeAA", "planeTransport",\ 
			        "heliSmall", "heliMedium", "heliMedEvac", "heliBig", "heliAttack",\
			        "boatSmall", "boatAttack", "boatBig", "uav"], false],\
			//spawn types
			["S", ["radioTower", "pGroup", "sGroup", "pilot", "crew", "officer", "garrison",\
			       "aa", "arti", "static", "cas", "tank", "apc", "car", "aPatrol"], false],\
			//roles loadout
			["RL", ["hq", "sl", "tl", "medic", "lmg", "hmg", "assHMG", "at", "assAT", "sniper",\ 
			        "marksman", "repair", "demo", "engineer", "grenadier", "rifleman", "jtac",\ 
			        "pilot", "mortar"], true]\	
           ];

//initialize assets global vars
{
    private _prefix = _x select 0;
    private _keys = _x select 1;
    {
    	missionNamespace setVariable [format["%1_%2", _prefix, _x], [], false];
    } count _keys;
} count GV;

//check what is the players side
PLAYER_SIDE = [east, west] select ( ["side"] call core_fnc_getConf );
if ( PLAYER_SIZE isEqualTo east ){
	PLAYER_SIDETXT = "OPFOR";
} else {
	PLAYER_SIDETXT = "BLUFOR";
};

//check if independent are ennemy to players
IND_ARE_ENEMY = ( ["indEnemy"] call core_fnc_getConf );

//init map settings
call compile preprocessFile format["maps\%1\preInit.sqf", worldName];

//init mods for both players and server
call compile preprocessFile "mods\preInit.sqf";