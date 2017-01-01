

private _entries = ["hallOfShame", "entries"] call BIS_fnc_GetCfgData;
private _path = ["hallOfShame", "path"] call BIS_fnc_GetCfgData;

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
