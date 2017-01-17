params ["_config", "_filters", "_apply", ["_params", ""]];

_filters pushback "getText( _x >> 'author' ) isEqualTo 'Red Hammer Studios' || getText( _x >> 'author' ) isEqualTo 'RHS (A2 port)'";

if ( isNil "_apply" ) exitWith {
	[_config, _filters] call assets_fnc_searchThings;
};
[_config, _filters, _apply, _params] call assets_fnc_searchThings;