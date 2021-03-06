params ["_gm", "_player", "_unit", "_ctrl"];

private "_msg"; 

if ( _ctrl ) then {
	_msg = ["curator", "takeOverMsg"] call core_fnc_getSetting;	
	curatorUnit = _unit;
} else {
	_msg = ["curator", "releaseMsg"] call core_fnc_getSetting;
	curatorUnit = objNull;
};

private _desc = getText (configFile >> "CfgVehicles" >> typeOf _unit >> "displayName");
private _msg = format[_msg, (name _player), (name _unit), _desc];
private _target = [];
{
	_target append [owner (_x select 2)];
} count curatorAssigned;

[_target, _msg] call common_fnc_systemChat;

(owner _player) publicVariableClient "curatorUnit";

nil