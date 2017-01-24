// by Bon_Inf*
params ["_wounded", "_dragger"];

diag_log format["actionDrag: dragger:%1 --- unit:%2", _dragger, _wounded];

_dragger setVariable ["action", ['drag', _wounded]];
_wounded setVariable ["dragger", _dragger, true];