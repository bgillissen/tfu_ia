params [["_dlcFilter", 0], ["_kindFilter", ""], ["_extFilters", []]];

private _filters = [];

if ( !(_dlcFilter isEqualto 0) ) then {
	_filters pushback format["getText( _x >> 'dlc' ) isEqualTo '%1'", _dlcFilter];
};

if ( !(_kindFilter isEqualto "") ) then {
	_filters pushback format["(configName _x) isKindOf ['%1', (configFile >> 'CfgWeapons')]", _kindFilter];
};

_filters append _extFilters;

private _itemSlots = [101, 201, 301, 302, 401, 501, 601, 602, 603, 604, 605, 607, 611, 616, 617, 619, 620, 701, 801, 901];

_filters pushback format["getNumber(_x >> 'itemInfo' >> 'type') in %1", _itemSlots]; 

_items = ["CfgWeapons", _filters, "diag_log _this;(configName (_this select 0))", []] call rhs_fnc_searchThings;

//new search for binos


diag_log "RHS ITEMS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>";
diag_log _items;

{ 
	diag_log format["%1 => %2", _x, ( getText(configFile >> "CfgWeapons" >> _x >> "displayName"))];
} count _items;

diag_log "RHS ITEMS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";

_items