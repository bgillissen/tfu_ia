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
