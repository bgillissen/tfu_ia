
params ["_config", "_filters", "_apply", "_params"];

_filters pushback "getText( _x >> 'author' ) isEqualTo 'Bohemia Interactive'";

[_config, _filters, _apply, _params] call assets_fnc_searchThings;