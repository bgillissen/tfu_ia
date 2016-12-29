
params ["_kID"];

private _kVal = missionNamespace getVariable format["%1_k", _kID];

private _out = [];

{
	_out set [_forEachIndex]  = _this select (_forEachIndex + 1);
} forEach (PV select _kVal);

_out