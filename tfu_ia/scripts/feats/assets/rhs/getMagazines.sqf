params [["_dlcFilter", ""]];

private _extFilters = [];

if ( !(_dlcFilter isEqualTo "") ) then {
	_extfilters pushback format["((configName _x) call rhs_fnc_magAddon) isEqualTo '%1'", _dlcFilter];
};

private _filters = [0, _extFilters] call assets_fnc_magazineFilters;

private _mags = [];

0 = ["CfgMagazines", _filters, "[_this select 0, _this select 1] call assets_fnc_addMagazine", _mags] call rhs_fnc_searchThings;
/*
diag_log "RHS MAGAZINES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>";
{ 
	diag_log format["%1 => %2", _x, ( getText(configFile >> "CfgMagazines" >> _x >> "displayName"))];
} count _mags;

diag_log "RHS MAGAZINES <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";
*/
_mags