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

//grabing the list of squad members with zeus access
call curator_fnc_reload;