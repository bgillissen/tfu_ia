
if !( isNil "countryFlags" ) then {
	{ deleteVehicle _x; } forEach countryFlags;
};

countryFlags = [];

if ( count countryFlagMarkers == 0 ) exitWith {};

private _countries = [];

{
	private _country = _x select 6;
	if !( _country in _countries ) then {
		_countries pushback _country;
	}
} forEach memberData;

if ( (count _countries) == 0 ) exitWith {};

private _path = ["flags", "countries"] call core_fnc_getSetting;

{
	private _flag = "" createVehicle (getMarkerPos (contryFlagMarkers select _forEachIndex)));
	[_flag, format[_path, toLower(_x)]] call global_fnc_setFlagTexture;
	countryFlags pushback _flag;
} forEach _countries;