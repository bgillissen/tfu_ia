/*
@filename: feats\curator\reload.sqf
Author:
	Ben
Description:
	run server side.
	fetch the list of players with zeus right, and make it a server global array
	see @ _settings.hpp for url, and static uids
*/

curatorUIDs = ["curator", "uids"] call BIS_fnc_GetCfgData;

if ( (["curator", "web"] call BIS_fnc_GetCfgData) == 1 ) then {
	//private _webList = [["curator", "url"] call BIS_fnc_GetCfgData] call common_fnc_urlFetchReturn;
	private _webList = false;
	if ( (typeName _webList) != "BOOL" ) then {
		curatorUIDs append [(_webList splitString " ")];
		_webList = nil;
	};
};

{
	_x params ["_uid", "_slot"];
	if ( !(_uid in curatorUIDs) ) then {
		private _gm = missionNamespace getVariable format["zeus_%1", _slot];
		unassignCurator _gm;
		curatorAssigned = curatorAssigned - [_x];
	};	
} count (curatorAssigned);

publicVariable "curatorUIDs";
publicVariable "curatorAssigned";

if ( !isDedicated ) then { 
	isCurator = [player] call curator_fnc_isCurator;
	isAssigned = [player] call curator_fnc_isAssigned;
};