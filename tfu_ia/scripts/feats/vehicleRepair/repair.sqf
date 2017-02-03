
params["_veh", "_type"];

if ( (_veh isKindOf "ParachuteBase") || !(alive _veh) ) exitWith {};

private _ok = _type call {
	if ( _this isEqualTo "uav" ) exitWith { ( (typeOf _veh) in BV_uav ) };
	if ( _this isEqualTo "boat" ) exitWith { ( _veh isKindOf "Ship" ) };
	if ( _this isEqualTo "land" ) exitWith { ( _veh isKindOf "LandVehicle" ) };
	if ( _type isEqualTo "heli" ) exitWith { ( _veh isKindOf "Helicopter" ) };
	if ( _this isEqualTo "plane" ) exitWith { ( _veh isKindOf "Plane" ) };
	false
};

if !( _ok ) exitWith {
	_veh vehicleChat (["vehicleRepair", _type, "badType"] call core_fnc_getSetting);
};
		
private _vName = getText(configFile >> "CfgVehicles" >> typeOf _veh >> "DisplayName");

//_veh vehicleChat format [(["vehicleRepair", "start"] call core_fnc_getSetting), _vName];
[4, format[(["vehicleRepair", "start"] call core_fnc_getSetting), _vName], _veh] call global_fnc_chat;
private _damage = getDammage _veh;

while { _damage > 0 } do {
	sleep 0.5;
	private _prct = 100 - (_damage * 100);
	//_veh vehicleChat format ["Repairing (%1%)...", floor _prct];
	[4, format["Repairing (%1%)...", floor _prct], _veh] call global_fnc_chat; 
	if ( (_damage - 0.01) <= 0 ) then {
		_veh setDamage 0;
		_damage = 0;
	} else {
		_veh setDamage (_damage - 0.01);
		_damage = _damage - 0.01;
	};
};

//_veh vehicleChat "Repaired.";
[4, "Repaired.", _veh] call global_fnc_chat;
sleep 2;

private _fuel = fuel _veh;

while { _fuel < 1 } do {
	sleep 0.5;
	private _prct = (_fuel * 100);
	//_veh vehicleChat format["Refuelling (%1%)...", floor _prct];
	[4,  format["Refuelling (%1%)...", floor _prct], _veh] call global_fnc_chat;
	if ( (_fuel + 0.01) >= 1 ) then {
		_veh setFuel 1;
		_fuel = 1;
	} else {
		_fuel = _fuel + 0.01;
	};
};

//_veh vehicleChat "Refuelled.";
[4, "Refuelled.", _veh] call global_fnc_chat;

sleep 2;

private _vType = (typeOf _veh);
private _mags = getArray(configFile >> "CfgVehicles" >> _vType >> "magazines");

if (count _mags > 0) then {
	_removed = [];
	{
		if !( _x in _removed ) then {
			_veh removeMagazines _x;
			_removed pushback _x;
		};
	} forEach _mags;
	{
		_veh vehicleChat format ["Reloading %1", _x];
		sleep 0.05;
		_veh addMagazine _x;
	} forEach _mags;
};

_count = count (configFile >> "CfgVehicles" >> _vType >> "Turrets");

if (_count > 0) then {
	for "_i" from 0 to (_count - 1) do {
		scopeName "xx_reload2_xx";
		_config = (configFile >> "CfgVehicles" >> _vType >> "Turrets") select _i;
		private _mags = getArray(_config >> "magazines");
		_removed = [];
		{
			if !( _x in _removed ) then {
				_veh removeMagazines _x;
				_removed pushback _x;
			};
		} forEach _mags;
		{
			//_veh vehicleChat format ["Reloading %1", _x];
			 [4, format["Reloading %1", _x], _veh] call global_fnc_chat;
			sleep 0.05;
			_veh addMagazine _x;
			sleep 0.05;
		} forEach _mags;
		_count_other = count (_config >> "Turrets");
		if (_count_other > 0) then {
			for "_i" from 0 to (_count_other - 1) do {
				_config2 = (_config >> "Turrets") select _i;
				private _mags = getArray(_config2 >> "magazines");
				_removed = [];
				{
					if (!(_x in _removed)) then {
						_veh removeMagazines _x;
						_removed pushback _x;
					};
				} forEach _mags;
				{
					//_veh vehicleChat format ["Reloading %1", _x];
					[4, format["Reloading %1", _x], _veh] call global_fnc_chat;
					sleep 0.05;
					_veh addMagazine _x;
					sleep 0.05;
				} forEach _mags;
			};
		};
	};
};

_veh setVehicleAmmo 1;

if ( _vType in BV_repair ) then { _veh setRepairCargo 1; };
if ( _vType in BV_ammo ) then { _veh setAmmoCargo 1; };
if ( _vType in BV_fuel ) then { _veh setFuelCargo 1; };

//_veh vehicleChat format [(["vehicleRepair", "end"] call core_fnc_getSetting), _vName];
[4, format [(["vehicleRepair", "end"] call core_fnc_getSetting), _vName], _veh] call global_fnc_chat;