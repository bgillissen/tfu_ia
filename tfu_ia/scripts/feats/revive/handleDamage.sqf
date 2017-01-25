
BIS_hitArray = _this;
BIS_wasHit = true;

#define DEADLYPARTS ["head", "face_hub", "pelvis", "body", "neck", "spine", "spine2", "spine3"]
#define THRESHOLD 1

params ["_unit", "_bodypart", "_damage", "_source"];

if ( _damage == 0 ) exitWith { 0 };

private _dead = !(alive _unit);

if ( _dead ) exitWith {	0 };

private _wasInAgony = _unit getVariable ["agony", false];
private _hasMoved = _unit getVariable ["hasMoved", false];

if ( _bodypart isEqualTo "" ) exitWith {
	if ( (_damage < THRESHOLD) || (_wasInAgony && _hasMoved) ) exitWith {
		diag_log format ["%1 - Unit Hit | damage: %2 | agony: %3 | hasMoved: %4 | out: %5", diag_tickTime, _damage, _wasInAgony, _hasMoved, _damage];
		_damage 
	};
	if ( _wasInAgony && !_hasMoved ) exitWith {
		private _return = (damage _unit);
		diag_log format ["%1 - Unit Hit | damage: %2 | agony: %3 | hasMoved: %4 | out: %5", diag_tickTime, _damage, _wasInAgony, _hasMoved, _return];
		_return 
	};
	private _return = ( 0.80 + (random 0.08) );
	diag_log format ["%1 - Unit Hit | damage: %2 | agony: %3 | hasMoved: %4 | out: %5", diag_tickTime, _damage, _wasInAgony, _hasMoved, _return];
	_return
};

private _hitIndex = ((getAllHitPointsDamage _unit) select 1) find _bodyPart;
private _unitHitPoints = _unit getVariable "hitPoints";
private _unitOldDamage = _unitHitPoints select _hitIndex;
private _oldDamage = _unit getHitIndex _hitIndex;
private _hitDamage = ( (_damage - _oldDamage) / reviveResistance );
private _newDamage = ( _unitOldDamage + _hitDamage );

if ( reviveImpactEffect ) then { 
	_hitDamage call revive_fnc_sfxImpactEffect; 
};

if ( _newDamage > reviveBloodThreshold && reviveBloodParticle ) then { 
	_bodyPart call revive_fnc_addUnitBleeding; 
};

private _threshold = _bodyPart call {
	if ( _this in DEADLYPARTS ) exitWith { THRESHOLD };
	( THRESHOLD + (THRESHOLD / 2) )
};

if ( _wasInAgony && _hasMoved ) then {
	_dead = ( (_newDamage >= _threshold) && ((toLower _bodypart) in DEADLYPARTS) );
};

private _agony = (_wasInAgony || (_newDamage >= _threshold) );

private _tkScore = {
	if ( _source in allPlayers ) then {
		if ( (side _unit) isEqualTo (side _source) ) then {
			reviveScore = [_source, -1];
			publicVariableServer "reviveScore";
		};
	};
};

private _noDeathDamage = {
	//80% of threshold  +  12% max of threshold
	( (THRESHOLD * 0.8) + (THRESHOLD * (random 0.12)) )
};

if ( _dead ) exitWith {
	call _tkScore;
	_newDamage
};

private _return = _newDamage;
if ( _return >= THRESHOLD ) then { 
	_return = _newDamage call _noDeathDamage; 
};
if ( _agony && !_wasInAgony ) then {
	_unit setVariable ["agony", true, true];
	call _tkScore;
};

_unitHitPoints set [_hitIndex, _newDamage];
player setVariable ["hitPoints", _unitHitPoints, true];

if !( _agony ) then {
	{
		if ( _x >= THRESHOLD ) then { _x = _x call _noDeathDamage; };
		_unit setHitIndex [_forEachIndex, _x]; 
	} forEach _unitHitPoints;
};

diag_log format ["%1 - Hit | part: %2 (%3) | arg: %4 | old: %5 | hit: %6 | new: %7 | out: %8 | agony: %9 | dead: %10", 
	             diag_tickTime, _bodypart, _hitIndex, _damage, _oldDamage, _hitDamage, _newDamage, _return, _agony, _dead];

_return