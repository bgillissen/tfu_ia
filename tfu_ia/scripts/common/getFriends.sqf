
params ["_side", "_exclude"];

private _out = [];

{
	if ( !(_x in _exclude) ) then {
		if ( (_side getFriend _x) >= 0.6 ) then { _out append [_x]; };	
	}
} count [east, west, independent, civilian];

_out