/*
@filename: init\server.sqf
Author:
	Ben
Description:
	This script is executed once by main init on server side only.
*/

#define CTXT_SERVER true
#define CTXT_HEADLESS false
#define CTXT_PLAYER false
#define CTXT "SERVER"

//BIS group management
["Initialize", [true]] call BIS_fnc_dynamicGroups;

//Invade & Annex Missions
if ( PARAMS_AO_enable == 1 ) then { AO_thread = [] execVM "ia\ao\thread.sqf"; };
if ( PARAMS_FOB_enable == 1 ) then { FOB_thread = [] execVM "ia\fob\thread.sqf"; };
if ( PARAMS_Side_enable == 1 ) then { SIDE_thread = [] execVM "ia\side\thread.sqf"; };

//Headless clients load balancing
[] execVM "feats\loadBalance\server.sqf";