
if !( VCOM_AISkillEnabled ) exitWith {};

private _rank = [_this] call vcomai_fnc_determineRank;
private _randomPath = ["vcomai", "skills", "randomness"];
private _rankPath = ["vcomai", "skills", format["rank%1", _rank]];

{
	private _base = (_rankPath + [_x]) call core_fnc_getSetting;
	private _random = (_randomPath + [_x]) call core_fnc_getSetting;
	_this setSkill [_x, (_base + (random _random))];
} forEach ["aimingAccuracy",
           "aimingShake",
           "aimingSpeed",
           "spotDistance",
           "spotTime",
           "courage",
           "commanding",
           "general",
           "endurance",
           "reloadSpeed"];