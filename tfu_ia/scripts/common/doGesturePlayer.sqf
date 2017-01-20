
params ["_unit", "_anim", ["_priority", 0]];

if ( _priority > 0 ) exitWith {
	_unit playAction _anim;
};

_unit playActionNow _anim;