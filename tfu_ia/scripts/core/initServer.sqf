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

//change independent friendship according to parameters
if ( (IND_ARE_ENEMY && PLAYER_SIDE == west) || (!IND_ARE_ENEMY && PLAYER_SIDE == east) ) then {
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

//features init call/spawn
[CTXT, "init"] call core_fnc_featEvents;
//registering feature's onLeave eventHandler
addMissionEventHandler ["HandleDisconnect",{[CTXT, "onLeave", _this] call core_fnc_featEvents;}];
