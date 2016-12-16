/*
@filename: init.sqf
Author:
	Ben
Description:
	run on server side by game engine on mission start
	lock the server, call scripts depending on the context (server, headless, player), unlock the server
*/

private ["_srvCMD"];

_srvCMD =  srvCMDpass serverCommand "#lock";

call compile preprocessFile "init\common.sqf";

if ( isServer ) then call compile preprocessFile "init\server.sqf";

if ( !isServer && !hasInterface ) then call compile preprocessFile "init\headless.sqf";

if ( !isServer && hasInterface ) then call compile preprocessFile "init\player.sqf";

sleep unlockDelay;

_srvCMD = srvCMDpass serverCommand "#unlock";