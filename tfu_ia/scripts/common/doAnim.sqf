
params ["_unit", "_anim", ["_priority", 0]];

if (_unit == vehicle _unit) then {
	if ( local _unit ) then {
		_this call common_fnc_doAnimPlayer;
	} else {
		_this remoteExec ["common_fnc_doAnimPlayer", _unit, false];
	};
} else {
	_this call global_fnc_doAnim;
};