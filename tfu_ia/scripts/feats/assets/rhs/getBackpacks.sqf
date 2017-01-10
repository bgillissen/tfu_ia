params [["_dlcFilter", 0], ["_kindFilter", ""], ["_extFilters", []]];

private _filters = [];

if ( !(_dlcFilter isEqualto 0) ) then {
	_filters pushback format["getText( _x >> 'dlc' ) isEqualTo '%1'", _dlcFilter];
};

if ( !(_kindFilter isEqualto "") ) then {
	_filters pushback format["(configName _x) isKindOf ['%1', (configFile >> 'CfgWeapons')]", _kindFilter];
};

_filters append _extFilters;

_filters pushback "getNumber(_x >> 'itemInfo' >> 'type') isEqualTo 901"; 

_backpacks = ["CfgWeapons", _filters, "diag_log _this;(configName (_this select 0))", []] call rhs_fnc_searchThings;

diag_log "RHS BACKPACKS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>";
diag_log _backpacks;

{ 
	diag_log format["%1 => %2", _x, ( getText(configFile >> "CfgWeapons" >> _x >> "displayName"))];
} count _backpacks;

diag_log "RHS BACKPACKS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";

_backpacks