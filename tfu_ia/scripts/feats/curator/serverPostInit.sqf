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

//configuring gameMaster modules
private _totSlot = TOT_CURATOR;
for "_curSlot" from 0 to (_totSlot-1) do {
	private _gm = missionNamespace getVariable format["zeus_%1", _curSlot];
	if ( !(isNil "_gm") ) then {
		[_gm, [-1, -2, 0]] call BIS_fnc_setCuratorVisionModes;  //nightvision
		_gm setVariable ["showNotification", false];			//notification
	};
};

//grabing the list of squad members with zeus access
call curator_fnc_reload;