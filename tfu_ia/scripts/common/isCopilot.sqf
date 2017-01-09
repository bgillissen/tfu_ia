
params ["_veh", "_player"];

private _out = false;
{
	if ( (_veh turretUnit [_forEachIndex]) isEqualTo _player ) exitWith {
		_out = (getNumber(_x >> "iscopilot") isEqualTo 1);	
	};
} forEach ("true" configClasses (configFile >> "CfgVehicles" >> typeOf(_veh) >> "turrets"));

_out