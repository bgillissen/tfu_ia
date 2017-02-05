

private _path = ["flags", "path"] call core_fnc_getSetting;

{
	_x params ["_thing", "_actions"];
	{
		_x params ["_action", "_conf"];
		if ( "flag" isEqualTo _action ) then { 
			[_thing, format[_path, _conf]] call global_fnc_setFlagTexture;
		};
		true
	} count _actions;
	true
} count BA_obj;

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