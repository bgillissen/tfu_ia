/*
@filename: _settings.hpp
Author:
	Ben
Description:
	on all context,
	included by description.ext,
	define the missionConfig entries needed by the supported features
	those settings are those that (can't be set as || are not needed as) mission parameters
	it is organize by features.
Params:
	none
Environment:
	none
Return:
	nothing
*/

//supported mods, their entries under CfgPatches, their side(s)
mods[]={{"ace", "ace_main", {east, west, independent}},
		{"rhsAFRF", "rhs_main", {east}},
		{"rhsGREF", "rhsgref_main", {independent}},
		{"rhsUSAF", "rhsusf_main", {west}},
		{"tfar", "task_force_radio", {east, west, independent}}};

//list of squads, possible colors are: Black, Red, Green, Blue, Yellow, Orange, Pink
squads[]={{"HQ", "HQ", "Orange"},
		  {"ALPHA", "Alpha", "Black"},
		  {"BRAVO", "Bravo", "Black"},
		  {"HORNET", "Hornet", "Blue"},
		  {"HAMMER", "Hammer", "Green"},
		  {"SUPPORT", "Support", "Pink"}};

class squadHint {
	name = "Task Force Unicorn";
	url = "taskforceunicorn.com";
	msg = "<t align='center' size='2.2' color='#FAAF3A'>%1<br/></t><t size='1.4' color='#33CCFF'>%2</t><br/>has joined the server, To become a TFU member, apply to %3</t><br/>";
};

class vonHint {
	initialDelay = 60;
	delay = 1800;
	tsAddr = "ts.taskforceunicorn.com";
	Messages[]={"<t align='center'><t size='2'><t color='#FAAF3A'>Join us on TeamSpeak</t><br/><br/>_____________<br/><br/><t size='1.5'><t color='#FAAF3A'>%1<br/></t>",
			    "<t align='center'><t size='1.5'><t color='#FAAF3A'>VON is disabled</t><br/>  <t size='1.5'><br/>So instead join us on Teamspeak<br/>  <br/><t color='#FAAF3A'>%1<br/></t>"};
};

class baseProtection {
	msg = "You are discharging your weapon at base without approval. Cease your actions Immediately!";
	sleepDelay = 3;
};

class loadBalance {
	loopDelay = 20;
};

class revive {
	class btc {
		healMode = 1;	//0, only faks, 1 consume a faks if no medikit, 2 only medikit
		medicClass[]={"B_medic_F", "B_recon_medic_F", "B_G_medic_F"};
		medicViewDistance = 500;
	};
	class ais {
		realistic = 0;	//instant death of serious wound
		education = 2; 	//who can revive, 0 everybody, 1 everybody with faks and medikit, 2 only medics
		resistance = 1;	//damage resistance factor, 1 for default, higher to increase, lower to decrease
		noTFAR = 1; 	//disable TFAR communication when uncouncious
		noChat = 0;		//no chat when uncouncious
		mapMarker = 1;	//add an icon on map at the wounded location
		3dIcons = 0;	//in-game visible 3D icon to show you the position of the wounded
		blood = 1;		//generate extra blood particles
		impact = 1;		//visible impact effect
		showTimer = 1;	//show bleedout countdown
	};
};

class mapTracker {
	colorNeedRevive[]={1, 0.41, 0, 1};
	colorEast[]={0.5, 0, 0};
	colorWest[]={0, 0.3, 0.6};
	colorInd[]={0, 0.5, 0};
	colorCiv[]={0.4, 0, 0.5};
    colorDft[]={0.7, 0.6, 0};
    sizeMan = 22;
    sizeLandVehicle = 28;
    sizeAir = 28;
    sizeShip = 26;
    shadow = 1;
    textSize = 0.05;
    textFont = "puristaMedium";
    textOffset = "right";
    gpsDist = 500;
};

class gearRestriction {
	at = "Only AT/AA soldiers may use this weapon system, launcher removed.";
	mg = "Only Autoriflemen may use this machine gun, weapon removed.";
	sRifle = "Only snipers may use this rifle, rifle removed.";
	mRifle = "Only snipers/marksmans may use this rifle, rifle removed.";
	sOptic = "Only snipers may use this long range optic, optic removed.";
	mOptic = "Only snipers/markmans may use this long range optic, optic removed.";
	oOptic = "Only squad or team leader may use thermal optics, optic removed.";
	backpack = "Only AT/AA soldier may use this backpack, backpack removed.";
	uav = "Only UAV operator may use this item, UAV terminal removed.";
	duration = 5;
};

class va {
	message = "At least one piece of your gear is not allowed, it has been removed!";
	duration = 0.5;
};

