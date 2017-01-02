/*
@filename: common\curator\placeGrp.sqf
Author:
	unknown, tweaked by ben
Description:
	used to allow every curators to edit groups placed by an other curator.
*/

params ["_curator", "_placed"];

diag_log "SERVER placeGrpServer";

{
	_x addCuratorEditableObjects [(units _placed),true];
} forEach (allCurators - [_curator]);

nil