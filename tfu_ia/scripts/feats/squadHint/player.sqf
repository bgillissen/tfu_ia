/*
@filename: feats\squadHint\player.sqf
Author:
	Ben
Description:
	Run once on player side only,
	To display a global hint when a member of the defined squad join the server.
	(see settings.sqf)
*/

if ( PARAMS_squadHint == 0 ) then { exitWith{}; };

_infoArray = squadParams player;  
_infoSquad = _infoArray select 0;
_squad = _infoSquad select 1;
_infoName = _infoArray select 1;
_name = _infoName select 1;

if ( _squad == SQUAD ) then {
	_GlobalHint = format["<t align='center' size='2.2' color='#FAAF3A'>%1<br/></t><t size='1.4' color='#33CCFF'>%2</t><br/>has joined the server, To become a TFU member, apply to taskforceunicorn.com</t><br/>",_squad,_name];
	[_GlobalHint] remoteExec ["common_fnc_globalHint",0,false];
};