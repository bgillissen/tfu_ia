params [["_dlcFilter", 0], ["_kindFilters", []], ["_extFilters", []]];

_kindFilters pushback "B_AssaultPack_Base";
_kindFilters pushback "B_AssaultPack_rgr";
_kindFilters pushback "Weapon_Bag_Base";

private _filters = [_dlcFilter, [], _kindFilters, 0, '{true}', _extFilters] call assets_fnc_vehicleFilters;

_backpacks = ["CfgVehicles", _filters, "(configName (_this select 0))", []] call assets_fnc_searchThings;

/*
diag_log "RHS BACKPACKS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>";
{ 
	diag_log format["%1 => %2", _x, ( getText(configFile >> "CfgVehicles" >> _x >> "displayName"))];
} count _backpacks;
diag_log "RHS BACKPACKS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";
*/

_backpacks