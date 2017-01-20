

private _path = ["flags", "path"] call core_fnc_getSetting;

{
	_x params ["_thing", "_actions"];
	{
		_x params ["_action", "_conf"];
		if ( "flag" isEqualTo _action ) then { 
			[_thing, format[_path, _conf]] call common_fnc_globalSetFlagTexture;
		};
		true
	} count _actions;
	true
} count BA_obj;