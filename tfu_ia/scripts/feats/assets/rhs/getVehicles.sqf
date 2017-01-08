
params [["_dlcFilter", 0], ["_factionFilters", []], ["_kindFilters", []], ["_isArmed", 0], ["_extFilters", []]];

private _filters = [_dlcFilter, _factionFilters, _kindFilters, _isArmed, "rhs_fnc_isArmed", _extFilters] call assets_fnc_vehicleFilters;

private _veh = ["CfgVehicles", _filters, "configName (_this select 0)"] call rhs_fnc_searchThings;


diag_log "RHS VEH >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>";
{ 
	diag_log format["'%1'; //%2", _x, ( getText(configFile >> "CfgVehicles" >> _x >> "displayName"))];
} count _veh;

diag_log "RHS VEH <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";


_veh