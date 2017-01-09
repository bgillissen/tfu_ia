/*
@filename: fates\mods\condition.sqf
Author:
	Ben
Description:
	run on server
	it helps to find out if something got to be implented
*/

params ["_type", "_confName", "_sides", "_checkMod", "_isEnemy"];

private _confParam = format["%1_%2", _type, _confName];

if ( !isClass(missionConfigFile >> "Params" >> _confParam) ) exitWith {
	//diag_log format["condition: %1 isNil => true", _confParam];
	true 
};

private _conf = [_confParam] call core_fnc_getParam;

if ( _conf isEqualTo 0 ) exitWith {
	//diag_log format["condition: %1 is 0 => false", _confParam];
	false 
};

private _out = true;

if ( _conf isEqualTo 1 ) then {
	if ( _isEnemy ) then {
		_out = ( ({_x in ALLIES} count _sides) == 0 ); 
	} else {
		_out = ( (PLAYER_SIDE in (_sides call common_fnc_numberToSide)) );
		
	};
};
if ( !_out ) exitWith {
	//diag_log format["condition: %1 is 1 (%2) => false", _confParam, _isEnemy];
	false 
};

if ( _conf isEqualTo 2 ) then {
	_out = ( ({_x in ALLIES} count _sides) > 0 );
};
if ( !_out ) exitWith {
	//diag_log format["condition: %1 is 2 => false", _confParam];
	false 
};

if ( !_checkMod ) exitWith {
	//diag_log format["condition: %1 is %2, _checkMod is false => true", _confParam, _conf];
	true
};

private _modConfName = format["%1_mod%2", _confName, (["Player", "Enemy"] select _isEnemy)];

if ( !isClass(missionConfigFile >> "Params" >> _modConfName) ) exitWith {
	//diag_log format["condition: %1 modConf isNil => true", _confParam];
	true 
};

private _modConf = [_modConfName] call core_fnc_getParam; 

if ( _modConf isEqualTo 1 ) exitWith {
	//diag_log format["condition: %1  modConf is 1 => true", _confParam];
	true 
};	

{
	_x params ["_mod", "_isPresent", "_modSides"];
	if ( _isPresent ) then {
		if ( _conf isEqualTo 2 ) then {
			if ( {_x in ALLIES} count _modSides == 0 ) exitWith { _out = false };
		};
		if ( _conf isEqualTo 1 ) then {
			if ( !(PLAYER_SIDE in _modSides) ) exitWith { _out = false };
		};
	};
} count MODS;

//diag_log format["condition: %1 conf is %2, modConf is 0 => %3", _confParam, _conf, _out];

_out