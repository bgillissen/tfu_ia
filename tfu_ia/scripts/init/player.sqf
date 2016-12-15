/*
@filename: init\player.sqf
Author:
	Ben
Description:
	this script is executed once by main init on player side only,
	it init the player side features
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

//inline calls
call compile preprocessFile "feats\restrictArty\player.sqf"; };
call compile preprocessFile "feats\radioFreq\player.sqf"; };
call compile preprocessFile "feats\earPlugs\player.sqf";
call compile preprocessFile "feats\squadHint\player.sqf";
call compile preprocessFile "feats\voiceControl\player.sqf";
call compile preprocessFile "feats\revive\player.sqf";

//threads
[] execVM "feats\vehicleCrew\thread.sqf";
[] execVM "feats\vonHint\thread.sqf";
[] execVM "feats\gearRestrictions\thread.sqf";
[] execVM "feats\baseProtection\thread.sqf";
[] execVM "feats\restrictHeli\thread.sqf";
[] execVM "feats\restrictPlane\thread.sqf";
[] execVM "feats\restrictTank\thread.sqf";
[] execVM "feats\mapTracker\thread.sqf";