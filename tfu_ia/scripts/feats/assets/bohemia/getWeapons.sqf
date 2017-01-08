params [["_dlcFilter", 0], ["_kindFilter", ""], ["_extFilters", []]];

private _filters = [_dlcFilter, _kindFilter, _extFilters] call assets_fnc_weaponFilters;

private _weapons = [];

0 = ["CfgWeapons", _filters, "[_this select 0, _this select 1] call assets_fnc_addWeapon", _weapons] call bohemia_fnc_searchThings;

/*
diag_log "BOHEMIA WEAPONS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>";

{ 
	diag_log format["'%1'; //%2", _x, ( getText(configFile >> "CfgWeapons" >> _x >> "displayName"))];
} count _weapons;

diag_log "BOHEMIA WEAPONS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";
*/

_weapons