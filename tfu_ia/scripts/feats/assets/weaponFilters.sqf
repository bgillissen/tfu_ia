
params [["_dlcFilter", 0], ["_kindFilter", ""], ["_extFilters", []]];
        
private _filters = [];

if ( !(_dlcFilter isEqualto 0) ) then {
	_filters pushback format["getText( _x >> 'dlc' ) isEqualTo '%1'", _dlcFilter];
};

if ( !(_kindFilter isEqualto "") ) then {
	_filters pushback format["(configName _x) isKindOf ['%1', (configFile >> 'CfgWeapons')]", _kindFilter];
};

_filters append _extFilters;

_filters pushback "getNumber( _x >> 'type' ) in [1,4,2]";

_filters