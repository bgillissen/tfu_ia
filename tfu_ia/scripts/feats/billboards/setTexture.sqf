/*
@filename: feats\billboards\setTexture.sqf
Author:
	Ben
Description:
	called on player side.
	It changes the texture displayed on the billboards.
*/

params ["_obj", "_type", "_texture"];

private _path = "";
{
	private _cfg = _x >> "billboards" >> _type;
	private _data = getArray(_cfg >> "entries");
	if ( _texture in getArray(_cfg >> "entries") ) then {
		_path = getText(_cfg >> "path");
	};
} forEach ("true" configClasses (configFile >> "cfgDirectAction"));

if !( _path isEqualTo "" ) then {
	_obj setObjectTexture [0, format[_path, _texture]];
};