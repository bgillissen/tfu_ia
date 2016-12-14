/*
@filename: settings.sqf
Author:
	Ben
Description:
	this script is executed once on all context (server, headless client, player)
	it defines the features settings
*/

//Players side (blufor / opfor)
#define PLAYER_SIDE "blufor"

//squadHint, squad name that will trigger a globalHint when a player join
#define SQUAD "Task Force Unicorn"

//vonHint, displayed teamSpeak address
#define TSADDR "ts.taskforceunicorn.com"

//radioFreq, Frequencies for the radio channels
#define TFAR_SR_FREQ_1 "300"
#define TFAR_SR_FREQ_2 "310"
#define TFAR_SR_FREQ_3 "320"
#define TFAR_SR_FREQ_4 "330"
#define TFAR_SR_FREQ_5 "340"
#define TFAR_SR_FREQ_6 "350"
#define TFAR_SR_FREQ_7 "360"
#define TFAR_SR_FREQ_8 "370"
#define TFAR_LR_FREQ_1 "50"
#define TFAR_LR_FREQ_2 "60"
#define TFAR_LR_FREQ_3 "70"
#define TFAR_LR_FREQ_4 "80"
#define TFAR_LR_FREQ_5 "90"
#define TFAR_LR_FREQ_6 "100"
#define TFAR_LR_FREQ_7 "110"
#define TFAR_LR_FREQ_8 "120"
#define TFAR_LR_FREQ_9 "130"

//voiceControl, which channel is allowed to who
#define VC_disabled [6]
#define VC_players [3,4,5]
#define VC_groupleader [2,3,4,5]
#define VC_admins [0,1,2,3,4,5]
#define VC_adminList []
#define VC_message "Talking in %1 is not allowed!\nPlease change your channel with %2 or %3"

//va and vas, control which assets will be included in the arsenal
#define VA_blufor_backpacks true
#define VA_blufor_weapons true
#define VA_blufor_items true
#define VA_opfor_backpacks false
#define VA_opfor_weapons false
#define VA_opfor_items false
#define VA_usaf_backpacks true
#define VA_usaf_weapons true
#define VA_usaf_items true
#define VA_afrf_backpacks false
#define VA_afrf_weapons false
#define VA_afrf_items false

//rewards, control which assets will be available in the reward pool
#define REWARD_opfor false
#define REWARD_blufor false
#define REWARD_usaf true
#define REWARD_afrf false

//revive,
#define REVIVE_distance 500
#define REVIVE_needFaks 1
#define REVIVE_bleedout 900
#define REVIVE_disableRespawn 0
