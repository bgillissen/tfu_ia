/*
@filename: feats\curator\serverPostInit.sqf
Author:
	Ben
Description:
	run on server
	add once needed eventHandlers to share placed things between curators 
*/
if ( isNil "curator_SEH" ) then {
	{    
		_x addEventHandler ["CuratorGroupPlaced", {_this call curator_fnc_placeGrpServer}];
		_x addEventHandler ["CuratorObjectPlaced", {_this call curator_fnc_paceObjServer}];
		true
	} count allCurators;
	curator_SEH = true;
};