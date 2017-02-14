

private _path = ["flags", "path"] call core_fnc_getSetting;

{
	_x params ["_thing", "_actions"];
	{
		if ( (configName _x) isEqualTo "flag" ) then { 
			[_thing, "basic", getText(_x >> "texture")] call flags_fnc_setTexture;
		};
	} forEach _actions;
} forEach BA_obj;

countryFlagMarkers = [];

for "_i" from 1 to 99 do {
	private _marker = format["countryFlag_%1", _i];
	if !( (getMarkerPos _marker) isEqualTo [0,0,0] ) then {
		countryFlagMarkers pushback _marker;
	};
};

call flags_fnc_countryFlags;

if ( isNil "flagPVEH" ) then {
	flagPVEH = "memberData" addPublicVariableEventHandler {
		[] spawn flags_fnc_countryFlags;
	};
};