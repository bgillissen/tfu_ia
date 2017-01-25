
private _pos = player modelToWorld [-0.5,0.2,0];
private _defi = "Land_Defibrillator_F" createVehicle _pos;
_defi setPos _pos;
_defi setDir (getDir player - 180);

private _lifeTime = ["revive", "heal", "garbageLifeTime"] call core_fnc_getSetting;
reviveHealEquipment = [];

private _hitParts = (getAllHitPointsDamage _unit) select 1;
private _hitPoints = _this getVariable "hitPoints";

private _skillFactor = 0.1 + (random 0.1);
if ( player getVariable "role" isEqualto "medic" ) then { 
	_skillFactor = _skillFactor + 0.1; 
};
if !( isNull (_this getVariable ["medEvac", objNull]) ) then {
	_skillFactor = _skillFactor + 0.2;
};
private _totDamage = 0;
{ 
	_totDamage = _totDamage + (_x * 3 * _skillFactor); 
} forEach _hitPoints;

private _startTime = time;
private _stopped = false;

{
	scopeName "healLoop";
	if ( _stopped ) then {
		breakOut "healLoop";
	};
	private _partName = _forEachIndex call _getPartName;
	private _time = time; 
	private _damage = (_x * 3 * _skillFactor);
	if ( _x >= 0.5 ) then {
		for "_i" from 1 to (1 + (round random 2)) do {
			private _pos = player modelToWorld [0.4, (0.2 - (random 0.5)), 0];
			private _bb = "Land_BloodBag_F" createVehicle _pos;
			_bb setPos _pos;
			_bb setDir (random 359);
			reviveHealEquipment pushback [_bb, time + _lifeTime];
		};
	};
	if ( _x >= 0.2 ) then {
		for "_i" from 1 to (round (_x * 3)) do {
			private _pos = player modelToWorld [(random 1.3), (0.8 + (random 0.6)), 0];
			private _band = "Land_Bandage_F" createVehicle _pos;
			_band setPos  _pos;
			_band setDir (random 359);
			reviveHealEquipment pushback [_band, time + _lifeTime];
		};
	};
	while {
		( (time - _time < _damage)
		&& (alive player)
		&& (alive _this)
		&& ((player distance _this) < 2)
		&& !(player getVariable "agony")
		&& !(player getVariable ["stopped", false]) )
	} do {
		sleep 0.2;
		[_partName, ((((time - _startTime) / _totDamage ) min 1) * 100)] spawn revive_fnc_progressbar;
	};
	if ( !(player getVariable ["stopped", false]) && !(player getVariable ["agony", false]) && (alive player) && (alive _this) ) then {
		[_unit, (_hitParts select _forEachIndex)] call revive_fnc_stopBleeding;
		_hitPoints set [_forEachIndex, 0];
	} else {
		_stopped = true;
	};
} forEach _hitPoints;

player setVariable ["finished", !_stopped, true];
_this setVariable ["hitPoints", _hitPoints, true];
deleteVehicle _defi;
publicVariableServer "reviveHealEquipment";

/*
private _hitPoints = _this getVariable "hitPoints";
private _damage = 0;
{ 
	_damage = _damage + (_x * 3 * _skillFactor); 
} forEach _hitPoints;

private _time = time;

while {
	( (time - _time < _damage)
	&& (alive player)
	&& (alive _wounded)
	&& ((player distance _wounded) < 2)
	&& !(player getVariable "agony")
	&& !(player getVariable ["stopped", false]) )
} do {
	sleep 0.5;
	((((time - _time) / _damage ) min 1) * 100) spawn revive_fnc_progressbar;
};

if ( !(player getVariable ["stopped", false]) && !(player getVariable "agony") && (alive player) && (alive _wounded) ) then {
	player setVariable ["finished", true, true];
};
*/