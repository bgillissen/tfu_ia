
if ( [player, "firstAidKit"] call revive_fnc_gotItem ) exitWith {
	player removeItem "firstAidKit";
};

_this removeItem "firstAidKit";