
params ["_helper", "_anim"];
if (primaryWeapon _helper != "") then {
	if (time >= tcb_animDelay) then {tcb_helperStopped = true; /*Hint "has stopped cause weapon rised";*/};
} else {
	if !( _anim in ["AinvPknlMstpSlayWrflDnon_1"] ) then {
		if (time >= tcb_animDelay) then {
			_helper setVariable ["stopped", true, true];
		};
	};
};	