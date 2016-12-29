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

if ( !(["mapTracker"] call core_fnc_getConf) ) exitWith {};

MT_mapEH = -1;
MT_mapThread = [] spawn {
	waitUntil {
		sleep 1; 
		!(isNull (findDisplay 12))
	};
	MT_mapEH = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {[false, _this select 0] call mapTracker_fnc_drawIcons}];
};


MT_gpsEH = -1;
MT_gpsThread = [] spawn { 
	disableSerialization;
	MT_gps = controlNull;	
	while {isNull MT_gps} do {
		{
			if !(isNil {_x displayctrl 101}) then { MT_gps = _x displayctrl 101 };
		} count (uiNamespace getVariable "IGUI_Displays");
		sleep 1;
	};
	MT_gpsEH = MT_gps ctrlAddEventHandler ["Draw", {[true, _this select 0] call mapTracker_fnc_drawIcons}];
};