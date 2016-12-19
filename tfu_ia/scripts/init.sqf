/*
@filename: init.sqf
Author:
	Ben
Description:
	run on all context by game engine on mission start
	call init functions depending on the context
*/

#define ASC true
#define DESC false

call core_fnc_initCommon;

if ( isServer ) then call core_fnc_initServer;

if ( !isServer && !hasInterface ) then call core_fnc_initHeadless;

if ( !isServer && hasInterface ) then call core_fnc_initPlayer;