
params["_config", "_filters", "_apply", ["_params", ""]];

_filters pushback "getNumber( _x >> 'scope' ) isEqualTo 2";

private _cond = format["((%1))", (_filters joinString ") && (")];

if ( isNil "_apply" ) exitWith {
	 _cond configClasses ( configFile >> _config )
};

private _code = compile _apply;

_cond configClasses ( configFile >> _config ) apply { ([_x, _params] call _code) }