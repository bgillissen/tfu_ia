/*
@filename: feats\dynBillboards\playerOnRespawn.sqf
Author:
	Ben
Description:
	called on player side each time player (re)spawn.
	It changes the texture displayed on the billboards with a mode set to random.
*/

{
	private _vname = format["DB_%1", _forEachIndex];
	if ( !isNil _vname ) then {
		_obj = missionNamespace getVariable _vname;
		[_obj, _x] call dynBillboards_fnc_setTexture;
	};
} forEach (["dynBillboards", "mode"] call BIS_fnc_GetCfgData);