/*
@filename: common\curator\placeObj.sqf
Author:
	unknown, tweaked by ben
Description:
	request server to give access to the object a player placed as zeus to the other zeus.
*/

_this remoteExec ["curator_fnc_placeObjServer", 2, false];

nil