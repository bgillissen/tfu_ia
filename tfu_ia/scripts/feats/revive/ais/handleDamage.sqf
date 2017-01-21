// by BonInf*
// changed by Psycho and Alwarren

BIS_hitArray = _this;
BIS_wasHit = true;

params ["_unit", "_bodypart", "_damage", "_source"];

private _dead = !(alive _unit);
if ( _dead ) exitWith {	0 };

//agony protection
private _wasInAgony = _unit getVariable ["agony", false];
private _hasMoved = _unit getVariable ["hasMoved", false];
if ( _wasInAgony && !_hasMoved ) exitWith { 0 };


private _hitPoints = getAllHitPointsDamage _unit;
private "_hitIndex";
if ( _bodypart isEqualTo "" ) then {
	//can be Face or Arms according to getAllHitPointsDamage docs, lets use arm
	_hitIndex = 8;
} else {
	_hitIndex = (_hitPoints select 1) find _bodyPart;
};

_hitPoints = player getVariable "hitPoints";

private _hitDamage = _damage - ((_unit getVariable "Hitpoints") select _hitIndex);

//Since fire starts to "damage" with minimal damage at a large radius, so no damage for anything that is less than 1e-7
/*
if (_hitDamage < 1e-7) exitWith {
	diag_log "Hit --- small burn protection";
	0 
};
*/

if (tcb_ais_impactEffects) then { 
	_hitDamage call tcb_fnc_sfxImpactEffect; 
};

if (tcb_ais_bloodParticle) then { 
	[_bodyPart, _hitDamage] call tcb_fnc_addUnitBleeding; 
};

private _newDamage = _damage + (_hitDamage / tcb_ais_rambofactor);
private _revive_factor = (tcb_ais_rambofactor max 1) * 1.5;
private _agony = false;
private _overallDamage = 0; 

switch ( toLower _bodypart ) do {
	case "head": {
		if ( _damage > 20 ) exitWith {};	// ghost-dead-bug
		if ( _newDamage > 0.99 ) then {
			_agony = true;
			if ( _wasInAgony || tcb_ais_realistic_mode ) then {
				if (_newDamage > _revive_factor) then { _dead = true; };
			};
			_newDamage = 0.99;
		};
	};
	case "legs": {	// cant die, no overall damage
		if ( _newDamage > 1.8 ) then { _agony = true; };
		if (tcb_ais_allways_walk && {_newDamage >= 0.5}) then { _newDamage = 0.4 };
	};
	case "hands": {	// cant die, no overall damage
		if ( _newDamage > 3 ) then { _agony = true; };
	};
	default {
		if ( _newDamage > 1.5 ) then {
			_agony = true;
			if ( _wasInAgony || tcb_ais_realistic_mode ) then {
				if (_newDamage > _revive_factor) then { _dead = true; };
			};
			_newDamage = 0.98;
		};
	};
};
	
if ( _dead ) exitWith {
	if !( _unit isEqualTo _source ) then {
		tcb_score = [_source, -1];
		publicVariableServer "tcb_score";
	};
	1 
};

_hitPoints set [_hitIndex, _newDamage];
player setVariable ["hitPoints", _hitPoints, true];
		
{
	private _factor = ( ((count _hitPoints) - _forEachIndex) / 10 ); 
	_overallDamage = _overallDamage + (_x * _factor);
} foreach _hitPoints;
		
if ( (_overallDamage > 0.99) && !tcb_ais_realistic_mode ) then {
	_overallDamage = 0.85 + (random 0.08);
};
if ( _agony ) then {
	if !( _wasInAgony ) then {
		_unit setVariable ["agony", true, true];
		_unit allowDamage false;
	};
} else {
	{
		player setHitIndex [_forEachIndex, _x];
	} forEach _hitPoints;
};

diag_log format ["Hit output ---  part: %1 (%2) --- was: %3 --- hit: %4 --- new: %5 --- overall: %6 --- agony: %7 --- dead: %8", 
	                 _bodypart, _hitIndex, _damage, _hitDamage, _newDamage, _overallDamage, _agony, _dead];

_overallDamage