/*
@filename: init\common.sqf
Author:
	Ben
Description:
	This script is executed by main init once on all context (server, headless client, player)
*/

//define parameters variables
for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do {
	call compile format
	[
		"PARAMS_%1 = %2",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};

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
VEH_rewards = [];
VEH_except_heli = [];
VEH_except_plane = [];
VEH_except_tank = [];
VEH_uav = [];
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

//detect loaded Mods
call compile preprocessFile "mods\vanilla.sqf";
if ( isClass(configFile >> "CfgPatches" >> "????") ) then call compile preprocessFile "mods\tfar.sqf";
if ( isClass(configFile >> "CfgPatches" >> "??????") ) then call compile preprocessFile "mods\rhsUSAF.sqf";
if ( isClass(configFile >> "CfgPatches" >> "??????") ) then call compile preprocessFile "mods\rhsAFRF.sqf"; 
if ( isClass(configFile >> "CfgPatches" >> "??????") ) then call compile preprocessFile "mods\rhsGREF.sqf";
if ( isClass(configFile >> "CfgPatches" >> "ace_main") ) then call compile preprocessFile "mods\ace.sqf";