
params ['_move', '_now'];

if ( _now ) then {
	player playMoveNow _move;
} else {
	player playMove _move;
};