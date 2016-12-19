/*
@filename: feats\curator\serverPostInit.sqf
Author:
	Ben
Description:
	run on server
	add needed eventHandlers to share placed things between curators 
*/

{    
	_x addEventHandler ["CuratorGroupPlaced", {[_this, "curator_fnc_grpPlaced", false] spawn BIS_fnc_MP}];
	_x addEventHandler ["CuratorObjectPlaced", {[_this, "curator_fnc_objPlaced", false] spawn BIS_fnc_MP}];
} forEach allCurators;
