/*
@filename: feats\mods\serverInit.sqf
Author:
	Ben
Description:
	run on server
	check which mods were preInit and init them
*/

diag_log "mods: Implenting vanilla";
call compileFinal preprocessFileLineNumbers "feats\mods\vanilla\init.sqf";

//diag_log "mods: Implenting apex";
//call compileFinal preprocessFileLineNumbers "feats\mods\apex\init.sqf";

{
	_x params ["_mod"];
	private _isPresent = missionNamespace getVariable format["MOD_%1", _mod];
	if ( _isPresent) then {
		diag_log format["mods: Implenting %1", _mod];
		call compileFinal preprocessFileLineNumbers format["feats\mods\%1\init.sqf", _mod];
	};

} count (["mods"] call BIS_fnc_GetCfgData);