/*
@filename: feats\curator\srvReload.sqf
Author:
	Ben
Description:
	run server side.
	fetch the list of players with zeus right, and make it a server global array
	see @ _settings.sqf for url
*/

private ["_slot", "_found"];

curatorUIDs = htmlLoad(CURATOR_url) splitString " ";

{
	_slot = _x;
	_found = false;
	{
		if ( _x == _slot select 0) then exitWith{ _found = true; };
	} forEach(curatorUIDs);
	if ( !_found ) then {
		unassignCurator (missionNamespace getVariable format["zeus_%1", _slot select 1]);
		curatorAssigned = curatorAssigned - _slot;
	};	
} forEach(curatorAssigned);

publicVariable "curatorUIDs";
publicVariable "curatorAssigned";