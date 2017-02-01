
params ["_unit", "_skill"];

private _path = ["ia", "skills", format["rank%1", _skill]];

{
	private _base = (_path + [_x]) call core_fnc_getSetting;
	private _random = (_path + [_x]) call core_fnc_getSetting;
	_unit setSkill [_x, (_base + (random _random))];
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