/*
@filename: feats\squadHint\playerPostInit.sqf
Author:
	Ben
Description:
	run on player,
	display a global hint when a member of the defined squad join the server.
	(see settings.sqf)
*/

if ( (["squadHint"] call core_fnc_getParam) == 0 ) exitWith{};

private _infoArray = squadParams player;
private _infoSquad = _infoArray select 0;

if ( isNil "_infoSquad" ) exitWith {};

private _squad = _infoSquad select 1;
private _infoName = _infoArray select 1;
private _playerName = _infoName select 1;

private _cfgName = ["squadHint", "name"] call core_fnc_getSetting;
		
if (_squad isEqualTo _cfgName) then {
	private _msg = ["squadHint", "msg"] call core_fnc_getSetting;
	private _url = ["squadHint", "url"] call core_fnc_getSetting;
	[format[_msg, _squad, _playerName, _url]] call global_fnc_hint; 
};