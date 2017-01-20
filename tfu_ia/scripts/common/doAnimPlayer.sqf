
params ["_unit", "_anim", ["_priority", 0]];

switch (_priority) do {
    case 0: { _unit playMove _anim; };
    case 1: { _unit playMoveNow _anim; };
    case 2: { _unit switchMove _anim; };
    default {};
};