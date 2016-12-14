/*
@filename: feats\revive\server.sqf
Credits:
	 =BTC= Giallustio
Author:
	Ben
Description:
	This script is executed once on server side,
	define settings for the revive feature and init it
*/

#ifndef MOD_ace

call compile preprocessFile "feats\revive\common.sqf";

BTC_vehs_mobile_west = [];
BTC_vehs_mobile_east = [];
BTC_vehs_mobile_guer = [];
BTC_vehs_mobile_civ  = [];

if (BTC_active_mobile == 1 && count BTC_vehs_mobile_west != 0) then {
	for "_i" from 0 to ((count BTC_vehs_mobile_west) - 1) do {
		_veh = (BTC_vehs_mobile_west select _i);
		_var = str (_veh);
		BTC_vehs_mobile_west_str = BTC_vehs_mobile_west_str + [_var];
		_veh setVariable ["BTC_mobile_west",_var,true];
		if (BTC_mobile_respawn == 1) then {
			_resp = [_veh,_var,"BTC_mobile_west"] spawn BTC_vehicle_mobile_respawn;
		};
	};
} else {
	{ deleteVehicle _x } foreach BTC_vehs_mobile_west;
};

if (BTC_active_mobile == 1 && count BTC_vehs_mobile_east != 0) then {
	for "_i" from 0 to ((count BTC_vehs_mobile_east) - 1) do {
		_veh = (BTC_vehs_mobile_east select _i);
		_var = str (_veh);
		BTC_vehs_mobile_east_str = BTC_vehs_mobile_east_str + [_var];
		_veh setVariable ["BTC_mobile_east",_var,true];
		if (BTC_mobile_respawn == 1) then {
			_resp = [_veh,_var,"BTC_mobile_east"] spawn BTC_vehicle_mobile_respawn;
		};
	};
} else {
	{ deleteVehicle _x } foreach BTC_vehs_mobile_east;
};

if (BTC_active_mobile == 1 && count BTC_vehs_mobile_guer != 0) then {
	for "_i" from 0 to ((count BTC_vehs_mobile_guer) - 1) do {
		_veh = (BTC_vehs_mobile_guer select _i);
		_var = str (_veh);
		BTC_vehs_mobile_guer_str = BTC_vehs_mobile_guer_str + [_var];
		_veh setVariable ["BTC_mobile_guer",_var,true];
		if (BTC_mobile_respawn == 1) then {
			_resp = [_veh,_var,"BTC_mobile_guer"] spawn BTC_vehicle_mobile_respawn;
		};
	};
} else {
	{deleteVehicle _x} foreach BTC_vehs_mobile_guer;
};

if (BTC_active_mobile == 1 && count BTC_vehs_mobile_civ != 0) then {
	for "_i" from 0 to ((count BTC_vehs_mobile_civ) - 1) do {
		_veh = (BTC_vehs_mobile_civ select _i);
		_var = str (_veh);
		BTC_vehs_mobile_civ_str = BTC_vehs_mobile_civ_str + [_var];
		_veh setVariable ["BTC_mobile_civ",_var,true];
		if (BTC_mobile_respawn == 1) then {
			_resp = [_veh,_var,"BTC_mobile_civ"] spawn BTC_vehicle_mobile_respawn;
		};
	};
} else {
	{deleteVehicle _x} foreach BTC_vehs_mobile_civ;
};

if (BTC_active_mobile == 1) then {
	publicVariable "BTC_vehs_mobile_west_str";
	publicVariable "BTC_vehs_mobile_east_str";
	publicVariable "BTC_vehs_mobile_guer_str";
	publicVariable "BTC_vehs_mobile_civ_str";
};

BTC_killed_pveh = [];publicVariable "BTC_killed_pveh";
BTC_drag_pveh = [];publicVariable "BTC_drag_pveh";
BTC_carry_pveh = [];publicVariable "BTC_carry_pveh";
BTC_marker_pveh = [];publicVariable "BTC_marker_pveh";
BTC_load_pveh = [];publicVariable "BTC_load_pveh";
BTC_pullout_pveh = [];publicVariable "BTC_pullout_pveh";

if (BTC_r_new_system == 1) then {
	BTC_anim_pveh = [];publicVariable "BTC_anim_pveh";
	BTC_cpr_pveh = [];publicVariable "BTC_cpr_pveh";
	BTC_ban_pveh = [];publicVariable "BTC_ban_pveh";
	BTC_med_pveh = [];publicVariable "BTC_med_pveh";
};

#endif