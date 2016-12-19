/*
@filename: feats\curator\playerPostInit.sqf
Author:
	Ben
Description:
	run on player side.
	add needed variable eventHandlers to handle a curator events
*/

"curatorUIDs" addPublicVariableEventHandler {
	curatorUIDs = _this select 1;
	isCurator = [player] call curator_fnc_isCurator;
	isAssigned = [player] call curator_fnc_isAssigned;
};
"curatorAssigned" addPublicVariableEventHandler {
	curatorAssigned = _this select 1;
	isAssigned = [player] call curator_fnc_isAssigned;
};