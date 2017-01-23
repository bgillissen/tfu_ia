
params ["_wounded", "_helper"];

_helper setVariable ["action", ["help", _wounded]];
_helper setVariable ["stopped", false, true];
_wounded setVariable ["helper", _helper, true];