
params ["role"];

private _vest = "mostgeneric_vest";

if ( ("jungle" in MAP_KEYWORDS) || ("wood" in MAP_KEYWORDS) ) then {
	_vest = "mostgeneric_vest_woodland";
	if ( "role" in ["tl", "sl"] ) then { _vest = "vest_for_teamleader_squadLeader"; };
	if ( "role" isEqualTo "grenadier" ) then { _vest = "vest_for_grenadier"; };
	if ( "role" isEqualTo "medic" ) exitWith { _vest = "vest_for_medic"; };
};
if ( "desert" in MAP_KEYWORDS ) then { 
	_vest = "mostgeneric_vest_desert";
	if ( "role" in ["tl", "sl"] ) exitWith { _vest = "vest_for_teamleader/squadLeader"; };
	if ( "role" isEqualTo "grenadier" ) exitWith { _vest = "vest_for_grenadier"; };
	if ( "role" isEqualTo "medic" ) exitWith { _vest = "vest_for_medic"; };
};
if ( "dry" in MAP_KEYWORDS ) then {
	_vest = "mostgeneric_vest_dry";
	if ( "role" in ["tl", "sl"] ) exitWith { _vest = "vest_for_teamleader/squadLeader"; };
	if ( "role" isEqualTo "grenadier" ) exitWith { _vest = "vest_for_grenadier"; };
	if ( "role" isEqualTo "medic" ) exitWith { _vest = "vest_for_medic"; };
};

_vest