/*
@filename: core\initServer.sqf
Author:
	Ben
Description:
	this is executed once by init.sqf on server side only.
*/

#define CTXT_SERVER true
#define CTXT_HEADLESS false
#define CTXT_PLAYER false
#define CTXT "SERVER"

private _srvCMD =  srvCMDpass serverCommand "#lock";

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

//some global var needed server side
missionNamespace setVariable ["BLACKLIST", [[],[],[],[],[],[],[],[]], false];
missionNamespace setVariable ["UAV", [], false];
missionNamespace setVariable ["REWARDS", [], false];

//init map
call compile preprocessFile format["maps\%1\srvInit.sqf", worldName];

//to make arsenal configration less painfull 
call common_fnc_arsenalAuto;

//init mods
call compile preprocessFile "mods\srvInit.sqf";

//features init call/spawn
[CTXT, "init"] call core_fnc_featEvents;
//registering feature's onLeave eventHandler
addMissionEventHandler ["HandleDisconnect",{[CTXT, "onLeave", _this] call core_fnc_featEvents;}];

//broadcast computed assets to clients
{
	_x params ["_prefix", "_keys", "_broadcast"];
	if ( _broadcast ) then {
		{
			private _vname = format["%1_%2", _prefix, _x];
			missionNamespace setVariable [_vname, (missionNamespace getVariable _vname), true];
		} count _keys;
	};
} count GV;

sleep unlockDelay;

_srvCMD = srvCMDpass serverCommand "#unlock";