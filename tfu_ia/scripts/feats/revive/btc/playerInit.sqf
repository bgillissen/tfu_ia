/*
@filename: feats\revive\player.sqf
Credits:
	 =BTC= Giallustio
Author:
	Ben
Description:
	This script is executed once on player side,
	define settings for the revive feature and init it
*/

#ifndef MOD_ace

call compile preprocessFile "feats\revive\common.sqf";

BTC_dragging = false;
BTC_respawn_cond = false;

"BTC_drag_pveh" addPublicVariableEventHandler BTC_fnc_PVEH;
"BTC_carry_pveh" addPublicVariableEventHandler BTC_fnc_PVEH;
"BTC_marker_pveh" addPublicVariableEventHandler BTC_fnc_PVEH;
"BTC_load_pveh" addPublicVariableEventHandler BTC_fnc_PVEH;
"BTC_pullout_pveh" addPublicVariableEventHandler BTC_fnc_PVEH;
"BTC_killed_pveh" addPublicVariableEventHandler BTC_fnc_PVEH;

BTC_r_mobile_selected = objNull;
BTC_r_bleeding = 0;
BTC_r_bleeding_loop = false;
player addRating 9999;
BTC_r_list = [];
BTC_side = playerSide;
BTC_r_s_cam_view = [-15,-15,15];
BTC_respawn_marker = format ["respawn_%1",playerSide];
if (BTC_respawn_marker == "respawn_guer") then {BTC_respawn_marker = "respawn_guerrila";};
if (BTC_respawn_marker == "respawn_civ") then {BTC_respawn_marker = "respawn_civilian";};
BTC_r_base_spawn = "Land_HelipadEmpty_F" createVehicleLocal getMarkerPos BTC_respawn_marker;
if (BTC_r_new_system == 0) then {
	player addEventHandler ["Killed",BTC_player_killed];
} else {	
	"BTC_cpr_pveh" addPublicVariableEventHandler BTC_fnc_PVEH;
	"BTC_ban_pveh" addPublicVariableEventHandler BTC_fnc_PVEH;
	"BTC_med_pveh" addPublicVariableEventHandler BTC_fnc_PVEH;
	"BTC_anim_pveh" addPublicVariableEventHandler BTC_fnc_PVEH;
	player setVariable ["BTC_r_status",[0,0,0,0,0],true];
	player addEventHandler ["HandleDamage", BTC_fnc_handledamage];
	player addEventHandler ["Killed", BTC_eh_killed];
	BIS_fnc_healthEffects_handleDamage_code = {};
	BIS_fnc_healtEffects_init = {};
	BTC_r_action_menu = true;
	BTC_r_med_effect = false;
	BTC_is_bleeding = false;
	enableCamShake true;
	BTC_r_unc = false;
	BTC_r_unc_loop = false;
	BTC_r_damage = 0;
	BTC_r_head = 0;
	BTC_r_damage_legs = 0;
	BTC_r_damage_hands = 0;
	BTC_r_hit = 0;
};
	
player setVariable ["BTC_need_revive",0,true];
player setVariable ["BTC_dragged",0,true];	
if (BTC_pvp == 1) then {
	player setVariable ["BTC_revive_side",str (BTC_side),true];
};

	
if ([player] call BTC_is_class_can_revive) then {
	player addAction [("<t color=""#ED2744"">") + ("First aid") + "</t>","feats\revive\addAction.sqf",[[],BTC_first_aid], 8, true, true, "", "[] call BTC_check_action_first_aid"];
};	

if (BTC_Medical_TruckToggle != 0) then {
	if (!([player] call BTC_is_class_can_revive)) then {
		player addAction [("<t color=""#ED2744"">") + (BTC_Medical_Trucks_addActionText) + "</t>","feats\revive\addAction.sqf",[[],BTC_first_aid], 8, true, true, "", "[] call BTC_check_action_HEMTT"];
	};
};
player addAction [("<t color=""#ED2744"">") + ("Drag") + "</t>","feats\revive\addAction.sqf",[[],BTC_drag], 8, true, true, "", "[] call BTC_check_action_drag"];
player addAction [("<t color=""#ED2744"">") + ("Carry") + "</t>","feats\revive\addAction.sqf",[[],BTC_carry], 8, true, true, "", "[] call BTC_check_action_drag"];
player addAction [("<t color=""#ED2744"">") + ("Pull out injured") + "</t>","feats\revive\addAction.sqf",[[],BTC_pull_out], 8, true, true, "", "[] call BTC_pull_out_check"];
	
if (BTC_active_mobile == 1) then {	
	switch (true) do {
		case (BTC_side == west) : {
									{
										private ["_veh"];
										_veh = _x;
										_spawn = [_x] spawn BTC_mobile_marker;
										{
											_x addAction [("<t color=""#ED2744"">") + (west_BTC_mobileRespawn_addActionText) + "</t>","feats\revive\addAction.sqf",[[_veh],BTC_move_to_mobile], 8, true, true, "", format ["[""%1""] call BTC_mobile_check",_veh]];
										} foreach BTC_objects_actions_west;
									} foreach BTC_vehs_mobile_west_str;
								   };
		case (BTC_side == east) : {
									{
										private ["_veh"];
										_veh = _x;
										_spawn = [_x] spawn BTC_mobile_marker;
										{
											_x addAction [("<t color=""#ED2744"">") + (east_BTC_mobileRespawn_addActionText) + "</t>","feats\revive\addAction.sqf",[[_veh],BTC_move_to_mobile], 8, true, true, "", format ["[""%1""] call BTC_mobile_check",_veh]];
										} foreach BTC_objects_actions_east;
									} foreach BTC_vehs_mobile_east_str;
								  };
		case (str (BTC_side) == "guer") : {
											{
												private ["_veh"];
												_veh = _x;
												_spawn = [_x] spawn BTC_mobile_marker;
												{
													_x addAction [("<t color=""#ED2744"">") + (resistance_BTC_mobileRespawn_addActionText) + "</t>","feats\revive\addAction.sqf",[[_veh],BTC_move_to_mobile], 8, true, true, "", format ["[""%1""] call BTC_mobile_check",_veh]];
												} foreach BTC_objects_actions_guer;
											} foreach BTC_vehs_mobile_guer_str;
										  };
		case (BTC_side == civilian) : {
										{
											private ["_veh"];
											_veh = _x;
											_spawn = [_x] spawn BTC_mobile_marker;
											{
												_x addAction [("<t color=""#ED2744"">") + (civilian_BTC_mobileRespawn_addActionText) + "</t>","feats\revive\addAction.sqf",[[_veh],BTC_move_to_mobile], 8, true, true, "", format ["[""%1""] call BTC_mobile_check",_veh]];
											} foreach BTC_objects_actions_civ;
										} foreach BTC_vehs_mobile_civ_str;
									  };
	};
} else {	
	BTC_vehs_mobile_west_str = [];
	BTC_vehs_mobile_east_str = [];
	BTC_vehs_mobile_guer_str = [];
	BTC_vehs_mobile_civ_str = [];
};

if (({player isKindOf _x} count BTC_3d_can_see) > 0) then {
	if (BTC_pvp == 1) then {
		_3d = [] spawn BTC_3d_markers_pvp;
	} else {
		_3d = [] spawn BTC_3d_markers;
	};
};

BTC_revive_started = true;

#endif