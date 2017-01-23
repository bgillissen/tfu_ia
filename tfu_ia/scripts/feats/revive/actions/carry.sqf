// by psycho
params ["_wounded", "_carrier"];

if !( (secondaryWeapon _carrier) isEqualTo "" ) exitWith {
	"You are not able to carry anyone else while carrying a launcher on your back." call revive_fnc_dynamicText;
};

_carrier setVariable ["action", ['carry', _wounded]];
_wounded setVariable ["carrier", _carrier, true];