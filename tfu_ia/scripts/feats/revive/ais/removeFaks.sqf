
if ( [player, "firstAidKit"] call tcb_fnc_gotItem ) exitWith {
	player removeItem "firstAidKit";
};

_this removeItem "firstAidKit";