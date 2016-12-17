/*
@filename: init.sqf
Author:
	Ben
Description:
	run on server side by game engine on mission start
	lock the server, call init functions depending on the context (server, headless, player), unlock the server
*/

private ["_srvCMD"];

_srvCMD =  srvCMDpass serverCommand "#lock";

call core_fnc_initCommon;

if ( isServer ) then call core_fnc_initServer;

if ( !isServer && !hasInterface ) then call core_fnc_initHeadless;

if ( !isServer && hasInterface ) then call core_fnc_initPlayer;

sleep unlockDelay;

_srvCMD = srvCMDpass serverCommand "#unlock";