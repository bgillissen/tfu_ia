/*
@filename: feats\mapTracker\playerDestroy.sqf
Credits: 
	Quiksilver
Author:
	Ben
Description:
	run on client
	kill the waiting threads and remove the registred eventHandlers
*/

if ( !(["mapTracker"] call core_fnc_getConf) ) exitWith {};

terminate MT_mapThread;
MT_mapThread = nil;
if ( MT_mapEH != -1 ) then {
	((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ["Draw", MT_mapEH];
};

terminate MT_gpsThread;
MT_gpsThread = nil;
if ( MT_gpsEH != -1 ) then {
	MT_gps = ctrlRemoveEventHandler ["Draw", MT_gpsEH];
};