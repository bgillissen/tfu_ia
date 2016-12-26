/*
@filename: core\initServer.sqf
Author:
	Ben
Description:
	this run on server side only.
*/

CTXT_SERVER = true;
CTXT_HEADLESS = false;
CTXT_PLAYER = false;
CTXT = "SERVER";

SERVER_INIT = true;
publicVariable "SERVER_INIT";

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
	//those public vars are filled by server and then broadcasted to players
	private _emptyLoadout = [["", []], ["", []], ["", []], ["", []], ["", []], ["", []], "", "", "", "", "", "", "", ""];
	private _vehPools = ["car", "carArmed", "apc", "tank", "aaTank", "planeCAS", "planeAA", "planeTransport", "uav", 
	                     "heliSmall", "heliSmallArmed", "heliMedium", "heliMedEvac", "heliBig", "heliAttack",
	                     "boatSmall", "boatAttack", "boatBig", "sub", "landMedic", "repair", "fuel","ammo", "quad"];  
	RG_k = 0;
	A_k = 1;
	C_k = 2;
	AV_k = 3;
	BV_k = 4;
	VC_k = 5;
	BA_k = 6;
	BALO_k = 7;
	SD_k = 8;
	S_k = 9;
	RL_k = 10;
	PV = [["RG", ["launcher", "mg", "sRfile", "mRifle", "sScope", "mScope", "oScope", "backpack"], [], true],
	      ["A", ["backpacks", "items", "weapons", "ammo"], [], true],
	      ["C", ["backpacks", "items", "weapons", "ammo", "crates"], [], true],
	      ["AV", ["heli", "plane", "tank"], [], true],
	      ["BV", _vehPools, [], false],
	      ["VC", _vehPools, [], false],
	      ["BA", ["veh", "npc", "obj"], [], false],
	      ["BALO", ["medic", "gear", "support", "default"], _emptyLoadout, false],\
	      ["S", ["radioTower", "pGroup", "sGroup", "pilot", "crew", "officer", "garrison",
	             "aa", "arti", "static", "cas", "tank", "apc", "car", "aPatrol"], [], false],
	      ["RL", ["hq", "sl", "tl", "medic", "lmg", "hmg", "assHMG", "at", "assAT", "sniper", 
	              "marksman", "repair", "demo", "engineer", "grenadier", "rifleman", "jtac", 
	              "pilot", "mortar"], _emptyLoadout, true]];
};

//initialize/reset assets public vars
{
    _x params ["_prefix", "_vars", "_dft"];
    {
    	missionNamespace setVariable [format["%1_%2", _prefix, _x], _dft, false];
    } count _vars;
} count PV;

//features serverPreInit call/spawn
[CTXT, "preInit"] call core_fnc_featEvent;

//features serverInit call/spawn
[CTXT, "init"] call core_fnc_featEvent;

//register feature's serverOnLeave eventHandler
if ( isNil "FEH_onLeave" ) then {
	FEH_onLeave = addMissionEventHandler ["HandleDisconnect", {[CTXT, "onLeave", _this] call core_fnc_featEvent;}];
};

//features serverPostInit call/spawn
[CTXT, "postInit"] call core_fnc_featEvent;

//broadcast computed assets to clients
{
	_x params ["_prefix", "_vars", "_dft", "_broadcast"];
	if ( _broadcast ) then {
		{
			publicVariable format["%1_%2", _prefix, _x];
		} count _vars;
	};
} count PV;

SERVER_INIT = false;
publicVariable "SERVER_INIT";

sleep (["lockDelay"] call BIS_fnc_GetCfgData);

_srvCMDpass serverCommand "#unlock";

isLOCKED = false;