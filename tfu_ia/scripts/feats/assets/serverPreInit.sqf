/*
@filename: feats\assets\serverPreInit.sqf
Author:
	Ben
Description:
	run on server
	check which mods are available in those we support and define their assets
*/

#include "..\..\core\debug.hpp"

#define emptyLoadout [["", []], ["", []], ["", []], ["", []], ["", []], ["", []], "", "", "", "", "", "", "", "", ""]
#define dftCargo [[],[],[],[]]
#define dftSpawn [[],[]]
#define dftVal []

MAP_KEYWORDS = getArray(missionConfigFile >> "maps" >> toUpper(worldName) >> "keywords");
BLACKLIST = [[],[],[],[],[],[],[],[]];
REWARDS = [];
MODS = [];

if ( isNil "PV") then {
	//those public vars are filled by assets init and then broadcasted to players
	private _vehPools = ["car", "carArmed", "apc", "tank", "aaTank", "planeCAS", "planeAA", "planeTransport", "uav", 
	                     "heliSmall", "heliSmallArmed", "heliMedium", "heliMedEvac", "heliBig", "heliAttack",
	                     "boatSmall", "boatAttack", "boatBig", "sub", "landMedic", "repair", "fuel","ammo", "quad"];  
	RG_k = 0;
	A_k = 1;
	SD_k = 2;
	AV_k = 3;
	BV_k = 4;
	VC_k = 5;
	BALO_k = 6;
	S_k = 7;
	RL_k = 8;
	PV = [["RG", ["launcher", "mg", "sRifle", "mRifle", "sScope", "mScope", "oScope", "backpack"], true],
	      ["A", ["backpacks", "items", "weapons", "ammo"], true],
	      ["SD", ["backpacks", "items", "weapons", "ammo", "crates", "vehicles"], true],
	      ["AV", ["heli", "plane", "tank"], true],
	      ["BV", _vehPools, false],
	      ["VC", _vehPools, false],
	      ["BALO", ["medic", "gear", "support", "default"], false],
	      ["S", ["radioTower", "crates", "pGroups", "sGroups", "pilot", "crew", "officer", "garrison",
	             "civ", "aa", "arti", "static", "cas", "tank", "apc", "car", "carArmed", "aPatrol"], false],
	      ["RL", ["hq", "sl", "tl", "medic", "lmg", "hmg", "assHMG", "at", "assAT", "sniper", 
	              "marksman", "repair", "demo", "engineer", "grenadier", "rifleman", "jtac", 
	              "hPilot", "jPilot", "crew", "mortar", "uavOp", "spotter"], true]];
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

//detect which mods are present and preInit them if needed
{
	private _name = getText(_x >> "name");
	if ( _name isEqualto "" ) then { 
		_name = (configName _x); 
	};
	private _cfgPatch = getText(_x >> "cfgPatch");
	private _sides = (getArray(_x >> "sides") call common_fnc_numberToSide);
	private _isPresent = true;
	if ( !(_cfgPatch isEqualto "") ) then {
		_isPresent = isClass(configFile >> "CfgPatches" >> _cfgPatch);
	};
	missionNamespace setVariable [format["MOD_%1", _name], _isPresent, true];
	MODS pushback [_name, _isPresent, _sides];
	if ( _isPresent ) then {
		#ifdef DEBUG
		private _debug = format["assets: %1 is present", _name];
		conWhite(_debug);
		#endif
		private _fnc =  format["%1_fnc_preInit", _name];
		if ( !isNil _fnc ) then {
			private _code = compile format["call %1", _fnc];
			0 = call _code;
		#ifdef DEBUG
		} else {
			private _debug = format["assets: function %1 is not defined)", _fnc];
			conWhite(_debug);
		#endif	
		};		
	#ifdef DEBUG
	} else {
		private _debug = format["assets: %1 is not present (%2)", _name, _cfgPatch];
		conWhite(_debug);
	#endif		
	};
} count ("true" configClasses (missionConfigFile >> "settings" >> "assets"));