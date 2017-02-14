
if !( isNil "countryFlags" ) then {
	{ deleteVehicle _x; } forEach countryFlags;
};

countryFlags = [];

//diag_log format["count countryFlagMarkers: %1", (count countryFlagMarkers)];

if ( (count countryFlagMarkers) == 0 ) exitWith {};

private _countries = [];

{
	private _country = _x select 6;
	if !( _country in _countries ) then {
		_countries pushback _country;
	}
} forEach memberData;

if ( (count _countries) == 0 ) exitWith {};

{
	if ( _forEachIndex >= (count countryFlagMArkers) ) exitWith {
		diag_log format["No enough countryFlagMarkers for the amount of countries, got: %1, needed: %2", count countryFlagMarkers, count _countries];
	};
	private _flag = createVehicle ["FlagPole_F", (getMarkerPos (countryFlagMarkers select _forEachIndex)), [], 0, "CAN_COLLIDE"];
	_flag allowDamage false;
	[_flag, "countries", toLower(_x)] call flags_fnc_setTexture;
	countryFlags pushback _flag;
} forEach _countries;