params ["_gm", "_player", "_unit", "_ctrl"];

private "_msg"; 

if ( _ctrl ) then {
	_msg = ["curator", "takeOverMsg"] call BIS_fnc_getCfgData;	
	curatorUnit = _unit;
} else {
	_msg = ["curator", "releaseMsg"] call BIS_fnc_getCfgData;
	curatorUnit = objNull;
};

private _msg = format[_msg, (name _player), (name _unit), (typeOf _unit)];
private _target = [];
{
	_target append [_x select 2];
} count curatorAssigned;

[_target, _msg] call common_fnc_systemChat;

(owner _player) publicVariableClient "curatorUnit";

nil