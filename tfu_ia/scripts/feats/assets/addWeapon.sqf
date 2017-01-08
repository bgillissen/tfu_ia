
params["_path", "_pool"];

private _toadd = [configName _path] call assets_fnc_baseWeapon;

if ( !(_toadd in _pool) ) then { _pool pushback _toadd; };