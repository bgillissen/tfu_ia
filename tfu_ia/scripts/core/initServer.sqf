/*
@filename: core\initServer.sqf
Author:
	Ben
Description:
	this run on server side only.
*/

#include "debug.hpp"
#define emptyLoadout [["", []], ["", []], ["", []], ["", []], ["", []], ["", []], "", "", "", "", "", "", "", ""]
#define dftCargo [[],[],[],[]]
#define dftSpawn [[],[]]
#define dftVal []

missionNamespace setVariable ["SERVER_INIT", true, true];

if ( isNil "PARAMETERS" ) then { PARAMETERS = []; };

if ( isNil "PV") then {
	//those public vars are filled by server and then some are broadcasted to players
	private _vehPools = ["car", "carArmed", "apc", "tank", "aaTank", "planeCAS", "planeAA", "planeTransport", "uav", 
	                     "heliSmall", "heliSmallArmed", "heliMedium", "heliMedEvac", "heliBig", "heliAttack",
	                     "boatSmall", "boatAttack", "boatBig", "sub", "landMedic", "repair", "fuel","ammo", "quad"];  
	RG_k = 0;
	A_k = 1;
	SD_k = 2;
	AV_k = 3;
	BV_k = 4;
	VC_k = 5;
	BA_k = 6;
	BALO_k = 7;
	S_k = 8;
	RL_k = 9;
	PV = [["RG", ["launcher", "mg", "sRifle", "mRifle", "sScope", "mScope", "oScope", "backpack"], true],
	      ["A", ["backpacks", "items", "weapons", "ammo"], true],
	      ["SD", ["backpacks", "items", "weapons", "ammo", "crates", "vehicles"], true],
	      ["AV", ["heli", "plane", "tank"], true],
	      ["BV", _vehPools, false],
	      ["VC", _vehPools, false],
	      ["BA", ["veh", "npc", "obj"], true],
	      ["BALO", ["medic", "gear", "support", "default"], false],
	      ["S", ["radioTower", "crates", "pGroup", "sGroup", "pilot", "crew", "officer", "garrison",
	             "aa", "arti", "static", "cas", "tank", "apc", "car", "carArmed", "aPatrol"], false],
	      ["RL", ["hq", "sl", "tl", "medic", "lmg", "hmg", "assHMG", "at", "assAT", "sniper", 
	              "marksman", "repair", "demo", "engineer", "grenadier", "rifleman", "jtac", 
	              "hPilot", "jPilot", "mortar"], true]];
};

//initialize/reset assets public vars
{
    _x params ["_prefix", "_vars"];
    {
    	if ( _prefix isEqualTo "RL" || _prefix isEqualTo "BALO" ) then {
    		missionNamespace setVariable [format["%1_%2", _prefix, _x], emptyLoadout, false];
    	} else {
    		if ( _prefix isEqualTo "VC" ) then {
    			missionNamespace setVariable [format["%1_%2", _prefix, _x], dftCargo, false];
    		} else {
    			if ( _prefix isEqualTo "S" ) then {
    				missionNamespace setVariable [format["%1_%2", _prefix, _x], dftSpawn, false];
    			} else {
    				missionNamespace setVariable [format["%1_%2", _prefix, _x], dftVal, false];
    			};
    		};
    	};
    	if ( _prefix isEqualTo "A" ) then {
    		missionNamespace setVariable [format["VC__%1", toUpper(_x)], _forEachIndex, false];
    	};
    	if ( !(_prefix isEqualTo "VC") ) then {
    		missionNamespace setVariable [format["%1__%2", _prefix, toUpper(_x)], _forEachIndex, false];
    	};
    } forEach _vars;
    true
} count PV;

//features serverPreInit call/spawn
["SERVER", "preInit"] call core_fnc_featEvent;

//features serverInit call/spawn
["SERVER", "init"] call core_fnc_featEvent;

//register feature's OnLeave eventHandler
if ( isNil "FEH_onLeave" ) then {
	FEH_onLeave = addMissionEventHandler ["HandleDisconnect", {["SERVER", "leave", _this] call core_fnc_featEvent;}];
};

//features serverPostInit call/spawn
["SERVER", "postInit"] call core_fnc_featEvent;

//broadcast computed assets to clients
{
	_x params ["_prefix", "_vars", "_broadcast"];
	if ( _broadcast ) then {
		{
			publicVariable format["%1_%2", _prefix, _x];
		} count _vars;
	};
	true
} count PV;

publicVariable "PARAMETERS";

missionNamespace setVariable ["SERVER_INIT", false, true];