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
	private _srvCMD = srvCMDpass serverCommand "#lock";
	LOCKED = true;
};

//those global vars are only needed server side
BLACKLIST = [[],[],[],[],[],[],[],[]];
UAV = [];
REWARDS = [];

//those public vars are filled by server and then broadcasted to players
#ifndef PV_INIT
#define PV_INIT true
#define LO_empty [["", []], ["", []], ["", []], ["", []], ["", []], ["", []], "", "", "", "", "", ""]
#define RG 0
#define A 1
#define C 2
#define AV 3
#define BV 4
#define VC 5
#define BA 6
#define BALO 7
#define SD 8
#define S 9
#define RL 10
#define PV [\
			//Restricted Gear
			["RG", ["launcher", "mg", "sRfile", "mRifle", "sScope", "mScope", "oScope", "backpack"], [], true],\
			//arsenal
			["A", ["backpacks", "items", "weapons", "ammo"], [], true],\
			//supplyDrop / supportCrate cargo 
			["C", ["backpacks", "items", "weapons", "ammo", "crates"], [], true],\
			//allowed Vehicles
			["AV", ["heli", "plane", "tank"], [], true],\
			//base vehicles
			["BV", ["car", "carArmed", "apc", "tank", "aaTank", "planeCAS", "planeAA", "planeTransport", "uav",\ 
			        "heliSmall", "heliSmallArmed", "heliMedium", "heliMedEvac", "heliBig", "heliAttack",\
			        "boatSmall", "boatAttack", "boatBig", "sub", "landMedic", "repair", "fuel","ammo", "quad"], [], false],\
			//Vehicle cargo
			["VC", ["car", "carArmed", "apc", "tank", "aaTank", "planeCAS", "planeAA", "planeTransport", "uav",\ 
			        "heliSmall", "heliSmallArmed", "heliMedium", "heliMedEvac", "heliBig", "heliAttack",\
			        "boatSmall", "boatAttack", "boatBig", "sub", "landMedic", "repair", "fuel","ammo", "quad"], [], false],\
			//base atmosphere
			["BA", ["veh", "npc", "obj"], [], false],\
			//base atmosphere loadout
			["BALO", ["medic", "gear", "support"], LO_empty, false],\
			//spawn types
			["S", ["radioTower", "pGroup", "sGroup", "pilot", "crew", "officer", "garrison",\
			       "aa", "arti", "static", "cas", "tank", "apc", "car", "aPatrol"], [], false],\
			//roles loadout
			["RL", ["hq", "sl", "tl", "medic", "lmg", "hmg", "assHMG", "at", "assAT", "sniper",\ 
			        "marksman", "repair", "demo", "engineer", "grenadier", "rifleman", "jtac",\ 
			        "pilot", "mortar"], LO_empty, true]\	
           ];
#endif

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
[CTXT, "postInit"] call core_fnc_featEvents;

//broadcast computed assets to clients
{
	_x params ["_prefix", "_vars", "_dft", "_broadcast"];
	if ( _broadcast ) then {
		{
			private _vname = format["%1_%2", _prefix, _x];
			publicVariableClient _vname;
			//missionNamespace setVariable [_vname, (missionNamespace getVariable _vname), true];
		} count _vars;
	};
} count PV;

missionNamespace setVariable ["SERVER_INIT", true, false];

sleep unlockDelay;

_srvCMD = srvCMDpass serverCommand "#unlock";

LOCKED = false;