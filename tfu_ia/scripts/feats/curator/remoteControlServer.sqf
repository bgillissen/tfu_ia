params ["_gm", "_player", "_unit", "_ctrl"];

diag_log "SERVER remoteControl";

private "_msg"; 

if ( _ctrl ) then {
	_msg = ["curator", "takeOverMsg"] call BIS_fnc_getCfgData;	
	curatorUnit = _unit;
} else {
	_msg = ["curator", "releaseMsg"] call BIS_fnc_getCfgData;
	curatorUnit = objNull;
};

private _desc = getText (configFile >> "CfgVehicles" >> typeOf _unit >> "displayName");
private _msg = format[_msg, (name _player), (name _unit), _desc];
private _target = [];
{
	_target append [owner (_x select 2)];
} count curatorAssigned;

diag_log format["remoteControl systemChat target : %1", _target];

[_target, _msg] call common_fnc_systemChat;

(owner _player) publicVariableClient "curatorUnit";

nil