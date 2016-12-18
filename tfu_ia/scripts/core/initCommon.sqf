/*
@filename: core\initCommon.sqf
Author:
	Ben
Description:
	This script is executed by main init once on all context (server, headless client, player)
	set player side, set independant friendship, init assets containers, init and implent detected mods
*/

//check what is the players side
PLAYER_SIDE  = east;
if ( ["side"] call core_fnc_getConf ) then PLAYER_SIDE = west;

//check if independent are ennemy to players
IND_ARE_ENEMY = ( ["indEnemy"] call core_fnc_getConf );

//define current map setting
call compile preprocessFile format["maps\%1.sqf", worldName];

//initialize assets arrays
BLACKLIST = [[],[],[],[],[],[],[]];

A_backpacks = [];
A_items = [];
A_weapons = [];
A_ammo = [];

C_backpacks = [];
C_items = [];
C_weapons = [];
C_ammo = [];

AU_pilot = [];
AU_crew  = [];
AU_mg = [];
AU_at = [];
AU_marksman = [];
AU_sniper = [];
AU_medic = [];
AU_officer = [];
AU_arti = [];

AV_heli = [];
AV_plane = [];
AV_tank = [];

BV_car = []; 
BV_apc = []; 
BV_tank = [];
BV_planeCAS = [];
BV_planeAA = [];
BV_planeTransport = [];
BV_heliSmall = [];
BV_heliMedium = [];
BV_heliMedEvac = [];
BV_heliBig = [];
BV_heliAttack = []; 
BV_boatSmall = [];
BV_boatAttack = [];
BV_boatBig = [];

UAV = [];

REWARDS = [];

SUPPLY_drop = [];
SUPPLY_crates = [];

S_radioTower = [];
S_pilot = [];
S_cas = [];
S_patrolGroups = [];
S_sniperGroups = [];
S_aaTank = [];
S_arti = [];
S_statics = [];
S_tank = [];
S_apc = [];
S_car = [];
S_airPatrol = [];
S_garrison = [];

RL_hq = [];
RL_sl = [];
RL_tl = [];
RL_medic = [];
RL_lmg = [];
RL_hmg = [];
RL_assHMG = [];
RL_at = [];
RL_assAT = [];
RL_sniper = [];
RL_marksman = [];
RL_repair = [];
RL_demo = [];
RL_engineer = [];
RL_grenadier = [];
RL_rifleman = [];
RL_jtac = [];
RL_pilot = [];
RL_mortar = [];

//#define ROLES ["hq", "sl", "tl", "medic", "lmg", "hmg", "assHMG", "at", "assAT", "sniper", "marksman", "repair", "demo", "engineer", "grenadier", "rifleman", "jtac", "pilot", "mortar"];

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