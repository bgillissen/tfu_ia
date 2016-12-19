/*
@filename: feats\squadHint\playerInit.sqf
Author:
	Ben
Description:
	Run once on player side only,
	To display a global hint when a member of the defined squad join the server.
	(see settings.sqf)
*/

if ( !(["SquadHint"] call core_fnc_getConf) ) exitWith{};

private _infoArray = squadParams player;  
private _infoSquad = _infoArray select 0;
private _squad = _infoSquad select 1;
private _infoName = _infoArray select 1;
private _name = _infoName select 1;

if (_squad == SH_name) then { [format[SH_msg, _squad, _name, SH_url]] remoteExec ["common_fnc_globalHint", 0, false]; };