/*
@filename: common\curatorEH.sqf
Author:
	unknown, tweaked by ben
Description:
	used to allow every curators to edit objects placed by an other curator.
*/

{    
	_x addEventHandler ["CuratorGroupPlaced",{[_this,"curator_fnc_grpPlaced",false] spawn BIS_fnc_MP}];
    _x addEventHandler ["CuratorObjectPlaced",{[_this,"curator_fnc_objPlaced",false] spawn BIS_fnc_MP}];
} forEach allCurators;  