/*
@filename: core\initServer.sqf
Author:
	Ben
Description:
	this run on server side only.
*/

#ifndef INIT
#define INIT true
#define CTXT_SERVER true
#define CTXT_HEADLESS false
#define CTXT_PLAYER false
#define CTXT "SERVER"
#endif

if ( !LOCKED ) then {
	private _srvCMD =  srvCMDpass serverCommand "#lock";
	LOCKED = true;
};

//those global vars are only needed server side
BLACKLIST = [[],[],[],[],[],[],[],[]];
UAV = [];
REWARDS = [];

//features serverPreInit call/spawn
[CTXT, "preInit"] call core_fnc_featEvent;

//features serverInit call/spawn
[CTXT, "init"] call core_fnc_featEvent;

//register feature's serverOnLeave eventHandler
if ( isNil "EH_onLeave" ) then {
	EH_onLeave = addMissionEventHandler ["HandleDisconnect",{[CTXT, "onLeave", _this] call core_fnc_featEvent;}];
};

//features serverPostInit call/spawn
[CTXT, "postInit"] call core_fnc_featEvents;

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

missionNamespace setVariable ["SERVER_INIT", true, false];

sleep unlockDelay;

_srvCMD = srvCMDpass serverCommand "#unlock";

LOCKED = false;