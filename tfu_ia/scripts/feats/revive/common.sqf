/*
@filename: feats\revive\common.sqf
Credits:
	 =BTC= Giallustio
Author:
	Ben
Description:
	This script is executed once on all context,
	define settings for the revive feature
*/

BTC_r_new_system    = 0; 											//WIP - set 1 to activate it
BTC_r_wait_for_revive = 1;											//If BTC_r_new_system set to 1 you can choose if you want or not a revive time available after death (Similar to wounding system in ACE)
BTC_r_action        = 0;											//[NOT IMPLEMENTED] - 0 if you don't want the healing animation (ACE style), 1 if you want the animations (You can't stop the animation)
BTC_r_med_fa        = 1;											//0 for only first aid kit, 1 if you don't have a medikit you need a first aid kit, 2 only medikit
BTC_r_cpr_time      = 20;
BTC_r_trans_ratio   = 100;
BTC_revive_time_min = 3;
BTC_revive_time_max = ["Revive_bleedout"] call core_fnc_getConf;
BTC_who_can_revive  = ["revive", "btc", "medicClass"] call BIS_fnc_GetCfgData;
BTC_loop_check      = 1;
BTC_disable_respawn = ["Revive_noRespawn"] call core_fnc_getConf;
BTC_respawn_gear    = 1;
BTC_active_lifes    = 10;
BTC_lifes           = 999;
BTC_spectating      = 0;											//0 = disable; 1 = units group; 2 = side units; 3 = all units
BTC_spectating_view = [0,0];										//To force a view set the first number of the array to 1. The second one is the view mode: 0 = first person; 1 = behind the back; 2 = High; 3 = free
BTC_s_mode_view     = ["First person","Behind the back","High","Free"];
BTC_black_screen    = 0;											//Black screen + button while unconscious or action wheel and clear view
BTC_action_respawn  = 0;											//if black screen is set to 0 you can choose if you want to use the action wheel or the button. Keep in mind that if you don't use the button, the injured player can use all the action, frag too....
BTC_camera_unc      = 1;
BTC_camera_unc_type = ["Behind the back","High"];
BTC_respawn_time    = 3;
BTC_active_mobile   = 0;											//Active mobile respawn (You have to put in map the vehicle and give it a name. Then you have to add one object per side to move to the mobile (BTC_base_flag_west,BTC_base_flag_east) - (1 = yes, 0 = no))
BTC_mobile_respawn  = 0;											//Active the mobile respawn fnc (1 = yes, 0 = no)
BTC_mobile_respawn_time = 30;										//Secs delay for mobile vehicle to respawn
BTC_need_first_aid = ["Revive_needFaks"] call core_fnc_getConf;		//You need a first aid kit to revive (1 = yes, 0 = no)
BTC_pvp = 0; 														//(disable the revive option for the enemy)

call compile preprocessFile "feats\revive\functions.sqf";

BTC_injured_marker = 0;
BTC_3d_can_see     = ["revive", "btc", "medicClass"] call BIS_fnc_GetCfgData;
BTC_3d_distance    = ["Revive_distance"] call core_fnc_getConf;
BTC_3d_icon_size   = 0.5;
BTC_3d_icon_color  = [1,0,0,1];										// Red
BTC_dlg_on_respawn = 0;												//1 = Mobile only - 2 Leader group and mobile - 3 = Units group and mobile - 4 = All side units and mobile
BTC_objects_actions_west = [];					// this is the object name
BTC_objects_actions_east = [];
BTC_objects_actions_guer = [];
BTC_objects_actions_civ  = [];