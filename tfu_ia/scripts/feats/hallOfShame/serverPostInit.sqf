

private _entries = ["hallOfShame", "entries"] call core_fnc_getSetting;
private _path = ["hallOfShame", "path"] call core_fnc_getSetting;

private _c = 0;
{
	_x params ["_thing", "_actions", "_mode"];
	if ( "hos" in _actions ) then {
		if ( _c < count _entries ) then {
			_thing setObjectTextureGlobal [0, format[_path, _entries select _c]];
			_c = _c + 1;
		} else {
			hideObjectGlobal _thing;
		};
	};
	true
} count BA_obj;
