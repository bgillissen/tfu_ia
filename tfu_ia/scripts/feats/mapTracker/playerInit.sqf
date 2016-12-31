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

if ( (["mapTracker"] call core_fnc_getConf) == 0 ) exitWith {};

MT_sizeMan = ["mapTracker", "sizeMan"] call BIS_fnc_GetCfgData;
MT_sizeLandVehicle = ["mapTracker", "sizeLandVehicle"] call BIS_fnc_GetCfgData;
MT_sizeAir = ["mapTracker", "sizeAir"] call BIS_fnc_GetCfgData;
MT_sizeShip = ["mapTracker", "sizeShip"] call BIS_fnc_GetCfgData;
MT_shadow = ["mapTracker", "shadow"] call BIS_fnc_GetCfgData;
MT_textSize = ["mapTracker", "textSize"] call BIS_fnc_GetCfgData;
MT_textFont = ["mapTracker", "textFont"] call BIS_fnc_GetCfgData;
MT_textOffset = ["mapTracker", "textOffset"] call BIS_fnc_GetCfgData;

MT_mapEH = -1;
MT_mapThread = [] spawn {
	waitUntil {
		sleep 1; 
		!(isNull (findDisplay 12))
	};
	MT_mapEH = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {[false, (_this select 0)] call mapTracker_fnc_drawIcons}];
};

MT_gpsDist = ["mapTracker", "gpsDist"] call BIS_fnc_GetCfgData;
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