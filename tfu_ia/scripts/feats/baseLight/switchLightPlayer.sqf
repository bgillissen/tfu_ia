
params ["_thing", "_caller", "_id", "_arg"];

private _dmg = 0;
if !( _arg ) then { _dmg = 0.97; };

{
	_x allowDamage true;
	_x setHit ["light_1_hitpoint", _dmg];
	_x setHit ["light_2_hitpoint", _dmg];
	_x setHit ["light_3_hitpoint", _dmg];
	_x setHit ["light_4_hitpoint", _dmg];
	_x allowDamage false;
	true
} count baseLights;