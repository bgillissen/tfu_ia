/*
@filename: mods\ace.sqf
Author:
	Ben
Description:
	Run once by server and players.
	define ACE assets we are going to use
	later probably the modules settings also
*/

#define MOD_ace true;

#define ACE_items []
#define ACE_cargoItems []

[[], [], [[], ACE_items, [], []], [[], ACE_cargoItems, [], []], [], [], [], []] call common_fnc_implentAssets;

