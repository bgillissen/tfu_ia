/*
@filename: feats\iaSIDE\addAction.sqf
Author:
	Ben
Description:
	run on server,
	ask players to add the action needed to finish the side mission
*/

diag_log "Server addAction";

_this remoteExec ["SIDE_fnc_addActionPlayer", PLAYER_SIDE, true];