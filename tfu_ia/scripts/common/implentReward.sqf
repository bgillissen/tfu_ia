/*
@filename: common\implentReward.sqf
Author:
	Ben
Description:
	run on all context
	it is used to append given vehicles to the REWARDS pool
*/

params ["_r"];

if ( (["SideMission"] call core_fnc_getConf) || (["FOBMission"] call core_fnc_getConf) ) then {
	[_r, "REWARDS", "vehicle"] call common_fnc_implent;
};