/*
@filename: feats\flags\setTexture.sqf
Author:
	Ben
Description:
	run on server.
*/

params ["_obj", "_type", "_texture"];

private _path = "";
{
	if ( _texture in getArray(_x >> "flags" >> _type >> "entries") ) then {
		_path = getText(_cfg >> "path");
	};
} forEach ("true" configClasses (configFile >> "cfgDirectAction"));

if !( _path isEqualTo "" ) then {
	[_obj, format[_path, _texture]] call global_fnc_setFlagTexture;
};