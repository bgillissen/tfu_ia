/*
@filename: settings.sqf
Author:
	Ben
Description:
	included by game engine (description.ext)
	it defines features settings that can't be set by mission parameters
*/

//do we debug ?, !!! MUST comment the following line if not
#define DEBUG true

//init, needed to lock the server while server side features are loading
#define srvCMDpass "honeybadger";
#define unlockDelay 15;

//squadHint, squad name that will trigger a globalHint when one of his members join
#define SH_name "Task Force Unicorn"
#define SH_url "taskforceunicorn.com"
#define SH msg"<t align='center' size='2.2' color='#FAAF3A'>%1<br/></t><t size='1.4' color='#33CCFF'>%2</t><br/>has joined the server, To become a TFU member, apply to %3</t><br/>"
//vonHint, displayed teamSpeak address
#define TSADDR "ts.taskforceunicorn.com"

//baseProtection
#define BP_MSG "You are discharging your weapon at base without approval.  Cease your actions Immediately!"
#define BP_sleepDelay 10

//loadBalance (headless)
#define LB_loopDelay 60

//gearRestriction
#define GR_atMSG "Only AT/AA soldiers may use this weapon system, launcher removed."
#define GR_mgMSG "Only Autoriflemen may use this machine gun, weapon removed."
#define GR_sRifleMSG "Only snipers may use this rifle, rifle removed."
#define GR_mRifleMSG "Only snipers/marksmans may use this rifle, rifle removed."
#define GR_sOpticMSG "Only snipers may use this long range optic, optic removed."
#define GR_mOpticMSG "Only snipers/markmans may use this long range optic, optic removed."
#define GR_oOpticMSG "Only squad or team leader may use thermal optics, optic removed."
#define GR_backpackMSG "Only AT/AA soldier may use this backpack, backpack removed."
#define GR_uavMSG "Only UAV operator may use this item, UAV terminal removed."
#define GR_msgDuration 5

//curator
#define CURATOR_uids []
#define CURATOR_web true
#define CURATOR_url "http://taskforcunicorn.com/api/curators"
#define CURATOR_noSlotMsg "No more free Zeus slot available (%1 / %2)."
#define CURATOR_ascendMsg "%3 has ascend, %1 / %2 Zeus slot in use."
#define CURATOR_failedMsg "%1 has tryed to ascend."
#define CURATOR_descendMsg "%3 has descend, %1 / %2 Zeus slot in use."

//dynBillboards
#define DB_left Bill_1
#define DB_leftMode "random"
#define DB_right Bill_2
#define DB_rightMode "random"
#define DB_path "media\billboards\%1.paa"
#define DB_totRandom 6

//earPlugs
#define EP_volume 0.2
#define EP_onMsg "EarPlugs fitted"
#define EP_offMsg "EarPlugs removed"
#define EP_showHint false
#define EP_keycode 197	//pause/break key
#define EP_hint "<t color='#ff9d00' size='1.2' shadow='1' shadowColor='#000000' align='center'>** Earplugs Recieved **</t>          Use [Pause/Break] key to Insert and Remove"

//radioFreq, short/long range channel frequencies
#define RF_SR_FREQ_1 "300"
#define RF_SR_FREQ_2 "310"
#define RF_SR_FREQ_3 "320"
#define RF_SR_FREQ_4 "330"
#define RF_SR_FREQ_5 "340"
#define RF_SR_FREQ_6 "350"
#define RF_SR_FREQ_7 "360"
#define RF_SR_FREQ_8 "370"
#define RF_LR_FREQ_1 "50"
#define RF_LR_FREQ_2 "60"
#define RF_LR_FREQ_3 "70"
#define RF_LR_FREQ_4 "80"
#define RF_LR_FREQ_5 "90"
#define RF_LR_FREQ_6 "100"
#define RF_LR_FREQ_7 "110"
#define RF_LR_FREQ_8 "120"
#define RF_LR_FREQ_9 "130"

//voiceControl, which channel is allowed to who
#define VC_disabled [6]
#define VC_players [3,4,5]
#define VC_groupleader [2,3,4,5]
#define VC_admins [0,1,2,3,4,5]
#define VC_adminList []
#define VC_message "Talking in %1 is not allowed!\nPlease change your channel with %2 or %3"

