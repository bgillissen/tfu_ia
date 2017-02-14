
private _i = 0;
{
	private _entries = getArray(_x >> "hallOfShame" >> "entries");
	private _path = getText(_x >> "hallOfShame" >> "path");
	{
		private _name = format["BA_hos%1", _i];
		private _obj = missionNamespace getVariable _name;
		if !( isNil "_obj" ) then {
			[_obj, 0, format[_path, _x]] call global_fnc_setTexture;
			_i = _i + 1;
		};
	} forEach _entries;
} forEach ("true" configClasses (configFile >> "cfgDirectAction"));

for "_x" from _i to 99 do {
	private _name = format["BA_hos%1", _x];
	private _obj = missionNamespace getVariable _name;
	if !( isNil "_obj" ) then { hideObjectGlobal _obj; };
};