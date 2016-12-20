/*
@filename: feats\curator\reload.sqf
Author:
	Ben
Description:
	run server side.
	fetch the list of players with zeus right, and make it a server global array
	see @ _settings.sqf for url, and static uids
*/

private ["_slot", "_found"];

curatorUIDs = CURATOR_uids;

if ( CURATOR_web ) then {
	private _webList = [CURATOR_URL] call common_fnc_urlFetchReturn
	if ( _webList typeName != "BOOL" ) then {
		curatorUIDs append (_webList splitString " ");
		_webList = nil;
	};
};

{
	private _slot = _x;
	private _found = false;
	{
		if ( _x == _slot select 0) then exitWith{ _found = true; };
	} count (curatorUIDs);
	if ( !_found ) then {
		unassignCurator (missionNamespace getVariable format["zeus_%1", _slot select 1]);
		curatorAssigned = curatorAssigned - _slot;
	};	
} count (curatorAssigned);

publicVariable "curatorUIDs";
publicVariable "curatorAssigned";