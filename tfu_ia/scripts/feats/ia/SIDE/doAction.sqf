
params ["_object", "_caller", "_id"];

//TODO got to do it on all players
private _anim = ["ia", "side", "plantAnim"] call core_fnc_getSetting;
[_caller, _anim, 2] call common_fnc_doAnim;
//switchMove (["ia", "side", "plantAnim"] call core_fnc_getSetting);

SIDE_success=true;
publicVariableServer 'SIDE_success';

_object removeAction _id; 