class curator {
	uids[]={"76561198030235789"};
	web = 1;
	url = "http://taskforcunicorn.com/api/curators";
	notification = 0;
	thermalVision = 1;
	msgOnTakeOver = 1;
	noSlotMsg = "No more free Zeus slot available (%1 / %2).";
	ascendMsg = "%3 has ascend, %1 / %2 Zeus slot in use.";
	failedMsg = "%1 has tryed to ascend.";
	descendMsg = "%3 has descend, %1 / %2 Zeus slot in use.";
	takeOverMsg = "%1 has taking over %2 (%3)";
	releaseMsg = "%1 has release %2 (%3)";
	requestAction = "Request Zeus Power";
	releaseAction = "Release Zeus Power";
	reloadAction = "Reload Allowed Zeus List";

};

class zeusMission {
	startAction = "Start a zeus mission";
	stopAction = "Stop a zeus mission";
};

class dynBillboards {
	totRandom = 6;
	path = "media\billboards\%1.paa";
};

class hallOfShame {
	entries[]={"delusion", "big", "genericnord", "adam", "matthew", "jneuel"};
	path = "media\hallofshame\%1.paa";
};

class earPlugs {
	volume = 0.2;
	onMsg = "earPlugs fitted";
	offMsg = "earPlugs removed";
	keycode = 197;	//pause/break key
	delay = 0.3;
	showHint = 0;
	hint = "<t color='#ff9d00' size='1.2' shadow='1' shadowColor='#000000' align='center'>** Earplugs Recieved **</t>          Use [Pause/Break] key to Insert and Remove";
};

class radioFreq {
	shortRange[]={"300","310","320","330","340","350","360","370"};
	longRange[]={"50","60","70","80","90","100","110","120","130"};
};

class voiceControl {
	loopDelay = 20;
	disabled[]={6};
	players[]={3,4,5};
	groupLeader[]={2,3,4,5};
	admins[]={0,1,2,3,4,5};
    adminList[]={};
    message = "Talking in %1 is not allowed!\nPlease change your channel with %2 or %3";
};

class supplyDrop {
	minAltitude = 50;
	msgFrom = "HQ";
	msgAvail = "Supply Drop is available.";
	msgDeployed = "Supply Drop has been deployed by %1, next drop available in %2min.";
	checkDelay = 20;
	action = "<t color='#0000ff'>Drop supply crate</t>";
	smoke = "SmokeShellPurple";
	light = "Chemlight_blue";
};

class supportCrate {
	msgFrom = "HQ";
	msgAvail = "Support crate request is available.";
	msgDeployed = "%1 requested a support crate (%2), it has been deployed. An other one will be available in %3min.";
	checkDelay = 20;
	types[]={"fuel", "medic", "repair", "supply"};
	class actions {
		fuel = "<t color='#0000ff'>Request -- Fuel</t>";
		medic = "<t color='#0000ff'>Request -- Medical</t>";
		repair = "<t color='#0000ff'>Request -- Repair</t>";
		supply = "<t color='#0000ff'>Request -- Supply</t>";
	};
	class typeClass {
		fuel = "B_Slingload_01_Fuel_F";
		medic = "B_Slingload_01_Medevac_F";
		repair = "B_Slingload_01_Repair_F";
	};
};

class vehicleRespawn {
	distanceFromSpawn = 150;
	checkDelay = 20;
};

class vehicleCrew {
	updateDelay = 3;
	display = "<t size='0.85' color='#f0e68c'>%1 %2</t><img size='0.7' color='#6b8e23' image='%3'/><br/>";
	class icons {
		driver = "a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa";
		gunner = "a3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa";
		commander = "a3\ui_f\data\IGUI\Cfg\Actions\getincommander_ca.paa";
		cargo = "a3\ui_f\data\IGUI\Cfg\Actions\getincargo_ca.paa";
	};
};
class vehicleRestrictions {
	JH_pilot_heli = "Pilot seat is restricted to helicopter and jet pilot on this vehicle";
	H_pilot = "Pilot seat is restricted to helicopter pilot on this vehicle";
	JH_copilot_heli = "Co-pilot seat is restricted to helicopter and jet pilot on this vehicle";
	H_copilot = "Co-pilot seat is restricted to helicopter pilot on this vehicle";
	JH_pilot_plane = "Pilot seat is restricted to jet and helicopter pilot on this vehicle";
	J_pilot = "Pilot seat is restricted to jet pilot on this vehicle";
	JH_copilot_plane = "Co-pilot seat is restricted to jet and helicopter pilot on this vehicle";
	J_copilot = "Co-pilot seat is restricted to jet pilot on this vehicle";
	crew_driver = "Driver seat is restricted to tank crew on this vehicle";
	crew_gunner = "Gunner seat is restricted to tank crew on this vehicle";
	crew_commander = "Commander seat is rectricted to tank crew on this vehicle";
};

