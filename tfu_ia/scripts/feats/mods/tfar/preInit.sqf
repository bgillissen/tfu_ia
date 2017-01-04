/*
@filename: feats\mods\tfar\preInit.sqf
Author:
	Ben
Description:
	run on server
	set some TFAR settings
	implent tfar blacklist (backpack, item, weapon, ammo, veh, unit, group, object)
*/
/* useless, got to find a way to define CBA server addon settings....
//so player do not spawn with longrange radio as backpacks
profileNamespace setVariable ["tf_no_auto_long_range_radio_server", true];
profileNamespace setVariable ["tf_no_auto_long_range_radio", true];

//so player do not have Dagr in their inventory
profileNamespace setVariable ["TF_give_microdagr_to_soldier_server", false];
profileNamespace setVariable ["TF_give_microdagr_to_soldier", false];

//so player do not have radio automaticly in their invenoty
profileNamespace setVariable ["TF_give_personal_radio_to_regular_soldier_server", false];
profileNamespace setVariable ["TF_give_personal_radio_to_regular_soldier", false];

//To reduce the terrain interception coefficient
profileNamespace setVariable ["TF_terrain_interception_coefficient_server", 3];
profileNamespace setVariable ["TF_terrain_interception_coefficient", 3];
*/
private _items = ["ItemRadio"];

[[], _items, [], [], [], [], [], [], []] call common_fnc_addToBlacklists;