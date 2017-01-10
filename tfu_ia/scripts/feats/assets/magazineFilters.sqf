
params [["_dlcFilter", 0], ["_extFilters", []]];
        
private _filters = [];

if ( !(_dlcFilter isEqualto 0) ) then {
	_filters pushback format["getText( _x >> 'dlc' ) isEqualTo '%1'", _dlcFilter];
};

_filters append _extFilters;

_filters pushback "!((configName _x) isKindOf ['VehicleMagazine', (configFile >> 'CfgMagazines')])";

_filters