class viewDistance {
	action = "View Distance Settings";
	foot = 2200;
	car  = 3500;
	air = 5000;
};

class playerSpawn {
	loading = "Please wait, loading...";
	loadFadeout = 2;
	welcome = "Welcome to %1, you are %2";
	welcomeFadeOut = 2;
};

class ia {
	loopDelay = 20;
	checkDelay = 5;
	lockVeh = 1;
	deleteDistance = 1500;
	crewStayInProb = 25;
	class ao {
		cooldown = 120;
		circle = "aoCircle";
		label = "aoLabel";
		patrolSkill = 1;
		sniperSkill = 2;
		garrisonSkill = 1;
		staticSkill = 2;
		aaSkill = 4;
		tankSkill = 2;
		apcSkill = 1;
		carSkill = 3;
		airSkill = 3;
		airAltitude = 150;
		newHint = "<t align='center' size='2.2'>New Target</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/>We did a good job with the last target, lads. I want to see the same again. Get yourselves over to %1 and take them all down!<br/><br/>Remember to take down that radio tower to stop the enemy from calling in CAS.";
		endHint = "<t align='center' size='2.2'>Target Taken</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/><t align='left'>Fantastic job taking %1, boys! Give us a moment here at HQ and we'll line up your next target for you.</t>";
		class radioTower {
			circle = "rtCircle";
			label = "rtLabel";
			size = 500;
			mines = 60;
			mineTypes[]={"APERSBoundingMine", "APERSMine", "ATMine"};
			newNotif = "Destroy the enemy radio tower.";
			endHint = "<t align='center' size='2.2'>Radio Tower</t><br/><t size='1.5' color='#08b000' align='center'>DESTROYED</t><br/>____________________<br/>The enemy radio tower has been destroyed! Fantastic job, lads!<br/><br/><t size='1.2' color='#08b000' align='center'> The enemy cannot call in air support now!</t><br/>";
			endNotif = "Enemy radio tower destroyed.";
		};
		class cas {
			skill = 2;
			checkDelay = 20;
			cooldown = 1200;
			infiniteAmmo = 1;
			infiniteFuel = 1;
			searchRadius = 5000;
			newNotif = "Enemy jet approaching!";
			endNotif = "Enemy CAS is down. Well Done!";
		};
	};
	class fob {
		marker = "fobIcon";
		pool[]={"ammo", "repair", "landMedic", "fuel"};
		maxTime = 3600;
		cooldown = 900;
		maxGroup = 5;
		maxVehicle = 2;
		newHint = "<t align='center'><t size='2.2'>FOB created</t><br/><t size='1.5' color='#00B2EE'></t><br/>____________________<br/>We have created a FOB for you to use. You got %1 minutes to bring the supplies there.</t>";
		failHint = "<t align='center'><t size='2.2'>FOB Mission</t><br/><t size='1.5' color='#b60000'>FAILED</t><br/>____________________<br/>You'll have to do better than that next time!<br/><br/><br/>Focus on the main objective for now; we'll relay the bad news to HQ, with some luck we'll have another objective lined up. We'll get back to you with an other one in some time.</t>";
		newZoneHint = "<t align='center'><t size='2.2'>FOB Mission</t><br/><br/>____________________<br/>Operations in the area have ceased.<br/><br/>The resources are no longer needed.</t>";
		successHint = "<t align='center'><t size='2.2'>FOB Mission</t><br/><t size='1.5' color='#FFCF11'>SUCCESS</t><br/>____________________<br/>Good job getting the supplies to the FOB. You have been rewarded with<br/>%1<br/>This FOB is now deployed.</t>";
		zoneHint = "<t align='center'><t size='2.2'>FOB Mission</t><br/><t size='1.5' color='#FFCF11'>CONGRATULATION</t><br/>____________________<br/>It's amazing !, you have deployed all the FOB is this region.<br/>%1</t>";
		waveDelay = 600;
		skill = 2;
		minDistToDepot = 500;
	};
	class side {
		cooldown = 120;
		minDistFromBase = 2000;
		minDistFromAO = 2000;
		missions[]={"urban", "hqCoast", "research", "priority", "secure", "intel"};
		size = 500;
		circle = "sideCircle";
		label = "sideLabel";
		patrolSkill = 1;
		sniperSkill = 2;
		garrisonSkill = 3;
		staticSkill = 2;
		aaSkill = 4;
		tankSkill = 2;
		apcSkill = 1;
		carSkill = 3;
		airSkill = 3;
		airAltitude = 150;
		boomDelay = 30;
		plantAnim = "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
		table = "Land_CampingTable_small_F";
		laptop[]= {"Land_Laptop_F", "Land_Laptop_device_F", "Land_laptop_unfolded_F", "Land_Tablet_02_F"};
		briefing = "<t align='center'><t size='2.2'>New Side Mission</t><br/><t size='1.5' color='#00B2EE'>%1</t><br/>____________________<br/>%2</t>";
		successHint = "<t align='center'><t size='2.2'>Side Mission</t><br/><t size='1.5' color='#08b000'>COMPLETE</t><br/>____________________<br/>Fantastic job, lads! The enemies won't last long if you keep that up!<br/><br/>We've given you %1 to help with the fight. You'll find it at base.</t>";
		failHint = "<t align='center'><t size='2.2'>Side Mission</t><br/><t size='1.5' color='#b60000'>FAILED</t><br/>____________________<br/>You'll have to do better than that next time!</t>";
		class hqCoast {
			title = "Secure Smuggled Explosives";
			briefing = "The enemy have been smuggling explosives and hiding them in a Mobile HQ on the coastline.<br/><br/>We've marked the building on your map; head over there and secure the current shipment. Keep well back when you blow it; there's a lot of stuff in that building.";
			planted = "The charge has been set! %1 seconds until detonation.";
			action = "<t color='#ffff00'>Plant Charge</t>";
		};
		class urban {
			title = "Destroy Weapons Shipment";
			briefing = "The enemy is supplying insurgents with advanced weapons and explosives. Neutralize them!<br/><br/>We've marked the aproximative location on your map; Looks like it's in town. Get your CQB gear ready.";
			planted = "The charge has been set! %1 seconds until detonation.";
			action = "<t color='#ffff00'>Plant Charge</t>";
		};
		class research {
			title = "Seize Research Data";
			briefing = "The enemy is conducting advanced military research.<br/><br/>Find the data and then torch the place!";
			planted = "Hard drive secured. The charge has been set! %1 seconds until detonation.";
			action = "<t color='#ffff00'>Secure Data</t>";
			hqType = "Land_Research_HQ_F";
		};
		class priority {
			maxDistFromAO = 5000;
			minDistFromAO = 2000;
			artiProb = 50;
			infiniteAmmo = 1;
			extraHealth = 0;
			HBarrier = "Land_HBarrierBig_F";
			briefing = "<t align='center'><t size='2.2'>New Priority Target</t><br/><t size='1.5' color='#00B2EE'>%1</t><br/>____________________<br/>%2</t>";
			success = "<t align='center'><t size='2.2'>Priority Target</t><br/><t size='1.5' color='#08b000'>NEUTRALISED<>/t><br/>____________________<br/>Incredible job, boys! Make sure you jump on those priority targets quickly; they can really cause havoc if they're left to their own devices.</t>";
			class arti {
				title = "Artillery Battery";
				briefing = "The enemy is setting up an artillery battery to hit you guys damned hard! We've picked up their positions with thermal imaging scans and have marked it on your map.<br/><br/>This is a priority target, boys! They're just setting up now; they'll be firing soon!";
				notification = "Artillery Neutralised";
				radius = 25;
				salve = 4;
				salveDelay = 6;
				firingMsg[]={"Thermal scans are picking up those enemy Artillery firing! Heads down!"};
			};
			class aa {
				title = "Anti-Air Battery";
				briefing = "The enemy is setting up an anti-air battery to hit you guys damned hard! We've picked up their positions with thermal imaging scans and have marked it on your map.<br/><br/>This is a priority target, boys!";
				notification = "Anti-Air Battery Neutralised";
				range = 4000;
				minAltitde = 25;
			};
		};
		class secure {
			radarProb = 50;
			planted = "Hard drive secured. The charge has been set! %1 seconds until detonation.";
			action = "<t color='#ffff00'>Secure Data</t>";
			class radar {
				title = "Secure Radar";
				briefing = "The enemy have installed a small radar to support their aircraft.<br/><br/>We've marked the position on your map; head over there and secure the site. Take the data and destroy it.";
			};
			class chopper {
				title = "Secure Enemy Chopper";
				briefing = "The enemy have been provided with a new prototype attack chopper.<br/><br/>We've marked the suspected location on your map; head there, get the data and destroy the helicopter.";
			};
		};
		class intel {
			title = "Secure Intel";
			briefing = "We have reports from locals that sensitive, strategic information is changing hands. This is a target of opportunity!<br/><br/>We've marked the position on your map; head over there and secure the intel. It should be stored on one of the vehicles or on their persons.";
			vehicleProb = 40;
			triggerSize = 500;
			spotted = "Target has spotted you and is trying to escape with the intel!";
			fail = "Target has escaped!";
			secured = "Intel received. Mission accomplished! We're sending the data up to HQ for analysis.";
			action = "<t color='#ff0000'>Secure Intel</t>";
		};
	};
};
