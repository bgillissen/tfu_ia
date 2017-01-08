/*
@filename: feats\assets\tfar\preInit.sqf
Author:
	Ben
Description:
	run on server
	set some TFAR settings
	implent tfar blacklist (backpack, item, weapon, ammo, veh, unit, group, object)
*/

// useless, got to find a way to define CBA server addon settings....
//so player do not spawn with longrange radio as backpacks
missionNamespace setVariable ["tf_no_auto_long_range_radio", true];

//so player do not have Dagr in their inventory
missionNamespace setVariable ["tf_give_microdagr_to_soldier", false];

//so player do not have radio automaticly in their invenoty
missionNamespace setVariable ["tf_give_personal_radio_to_regular_soldier", false];

//To reduce the terrain interception coefficient
missionNamespace setVariable ["tf_terrain_interception_coefficient", 3];

[[], ["ItemRadio"], [], [], [], [], [], [], []] call common_fnc_addToBlacklists;