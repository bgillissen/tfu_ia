
BIS_hitArray = _this;
BIS_wasHit = true;

#define DEADLYPARTS ["head", "face_hub", "pelvis", "body", "neck", "spine", "spine2", "spine3"]
#define THRESHOLD 1

params ["_unit", "_bodypart", "_damage", "_source"];

if ( _damage == 0 ) exitWith { 0 };

private _dead = !(alive _unit);

if ( _dead ) exitWith {	0 };

private _wasInAgony = _unit getVariable ["agony", false];
private _agony = _wasInAgony;
private _hasMoved = _unit getVariable ["hasMoved", false];

if ( _bodypart isEqualTo "" ) exitWith {
	diag_log format ["%1 - Unit Hit | damage: %2 | agony: %3 | hasMoved: %4", diag_tickTime, _damage, _agony, _hasMoved];
	if ( _damage < THRESHOLD ||  (_agony && _hasMoved) ) exitWith { _damage };
	if ( _agony && !_hasMoved ) exitWith { damage _unit };
	( 0.90 + (random 0.08) )	 
};

private _hitIndex = ((getAllHitPointsDamage _unit) select 1) find _bodyPart;
private _hitPoints = player getVariable "hitPoints";
private _oldDamage = _hitPoints select _hitIndex;
private _hitDamage = ( (_damage - _oldDamage) / reviveResistance );
private _newDamage = _oldDamage + _hitDamage;

if ( _agony && !_hasMoved ) exitWith { _oldDamage };

if ( reviveImpactEffect ) then { 
	_hitDamage call revive_fnc_sfxImpactEffect; 
};

if ( _newDamage > reviveBloodThreshold && reviveBloodParticle ) then { 
	[_bodyPart, _hitDamage] call revive_fnc_addUnitBleeding; 
};

/* TODO use config threshold
private _threshold = _bodyPart call {
	if ( "body" isEqualTo _this ) exitWith { getNumber(configFile >> "CfgFirstAid" >> "CriticalBodyHit") };
	...
};
 */
private _threshold = 1;

if ( _agony ) then {
	_dead = ( (_newDamage >= _threshold) && ((toLower _bodypart) in DEADLYPARTS) );
} else {
	_agony = ( _newDamage >= _threshold );
};

private _tkScore = {
	if ( _source in allPlayers ) then {
		if ( (side _unit) isEqualTo (side _source) ) then {
			reviveScore = [_source, -1];
			publicVariableServer "reviveScore";
		};
	};
};

if ( _dead ) then {
	_newDamage = _threshold;
	call _tkScore;
} else {
	if ( _agony ) then {
		_newDamage = _threshold - (random 0.12);
		if !( _wasInAgony ) then {
			_unit setVariable ["agony", true, true];
			call _tkScore;		
		};
	};
	_hitPoints set [_hitIndex, _newDamage];
	player setVariable ["hitPoints", _hitPoints, true];
	if !( _agony ) then {
		{ player setHitIndex [_forEachIndex, _x]; } forEach _hitPoints;
	};
};
	
diag_log format ["%1 - Hit | part: %2 (%3) | arg: %4 | old: %5 | hit: %6 | new: %7 | agony: %8 | dead: %9", 
	             diag_tickTime, _bodypart, _hitIndex, _damage, _oldDamage, _hitDamage, _newDamage, _agony, _dead];

_newDamage