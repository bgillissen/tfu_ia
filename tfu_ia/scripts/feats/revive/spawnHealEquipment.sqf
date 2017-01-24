/*
TODO, 
	instead of a call, 
	a spawn that add stuff during the heal process (_healTime / damaged hitpoints)
	so got to keep a local 
*/ 


private _lifetime = ["revive", "heal", "garbageLifeTime"] call core_fnc_getSetting;
private _pos = player modelToWorld [-0.5,0.2,0];

private _defi = "Land_Defibrillator_F" createVehicle _pos;
_defi setPos _pos;
_defi setDir (getDir player - 180);

private _hitpoints = _this getVariable "hitPoints";

reviveHealEquipment = [];
{
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
} forEach _hitPoints;

publicVariableServer "reviveHealEquipment";

_defi