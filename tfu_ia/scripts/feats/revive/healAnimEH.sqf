params ["_healer", "_anim"];

if (primaryWeapon _healer != "") then {
	if (time >= reviveAnimDelay) then {
		_healer setVariable ["stopped", true, true];
	};
} else {
	if (_anim in ["amovpknlmstpsnonwnondnon","amovpknlmstpsraswlnrdnon"]) then {
		[_healer, "medicStart"] call common_fnc_doGesture;
	} else {
		if (!(_anim in ["ainvpknlmstpsnonwnondnon_medic0s","ainvpknlmstpsnonwnondnon_medic"])) then {
			if (time >= reviveAnimDelay) then {
				_healer setVariable ["stopped", true, true];
			};
		};
	};
};