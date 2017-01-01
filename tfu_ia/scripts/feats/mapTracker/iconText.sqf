/*
@filename: feats\mapTracker\iconColor.sqf
Credits: 
	Quiksilver
Author:
	Ben
Description:
	run on client
	return the text next to the icon to draw.
*/

params ["_veh"];

private _vn = _veh getVariable ["vn", ""];
if (_vn == "") then {
	_vn = getText (configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
	_veh setVariable ["vn", _vn];
};

private _t = "";

if (!isPlayer _veh) then {
	_au = ["I_UAV_01_F","B_UAV_01_F","O_UAV_01_F","I_UAV_02_F","O_UAV_02_F","I_UAV_02_CAS_F","O_UAV_02_CAS_F","B_UAV_02_F","B_UAV_02_CAS_F","O_UAV_01_F","O_UGV_01_F","O_UGV_01_rcws_F","I_UGV_01_F","B_UGV_01_F","I_UGV_01_rcws_F","B_UGV_01_rcws_F","B_GMG_01_A_F","B_HMG_01_A_F","O_GMG_01_A_F","O_HMG_01_A_F","I_GMG_01_A_F","I_HMG_01_A_F"];
	if ( (typeOf _veh) in _au ) exitWith {
		if (isUavConnected _veh) then {	
			_t = format ["%1 [%2]", (name (UAVControl _veh) select 0), _vdn];
		} else {
			_t = format ["[AI] [%1]", _vdn];
		};
	};
} else {
	private _vdn = name ((crew _veh) select 0);
	private _n = 0;
	_n = ((count crew _veh) - 1);
	if (_n > 0) then {
		if (!isNull driver _veh) then {
			_t = format ["%1 [%2] +%3", _vdn, _vn, _n];
		} else {
			_t = format ["[%1] %2 +%3", _vdn, _vn, _n];
		};
	} else {
		if (!isNull driver _veh) then {
			_t = format ["%1 [%2]", _vdn, _vn];
		} else {
			_t = format ["[%1] %2", _vn, _vdn];
		};
	};
};

_t