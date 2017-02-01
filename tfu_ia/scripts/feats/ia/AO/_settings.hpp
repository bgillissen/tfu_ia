class ao {
	cooldown = 120;
	circle = "aoCircle";
	label = "aoLabel";
	patrolSkill = 2;
	sniperSkill = 3;
	garrisonSkill = 2;
	staticSkill = 3;
	aaSkill = 5;
	tankSkill = 3;
	apcSkill = 2;
	carSkill = 4;
	airSkill = 4;
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
