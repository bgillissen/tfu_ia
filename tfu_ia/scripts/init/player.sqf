/*
@filename: init\player.sqf
Author:
	Ben
Description:
	This script is executed once by main init on player side only.
*/

#define CTXT_SERVER false
#define CTXT_HEADLESS false
#define CTXT_PLAYER true
#define CTXT "PLAYER"

private ["_handle"];

waitUntil {!isNull player};
waitUntil {player == player};

if ( PARAMS_intro == 1 ) then _handle = createdialog "SRV_RULES";

//BIS group management
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
//Restrict arty computer
call compile preprocessFile "feats\restrictArty\player.sqf"; };
//radioFreq
call compile preprocessFile "feats\radioFreq\player.sqf"; };
//earPlugs
call compile preprocessFile "feats\earPlugs\player.sqf";
//squadHint
call compile preprocessFile "feats\squadHint\player.sqf";
//voiceControl
call compile preprocessFile "feats\voiceControl\player.sqf";
//vehicleCrew HUD
[] execVM "feats\vehicleCrew\thread.sqf";
//vonHint
[] execVM "feats\vonHint\thread.sqf";
//gearRestrictions
[] execVM "feats\gearRestrictions\thread.sqf";
//baseProtection
[] execVM "feats\baseProtection\thread.sqf";
//restrictHeli
[] execVM "feats\restrictHeli\thread.sqf";
//restrictPlane
[] execVM "feats\restrictPlane\thread.sqf";
//restrictTank
[] execVM "feats\restrictTank\thread.sqf";
//mapTracker
[] execVM "feats\mapTracker\thread.sqf";
