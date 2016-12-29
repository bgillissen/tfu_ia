/*
@filename: feats\mods\serverInit.sqf
Author:
	Ben
Description:
	run on server
	check which mods were preInit and init then implent them
*/

{
	_x params ["_mod"];
	private _isPresent = missionNamespace getVariable format["MOD_%1", _mod];
	if ( _isPresent) then {
		call compileFinal preprocessFileLineNumbers format["feats\mods\%1\init.sqf", _mod];
	};

} count (["mods"] call BIS_fnc_GetCfgData);

call compileFinal preprocessFileLineNumbers "feats\mods\vanilla\implent.sqf";
//call compileFinal preprocessFileLineNumbers "feats\mods\apex\implent.sqf";

{
	_x params ["_mod"];
	private _isPresent = missionNamespace getVariable format["MOD_%1", _mod];
	if ( _isPresent) then {
		call compileFinal preprocessFileLineNumbers format["feats\mods\%1\implent.sqf", _mod];
	};

} count (["mods"] call BIS_fnc_GetCfgData);