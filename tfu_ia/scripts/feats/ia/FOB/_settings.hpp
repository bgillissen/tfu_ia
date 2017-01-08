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
