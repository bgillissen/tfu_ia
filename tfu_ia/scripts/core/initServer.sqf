/*
@filename: core\initServer.sqf
Author:
	Ben
Description:
	this run on server side only.
*/

#include "debug.hpp"

missionNamespace setVariable ["SERVER_INIT", true, true];

if ( isNil "isLOCKED" ) then { isLOCKED = false; };
private _srvCMDpass = ["srvCMDpass"] call BIS_fnc_GetCfgData;
if ( !isLOCKED ) then {
	_srvCMDpass serverCommand "#lock";
	isLOCKED = true;
};

//those global vars are only needed server side
BLACKLIST = [[],[],[],[],[],[],[],[]];
UAV = [];
REWARDS = [];

if ( isNil "PV") then {
	//those public vars are filled by server and then some are broadcasted to players
	private _emptyLoadout = [["", []], ["", []], ["", []], ["", []], ["", []], ["", []], "", "", "", "", "", "", "", ""];
	private _vehPools = ["car", "carArmed", "apc", "tank", "aaTank", "planeCAS", "planeAA", "planeTransport", "uav", 
	                     "heliSmall", "heliSmallArmed", "heliMedium", "heliMedEvac", "heliBig", "heliAttack",
	                     "boatSmall", "boatAttack", "boatBig", "sub", "landMedic", "repair", "fuel","ammo", "quad"];  
	RG_k = 0;
	A_k = 1;
	C_k = 2;
	SD_k = 3;
	AV_k = 4;
	BV_k = 5;
	VC_k = 6;
	BA_k = 7;
	BALO_k = 8;
	S_k = 9;
	RL_k = 10;
	PV = [["RG", ["launcher", "mg", "sRifle", "mRifle", "sScope", "mScope", "oScope", "backpack"], [], true],
	      ["A", ["backpacks", "items", "weapons", "ammo"], [], true],
	      ["C", ["backpacks", "items", "weapons", "ammo"], [], true],
	      ["SD", ["backpacks", "items", "weapons", "ammo", "crates", "vehicles"], [], true],
	      ["AV", ["heli", "plane", "tank"], [], true],
	      ["BV", _vehPools, [], false],
	      ["VC", _vehPools, [], false],
	      ["BA", ["veh", "npc", "obj"], [], false],
	      ["BALO", ["medic", "gear", "support", "default"], _emptyLoadout, false],\
	      ["S", ["radioTower", "crates", "pGroup", "sGroup", "pilot", "crew", "officer", "garrison",
	             "aa", "arti", "static", "cas", "tank", "apc", "car", "carArmed", "aPatrol"], [], false],
	      ["RL", ["hq", "sl", "tl", "medic", "lmg", "hmg", "assHMG", "at", "assAT", "sniper", 
	              "marksman", "repair", "demo", "engineer", "grenadier", "rifleman", "jtac", 
	              "pilot", "mortar"], _emptyLoadout, true]];
};

//initialize/reset assets public vars
{
    _x params ["_prefix", "_vars", "_dft"];
    {
    	missionNamespace setVariable [format["%1_%2", _prefix, _x], _dft, false];
    	missionNamespace setVariable [format["%1__%2", _prefix, toUpper(_x)], _forEachIndex, false];
    } forEach _vars;
    true
} count PV;

diag_log "SERVER_PREINIT START";
//features serverPreInit call/spawn
["SERVER", "preInit"] call core_fnc_featEvent;
diag_log "SERVER_PREINIT DONE";

diag_log "SERVER_INIT START";
//features serverInit call/spawn
["SERVER", "init"] call core_fnc_featEvent;
diag_log "SERVER_INIT DONE";
//register feature's OnLeave eventHandler
if ( isNil "FEH_onLeave" ) then {
	FEH_onLeave = addMissionEventHandler ["HandleDisconnect", {["SERVER", "onLeave", _this] call core_fnc_featEvent;}];
};

diag_log "SERVER_POSTINIT START";
//features serverPostInit call/spawn
["SERVER", "postInit"] call core_fnc_featEvent;
diag_log "SERVER_POSTINIT DONE";

//broadcast computed assets to clients
{
	_x params ["_prefix", "_vars", "_dft", "_broadcast"];
	if ( _broadcast ) then {
		{
			publicVariable format["%1_%2", _prefix, _x];
		} count _vars;
	};
	true
} count PV;

missionNamespace setVariable ["SERVER_INIT", false, true];

sleep (["lockDelay"] call BIS_fnc_GetCfgData);

_srvCMDpass serverCommand "#unlock";

isLOCKED = false;