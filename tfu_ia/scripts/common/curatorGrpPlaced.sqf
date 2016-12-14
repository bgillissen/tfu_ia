/*
@filename: common\curatorGrpPlaced.sqf
Author:
	unknown, tweaked by ben
Description:
	used to allow every curators to edit groups placed by an other curator.
*/

param ["_curator", "_placed"];

{
	_x addCuratorEditableObjects [(units _placed),true];
} forEach (allCurators - [_curator]);

nil