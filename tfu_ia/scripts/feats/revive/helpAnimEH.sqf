
params ["_helper", "_anim"];

if (primaryWeapon _helper != "") then {
	if (time >= reviveAnimDelay) then {
		_helper setVariable ["stopped", true, true];
	};
} else {
	if !( _anim in ["AinvPknlMstpSlayWrflDnon_1"] ) then {
		if ( time >= reviveAnimDelay ) then {
			_helper setVariable ["stopped", true, true];
		};
	};
};	