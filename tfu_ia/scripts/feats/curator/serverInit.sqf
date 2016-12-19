/*
@filename: feats\curator\serverInit.sqf
Author:
	Ben
Description:
	run on server.
	initialize assigned curator stack, fech allowed curators uids 
*/

curatorAssigned = [];
publicVariable "curatorAssigned";

call curator_fnc_reload;