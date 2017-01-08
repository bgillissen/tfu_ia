/*
@filename: feats\curator\serverPostInit.sqf
Author:
	Ben
Description:
	run on server
	configure the gameMaster modules (nigth vision, notification)	 
*/

private _notif = [false, true] select (["curator", "notification"] call core_fnc_getSetting);
private _thermal = [false, true] select (["curator", "thermalVision"] call core_fnc_getSetting);
private _doMsg = [false, true] select (["curator", "msgOnTakeOver"] call core_fnc_getSetting);

for "_slot" from 0 to (TOT_CURATOR - 1) do {
	private _gm = missionNamespace getVariable format["zeus_%1", _slot];
	if ( !(isNil "_gm") ) then {
		if ( _thermal ) then {
			[_gm, [-1, -2, 0]] call BIS_fnc_setCuratorVisionModes;  //nightvision
		};
		_gm setVariable ["showNotification", _notif];				//notification
	};
};