
params ['_action', '_now'];

if ( _now ) then {
	player playActionNow _action;
} else {
	player playAction _action;
};