// by BonInf*
// changed by psycho
params ["_wounded", "_healer"];

_healer setVariable ["action", _wounded];
_healer setVariable ["stopped", false, true];
_wounded setVariable ["healer", _healer, true];