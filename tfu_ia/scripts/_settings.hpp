/*
@filename: settings.sqf
Author:
	Ben
Description:
	included by game engine (description.ext)
	it defines features settings that can't be set by mission parameters
*/

//init, needed to lock the server while server side features are loading
#define srvCMDpass "honeybadger";
#define unlockDelay 15;

//squadHint, squad name that will trigger a globalHint when one of his members join
#define SQUAD "Task Force Unicorn"

//vonHint, displayed teamSpeak address
#define TSADDR "ts.taskforceunicorn.com"

//curator url (space separated list of steamID), don't forget to change the description.ext ;)
#define CURATOR_url "http://taskforcunicorn.com/api/curators"
#define CURATOR_slot 4	//MUST BE SMALLER OR EGAL TO THE NUMBER OF GAME MASTER MODULE PLACED ON MAP
#define CURATOR_noSlotMsg "No more free Zeus slot available (%1 / %2)."
#define CURATOR_ascendMsg "%3 has ascend, %1 / %2 slots."
#define CURATOR_failedMsg "%1 has tryed to ascend."
#define CURATOR_descendMsg "%3 has descend, %1 / %2 slots."

//dynBillboards
#define DB_left Bill_1
#define DB_leftMode "random"
#define DB_right Bill_2
#define DB_rightMode "random"
#define DB_path "media\billboards\%1.paa"
#define DB_totRandom 6

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

//invade & annex
#define IA_loopDelay 20
#define IA_checkDelay 5
#define IA_newAOHint "<t align='center' size='2.2'>New Target</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/>We did a good job with the last target, lads. I want to see the same again. Get yourselves over to %1 and take them all down!<br/><br/>Remember to take down that radio tower to stop the enemy from calling in CAS."
#define IA_endAOHint "<t align='center' size='2.2'>Target Taken</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/><t align='left'>Fantastic job taking %1, boys! Give us a moment here at HQ and we'll line up your next target for you.</t>"
#define IA_endRTHint "<t align='center' size='2.2'>Radio Tower</t><br/><t size='1.5' color='#08b000' align='center'>DESTROYED</t><br/>____________________<br/>The enemy radio tower has been destroyed! Fantastic job, lads!<br/><br/><t size='1.2' color='#08b000' align='center'> The enemy cannot call in air support now!</t><br/>"
#define IA_rtMines 60
#define IA_rtMineTypes ["APERSBoundingMine", "APERSMine", "ATMine"]
#define IA_casSkill 2
#define IA_casCheckDelay 60
#define IA_casDelay 1200
#define IA_casInfAmmo true
#define IA_casInfFuel true
#define IA_casSearchRadius 5000
#define IA_deleteDistance 1500
#define IA_lockVeh true
#define IA_crewStayInProb 25
#define IA_patrolSkill 1
#define IA_sniperSkill 2
#define IA_aaSkill 4
#define IA_tankSkill 2
#define IA_apcSkill 1
#define IA_carSkill 3
#define IA_airSkill 3
#define IA_garrisonSkill 1
