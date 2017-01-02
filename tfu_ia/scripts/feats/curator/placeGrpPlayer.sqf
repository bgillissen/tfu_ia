/*
@filename: common\curator\placeGrp.sqf
Author:
	unknown, tweaked by ben
Description:
	request server to give access to the group a player placed as zeus to the other zeus.
*/

diag_log "PLAYER placeGrpPlayer";

_this remoteExec ["curator_fnc_placeGrpServer", 2, false];

nil