/*
@filename: feats\mods\serverInit.sqf
Author:
	Ben
Description:
	run on server
	check which mods were preInit and init then implent them
*/

call compileFinal preprocessFileLineNumbers "feats\mods\vanilla\init.sqf";
//call compileFinal preprocessFileLineNumbers "feats\mods\apex\init.sqf";

{
	_x params ["_mod"];
	private _isPresent = missionNamespace getVariable format["MOD_%1", _mod];
	if ( _isPresent) then {
		call compileFinal preprocessFileLineNumbers format["feats\mods\%1\init.sqf", _mod];
		//call compileFinal preprocessFileLineNumbers format["feats\mods\%1\init.sqf", _mod]; here
	};

} count (["mods"] call BIS_fnc_GetCfgData);