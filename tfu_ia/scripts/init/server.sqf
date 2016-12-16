/*
@filename: init\server.sqf
Author:
	Ben
Description:
	This script is executed once by main init on server side only.
*/

#define CTXT_SERVER true
#define CTXT_HEADLESS false
#define CTXT_PLAYER false
#define CTXT "SERVER"

if ( (IND_ARE_ENEMY && PLAYER_SIDE == "blufor") || (!IND_ARE_ENEMY && PLAYER_SIDE == "opfor") ) then {
	//ind against west
	independent setFriend [east, 1];
	east setFriend [independent, 1];
	independent setFriend [west, 0];
	west setFriend [independent, 0];
} else {
	//ind against east
	independent setFriend [east, 0];
	east setFriend [independent, 0];
	independent setFriend [west, 1];
	west setFriend [independent, 1];
};

//features init
[CTXT, "init"] call common_fnc_featInit;

//Invade & Annex Missions
zeusMission = false;
if ( PARAMS_AO == 1 ) then [] execVM "ia\ao\thread.sqf";
if ( PARAMS_FOB == 1 ) then [] execVM "ia\fob\thread.sqf";
if ( PARAMS_SIDE == 1 ) then [] execVM "ia\side\thread.sqf";