//supplyDrop
#define SD_minAltitude 40
#define SD_msgFrom "HQ"
#define SD_msgAvail "Supply Drop is available."
#define SD_msgDeployed "Supply Drop has been deployed."
#define SD_checkDelay 20
#define_SD_smoke =  "SmokeShellPurple";
#define SD_light =  "Chemlight_blue";

//vehicleRespaw
#define VR_distanceFromSpawn 150
#define VR_checkDelay 20

//viewDistance
#define VD_foot 2200;
#define VD_car  3500;
#define VD_air  5000;

//invade & annex
#define IA_loopDelay 20
#define IA_checkDelay 5
#define IA_lockVeh true
#define IA_deleteDistance 1500
#define IA_crewStayInProb 25

#define AO_cooldown 120
#define AO_circle "aoCircle"
#define AO_label "aoLabel"
#define AO_newHint "<t align='center' size='2.2'>New Target</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/>We did a good job with the last target, lads. I want to see the same again. Get yourselves over to %1 and take them all down!<br/><br/>Remember to take down that radio tower to stop the enemy from calling in CAS."
#define AO_endHint "<t align='center' size='2.2'>Target Taken</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/><t align='left'>Fantastic job taking %1, boys! Give us a moment here at HQ and we'll line up your next target for you.</t>"
#define AO_endRTHint "<t align='center' size='2.2'>Radio Tower</t><br/><t size='1.5' color='#08b000' align='center'>DESTROYED</t><br/>____________________<br/>The enemy radio tower has been destroyed! Fantastic job, lads!<br/><br/><t size='1.2' color='#08b000' align='center'> The enemy cannot call in air support now!</t><br/>"
#define AO_rtMines 60
#define AO_rtMineTypes ["APERSBoundingMine", "APERSMine", "ATMine"]
#define AO_casSkill 2
#define AO_casCheckDelay 60
#define AO_casDelay 1200
#define AO_casInfAmmo true
#define AO_casInfFuel true
#define AO_casSearchRadius 5000
#define AO_patrolSkill 1
#define AO_sniperSkill 2
#define AO_garrisonSkill 1
#define AO_aaSkill 4
#define AO_tankSkill 2
#define AO_apcSkill 1
#define AO_carSkill 3
#define AO_airSkill 3
#define AO_airAltitude 300

#define FOB_pool ["ammo", "repair", "landMedic", "fuel"]
#define FOR_maxTime 3600
#define FOB_cooldown 900
#define FOB_newHint "<t align='center'><t size='2.2'>FOB created</t><br/><t size='1.5' color='#00B2EE'></t><br/>____________________<br/>We have created a FOB for you to use. You got %1 minutes to bring the supplies there.</t>"
#define FOB_failHint "<t align='center'><t size='2.2'>FOB Mission</t><br/><t size='1.5' color='#b60000'>FAILED</t><br/>____________________<br/>You'll have to do better than that next time!<br/><br/><br/>Focus on the main objective for now; we'll relay the bad news to HQ, with some luck we'll have another objective lined up. We'll get back to you with an other one in some time.</t>"
#define FOB_newZoneHint "<t align='center'><t size='2.2'>FOB Mission</t><br/><br/>____________________<br/>Operations in the area have ceased.<br/><br/>The resources are no longer needed.</t>";
#define FOB_successHint "<t align='center'><t size='2.2'>FOB Mission</t><br/><t size='1.5' color='#FFCF11'>SUCCESS</t><br/>____________________<br/>Good job getting the supplies to the FOB. You have been rewarded with<br/>%1</t>"
#define FOR_waveDelay 600
#define FOB_skill 2
#define FOB_minDistToDepot 500

#define SIDE_cooldown 120
#define SIDE_minDistFromBase 2000
#define SIDE_minDistFromAO 2000
#define SIDE_missions ["urban", "hqCoast", "research", "priority", "secure", "intel"]
#define SIDE_size 500
#define SIDE_circle "sideCircle"
#define SIDE_label "sideLabel"
#define SIDE_patrolSkill 1
#define SIDE_sniperSkill 2
#define SIDE_garrisonSkill 1
#define SIDE_aaSkill 4
#define SIDE_tankSkill 2
#define SIDE_apcSkill 1
#define SIDE_carSkill 3
#define SIDE_boomDelay 30
#define SIDE_briefing "<t align='center'><t size='2.2'>New Side Mission</t><br/><t size='1.5' color='#00B2EE'>%1</t><br/>____________________<br/>%2</t>"
#define SIDE_successHint "<t align='center'><t size='2.2'>Side Mission</t><br/><t size='1.5' color='#08b000'>COMPLETE</t><br/>____________________<br/>Fantastic job, lads! The enemies won't last long if you keep that up!<br/><br/>We've given you %1 to help with the fight. You'll find it at base.</t>"
#define SIDE_failHint "<t align='center'><t size='2.2'>Side Mission</t><br/><t size='1.5' color='#b60000'>FAILED</t><br/>____________________<br/>You'll have to do better than that next time!</t>"

