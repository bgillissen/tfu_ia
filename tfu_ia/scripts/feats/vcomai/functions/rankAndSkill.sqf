
if !( VCOM_AISkillEnabled ) exitWith {};

private _rank = [_this] call vcomai_fnc_determineRank;

[_this, _rank] call common_fnc_setSkill;