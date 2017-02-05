
curatorUIDs = [];

{
	if ( (_x select 2) == 1 ) then {
		curatorUIDs pushback (_x select 0);
	};
} forEach memberData;

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