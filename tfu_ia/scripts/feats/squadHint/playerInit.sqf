/*
@filename: feats\squadHint\playerInit.sqf
Author:
	Ben
Description:
	run once on player,
	display a global hint when a member of the defined squad join the server.
	(see settings.sqf)
*/

if ( (["squadHint"] call core_fnc_getConf) == 0 ) exitWith{};

private _infoArray = squadParams player;
private _infoSquad = _infoArray select 0;

if ( isNil "_infoSquad" ) exitWith {};

private _squad = _infoSquad select 1;
private _infoName = _infoArray select 1;
private _playerName = _infoName select 1;

private _cfgName = ["squadHint", "name"] call BIS_fnc_GetCfgData;
		
if (_squad isEqualTo _cfgName) then {
	private _msg = ["squadHint", "msg"] call BIS_fnc_GetCfgData;
	private _url = ["squadHint", "url"] call BIS_fnc_GetCfgData;
	[format[_msg, _squad, _playerName, _url]] call common_fnc_globalHint; 
};