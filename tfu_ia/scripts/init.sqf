/*
@filename: init.sqf
Author:
	Ben
Description:
	Execute different scripts depending on the context (server, headless client, player)
*/

call compile preprocessFile "init\common.sqf";

if ( isServer ) then { call compile preprocessFile "init\server.sqf"; };

if ( !isServer ) then { call compile preprocessFile "init\notserver.sqf"; };

if ( !isServer && !hasInterface ) then { call compile preprocessFile "init\headless.sqf"; };

if ( !isServer && hasInterface ) then { call compile preprocessFile "init\player.sqf"; };

