// by Bon_Inf*
params ["_wounded", "_dragger"];

_dragger setVariable ["action", ['drag', _wounded]];
_wounded setVariable ["dragger", _dragger, true];