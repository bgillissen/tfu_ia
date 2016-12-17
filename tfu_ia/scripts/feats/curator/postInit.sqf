/*
@filename: feats\curator\postInit.sqf
Author:
	Ben
Description:
	run once by server and clients.
	add needed eventHandlers 
*/

if ( CTXT == "SERVER" ) then {
	{    
		_x addEventHandler ["CuratorGroupPlaced", {[_this, "curator_fnc_grpPlaced", false] spawn BIS_fnc_MP}];
		_x addEventHandler ["CuratorObjectPlaced", {[_this, "curator_fnc_objPlaced", false] spawn BIS_fnc_MP}];
	} forEach allCurators;
};

if ( CTXT == "PLAYER" ) then {
	"curatorUIDs" addPublicVariableEventHandler {
		curatorUIDs = _this select 1;
		isCurator = [player] call curator_fnc_isCurator;
		isAssigned = [player] call curator_fnc_isAssigned;
	};
	"curatorAssigned" addPublicVariableEventHandler {
		curatorAssigned = _this select 1;
		isAssigned = [player] call curator_fnc_isAssigned;
	};
};