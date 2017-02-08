/*
@filename: feats\roleRestrictions\playerPostInit.sqf
Author:
	Ben
Description:
	run on player
*/

private _roles = ["roleRestrictions", "roles"] call core_fnc_getSetting;
private _role = player getVariable "role";
private _cfgSquad = ["roleRestrictions", "squadName"] call core_fnc_getSetting;

private _infoArray = squadParams player;
private _infoSquad = _infoArray select 0;
private _squad = "";
if !( isNil "_infoSquad" ) then { 
	_squad = _infoSquad select 1; 
};

if ( (_role in _roles) && !(_squad isEqualTo _cfgSquad) ) then {
	private _exceptions = ["roleRestrictions", "exceptions"] call core_fnc_getSetting;
	if !( (getPlayerUID player) in _exceptions ) then {
		DOLOCK = true;
		waitUntil {
			sleep 1;
			!PLAYER_INIT 
		};
		private _msg = ["roleRestrictions", "messages", _role] call core_fnc_getSetting;
		"roleRestrictions" cutText [_msg, "BLACK", 0.1, true];
		sleep 10;
		"roleRestrictions" cutFadeOut 2;
		sleep 2;
		endMission "NOTALLOWED";
	};
};