#define SIDE_hqCoastTitle "Secure Smuggled Explosives"
#define SIDE_hqCoastBriefing "The enemy have been smuggling explosives and hiding them in a Mobile HQ on the coastline.<br/><br/>We've marked the building on your map; head over there and secure the current shipment. Keep well back when you blow it; there's a lot of stuff in that building."
#define SIDE_hqCoastPlanted "The charge has been set! %1 seconds until detonation."
#define SIDE_hqCoastAction "<t color='#ffff00'>Plant Charge</t>"


#define SIDE_urbanTitle "Destroy Weapons Shipment"
#define SIDE_urbanBriefing "The enemy is supplying insurgents with advanced weapons and explosives. Neutralize them!<br/><br/>We've marked the aproximative location on your map; Looks like it's in town. Get your CQB gear ready."
#define SIDE_urbanPlanted "The charge has been set! %1 seconds until detonation."
#define SIDE_urbanAction "<t color='#ffff00'>Plant Charge</t>"

#define SIDE_researchTitle "Seize Research Data"
#define SIDE_researchBriefing "The enemy is conducting advanced military research.<br/><br/>Find the data and then torch the place!"
#define SIDE_researchPlanted "Hard drive secured. The charge has been set! %1 seconds until detonation."
#define SIDE_researchAction "<t color='#ffff00'>Secure Data</t>"

#define SIDE_priorityMaxDistFromAO 4000
#define SIDE_priorityMinDistFromAO 1000
#define SIDE_priorityArtiProb 50
#define SIDE_priorityInfAmmo true
#define SIDE_priorityExtraHealth false
#define SIDE_priotityHBarrier "Land_HBarrierBig_F"
#define SIDE_priorityBriefing "<t align='center'><t size='2.2'>New Priority Target</t><br/><t size='1.5' color='#00B2EE'>%1</t><br/>____________________<br/>%2</t>"
#define SIDE_prioritySuccess "<t align='center'><t size='2.2'>Priority Target</t><br/><t size='1.5' color='#08b000'>NEUTRALISED<>/t><br/>____________________<br/>Incredible job, boys! Make sure you jump on those priority targets quickly; they can really cause havoc if they're left to their own devices.</t>"
#define SIDE_priorityArtiTitle "Artillery Battery"
#define SIDE_priorityArtiBriefing "The enemy is setting up an artillery battery to hit you guys damned hard! We've picked up their positions with thermal imaging scans and have marked it on your map.<br/><br/>This is a priority target, boys! They're just setting up now; they'll be firing soon!"
#define SIDE_priorityArtiNotification "Artillery Neutralised"
#define SIDE_priorityArtiRadius 25
#define SIDE_priorityArtiSalve 4
#define SIDE_priorityArtiSalveDelay 6
#define SIDE_priorityArtiFiringMsg [\
		"Thermal scans are picking up those enemy Artillery firing! Heads down!",\
		"Enemy Artillery rounds incoming! Advise you seek cover immediately.",\
		"The Artillery team's firing, boys! Down on the ground!",\
		"Get that damned Artillery team down; they're firing right now! Seek cover!",\
		"They're zeroing in! Incoming Artillery fire; heads down!"]
#define SIDE_priorityAATitle "Anti-Air Battery"
#define SIDe_priorityAABriefing "The enemy is setting up an anti-air battery to hit you guys damned hard! We've picked up their positions with thermal imaging scans and have marked it on your map.<br/><br/>This is a priority target, boys!"
#define SIDE_priorityAANotification "Anti-Air Battery Neutralised"
#define SIDE_priorityAARange 2500

#define SIDE_priorityBriefing

#define SIDE_secureTitle

#define SIDE_intelHint
