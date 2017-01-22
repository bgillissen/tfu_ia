
BIS_hitArray = _this;
BIS_wasHit = true;

#define DEADLYPARTS ["head", "face_hub", "pelvis", "body", "neck", "spine", "spine2", "spine3"]
#define THRESHOLD 0.999

params ["_unit", "_bodypart", "_damage", "_source"];

private _dead = !(alive _unit);

if ( _dead ) exitWith {	0 };

if ( _bodypart isEqualTo "" ) exitWith { _damage };

private _agony = _unit getVariable ["agony", false];
private _hasMoved = _unit getVariable ["hasMoved", false];

private _hitIndex = ((getAllHitPointsDamage _unit) select 1) find _bodyPart;
private _hitPoints = player getVariable "hitPoints";
private _oldDamage = _hitPoints select _hitIndex;
private _hitDamage = ((_damage - _oldDamage) / tcb_ais_rambofactor );
private _newDamage = _oldDamage + _hitDamage;
//agony protection
if ( _wasInAgony && !_hasMoved ) exitWith { _oldDamage };

if (tcb_ais_impactEffects) then { 
	_hitDamage call tcb_fnc_sfxImpactEffect; 
};

if (tcb_ais_bloodParticle) then { 
	[_bodyPart, _hitDamage] call tcb_fnc_addUnitBleeding; 
};

if ( _agony ) then {
	_dead = ( (_newDamage > THRESHOLD) && ((toLower _bodypart) in DEADLYPARTS) );
} else {
	_agony = ( _newDamage > THRESHOLD );
};

if ( _dead ) then {
	_newDamage = 1;
	if ( _source in allPlayers ) then {
		if ( (side _unit) isEqualTo (side _source) ) then {
			tcb_score = [_source, -1];
			publicVariableServer "tcb_score";
		};
	};
} else {
	_newDamage = 0.85 + (random 0.08);
	_hitPoints set [_hitIndex, _newDamage];
	player setVariable ["hitPoints", _hitPoints, true];
	if ( _agony ) then {
		_unit setVariable ["agony", true, true];
		_unit allowDamage false;
	} else {
		{ player setHitIndex [_forEachIndex, _x]; } forEach _hitPoints;
	};
};

diag_log format ["Hit output ---  part: %1 (%2) --- old: %3 --- hit: %4 --- new: %5 --- agony: %7 --- dead: %8", 
	             _bodypart, _hitIndex, _oldDamage, _hitDamage, _newDamage, _agony, _dead];

_newDamage