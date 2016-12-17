/*
@filename: feats\curator\server.sqf
Author:
	Ben
Description:
	run once by server.
	initialize assigned curator stack, fech allowed curators uids 
*/

curatorAssigned = [];
publicVariable "curatorAssigned";

call curator_fnc_reload;