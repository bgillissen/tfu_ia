/*
@filename: common\curator\placeObj.sqf
Author:
	unknown, tweaked by ben
Description:
	used to allow every curators to edit objects placed by an other curator.
*/

params ["_curator", "_placed"];

{
	_x addCuratorEditableObjects [[_placed],true]
} forEach (allCurators - [_curator]);

nil