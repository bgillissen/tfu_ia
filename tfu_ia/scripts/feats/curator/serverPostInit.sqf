/*
@filename: feats\curator\serverPostInit.sqf
Author:
	Ben
Description:
	run on server
	add once needed eventHandlers to share placed things between curators 
*/
if ( isNil "curator_EH" ) then {
	{    
		_x addEventHandler ["CuratorGroupPlaced", {[_this, "curator_fnc_placeGrp", false] spawn BIS_fnc_MP}];
		_x addEventHandler ["CuratorObjectPlaced", {[_this, "curator_fnc_paceObj", false] spawn BIS_fnc_MP}];
		true
	} count allCurators;
	curator_EH = true;
};
