/*
@filename: feats\curator\playerInit.sqf
Author:
	Ben
Description:
	run on player.
	add once needed variable eventHandlers to handle a curator events
*/

if ( isNil "curator_EH" ) then {
	"curatorUIDs" addPublicVariableEventHandler {
		curatorUIDs = _this select 1;
		isCurator = [player] call curator_fnc_isCurator;
		isAssigned = [player] call curator_fnc_isAssigned;
	};
	"curatorAssigned" addPublicVariableEventHandler {
		curatorAssigned = _this select 1;
		isAssigned = [player] call curator_fnc_isAssigned;
	};
	curator_EH = true;
};