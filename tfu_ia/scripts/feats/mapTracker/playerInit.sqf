/*
@filename: feats\mapTracker\playerInit.sqf
Credits: 
	Quiksilver
Author:
	Ben
Description:
	run on client
	register map and gps draw eventHandler.
*/

if ( (["mapTracker"] call core_fnc_getParam) == 0 ) exitWith {};

MT_sizeMan = ["mapTracker", "sizeMan"] call core_fnc_getSetting;
MT_sizeLandVehicle = ["mapTracker", "sizeLandVehicle"] call core_fnc_getSetting;
MT_sizeAir = ["mapTracker", "sizeAir"] call core_fnc_getSetting;
MT_sizeShip = ["mapTracker", "sizeShip"] call core_fnc_getSetting;
MT_shadow = ["mapTracker", "shadow"] call core_fnc_getSetting;
MT_textSize = ["mapTracker", "textSize"] call core_fnc_getSetting;
MT_textFont = ["mapTracker", "textFont"] call core_fnc_getSetting;
MT_textOffset = ["mapTracker", "textOffset"] call core_fnc_getSetting;

MT_mapEH = -1;
MT_mapThread = [] spawn {
	waitUntil {
		sleep 1; 
		!(isNull (findDisplay 12))
	};
	MT_mapEH = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {[false, (_this select 0)] call mapTracker_fnc_drawIcons}];
};

MT_gpsDist = ["mapTracker", "gpsDist"] call core_fnc_getSetting;
MT_gpsEH = -1;
MT_gpsThread = [] spawn { 
	disableSerialization;
	private _gps = controlNull;	
	while {isNull _gps} do {
		{
			if !(isNil {_x displayctrl 101}) then { _gps = _x displayctrl 101 };
		} count (uiNamespace getVariable "IGUI_Displays");
		sleep 1;
	};
	MT_gpsEH = _gps ctrlAddEventHandler ["Draw", {[true, (_this select 0)] call mapTracker_fnc_drawIcons}];
};