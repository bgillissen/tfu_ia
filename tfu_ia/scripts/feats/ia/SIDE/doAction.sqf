
params ["_object", "_caller", "_id"];

//TODO got to do it on all players
_caller switchMove (["ia", "side", "plantAnim"] call core_fnc_getSetting);

SIDE_success=true;
publicVariableServer 'SIDE_success';

_object removeAction _id; 