
private _entries = ["hallOfShame", "entries"] call core_fnc_getSetting;
private _path = ["hallOfShame", "path"] call core_fnc_getSetting;

for "_x" from 0 to 99 do {
	private _name = format["BA_hos%1", _x];
	private _obj = missionNamespace getVariable _name;
	if !( isNil "_obj" ) then {
		if ( _x < count _entries ) then {
			[_obj, 0, format[_path, (_entries select _x)]] call global_fnc_setTexture;
		} else {
			hideObjectGlobal _obj;
		};
	};
};
