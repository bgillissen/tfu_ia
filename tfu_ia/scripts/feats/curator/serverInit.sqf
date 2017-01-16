/*
@filename: feats\curator\serverInit.sqf
Author:
	Ben
Description:
	run on server.
	initialize assigned curator stack, fech allowed curators uids, 
*/

if ( isNil "curatorAssigned" ) then {
	curatorAssigned = [];
	publicVariable "curatorAssigned";
};

if ( isNil "TOT_CURATOR" ) then {
	for "_x" from 0 to 99 do {
		private _gm = missionNamespace getVariable format["zeus_%1", _x];
		if !( isNil "_gm" ) then { TOT_CURATOR = _x };
	};
	publicVariable "TOT_CURATOR";
};

//grabing the list of squad members with zeus access
call curator_fnc_reload;