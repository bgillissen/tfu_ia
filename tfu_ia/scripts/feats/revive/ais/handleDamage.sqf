// by BonInf*
// changed by Psycho and Alwarren

BIS_hitArray = _this;
BIS_wasHit = true;

params ["_unit", "_bodypart", "_damage", "_source"];

private _hitPoints = getAllHitPointsDamage _unit;
private "_hitIndex";

if (_bodypart == "") then {
	//can be Face or Arms according to getAllHitPointsDamage docs
	_hitIndex = selectRandom [0, 8];
} else {
	_hitIndex = (_hitPoints select 1) find _bodyPart;
};

private _hitDamage = _damage - (_unit getHitIndex _hitIndex);

//Since fire starts to "damage" with minimal damage at a large radiuz, reduce anything that is less than 1e-7 to zero
if (_hitDamage < 1e-7) then { _hitDamage = 0; };

private _return = _hitDamage / tcb_ais_rambofactor;			// damage scaler to make unit more or less tough
private _revive_factor = (tcb_ais_rambofactor max 1) * 1.5;	// only needed if realistic mode is enabled - calculate chance to die instantly (headshoot or heavy explos)
private _agony = false;
private _dead = !(alive _unit);
private _overallDamage = 0; 

//diag_log format ["Hit input ----  part: %1 --- damage: %2 --- alive: %3", _bodypart, _damage, (alive _unit)];

if !( _dead ) then {
	if (tcb_ais_impactEffects) then { _hitDamage call tcb_fnc_sfxImpactEffect; };
	if (tcb_ais_bloodParticle) then { [_bodyPart, _hitDamage] call tcb_fnc_addUnitBleeding; };
	private _newDamage = _hitDamage + _return;
	switch ( toLower _bodypart ) do {
		case "": {
			if(_newDamage > 0.94) then {
				_agony = true;
				if (tcb_ais_realistic_mode) then {
					if (_newDamage > _revive_factor) then { _dead = true; };
				};
				_newDamage = 0.98;
			};
		};
		
		case "head": {
			if ( _damage > 20 ) exitWith {};	// ghost-dead-bug
			if( _newDamage > 0.99 ) then {
				_agony = true;
				if (tcb_ais_realistic_mode) then {
					if (_newDamage > _revive_factor) then { _dead = true; };
				};
				_newDamage = 0.99;
			};
		};

		case "legs": {	// cant die, no overall damage
			if(_newDamage > 1.8) then { _agony = true; };
			if (tcb_ais_allways_walk && {_newDamage >= 0.5}) then { _newDamage = 0.4 };
		};
		
		case "hands": {	// cant die, no overall damage
			if(_newDamage > 3) then { _agony = true; };
		};
		
		default {
			if(_newDamage > 0.99) then {
				_agony = true;
				_newDamage = 0.99;
			};
		};
	};
	
	_unit setHitIndex [_hitIndex, _newDamage];
	
	{
		private _factor = ( (count(_hitPoints select 2) - _forEachIndex ) / 10 ); 
		_overallDamage = _overallDamage + (_x * _factor);
	} foreach (_hitPoints select 2);
	
	if ( _overallDamage > 0.99 ) then {
		if !( tcb_ais_realistic_mode ) then { 
			_overallDamage = 0.85 + (random 0.08);
		};
	};
	
	if ( _agony && !_dead ) then {
		_unit setVariable ["agony", true, true];
		_unit allowDamage false;
	};
	
	if ( (_agony && !(_unit getVariable ["agony", false])) || _dead ) then {
		if !( _unit isEqualTo _source ) then {
			tcb_score = [_source, -1];
			publicVariableServer "tcb_score";
		};		
	};
	
	if ( _dead ) then { _overallDamage = 1; };
};

diag_log format ["Hit output ---  part: %1 (%6) --- damage: %2 --- hitDamage: %7 --- overall: %3 --- agony: %4 --- dead: %5", _bodypart, _damage, _overallDamage, _agony, _dead, _hitIndex, _hitDamage];

_overallDamage