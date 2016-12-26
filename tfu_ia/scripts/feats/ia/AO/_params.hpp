class AO {
	title = "Main AO";
	values[] = {1,0};
	texts[] = {"Enabled","Disabled"};
	default = 1;
};

class AO_cas {
	title = "Main AO CAS";
	values[] = {1,0};
	texts[] = {"Enabled","Disabled"};
	default = 1;
};

class AO_unitThreshold {
	title = "Main AO Enemy Left Threshold";
	values[] = {1,2,3,4,5,6,7,8,9,10};
	texts[] = {"1","2","3","4","5","6","7","8","9","10"};
	default = 9;
};

class AO_size {
	title = "Main AO Diameter";
	values[] = {200,300,400,500,600,700,800,900,1000};
	texts[] = {"200m","300m","400m","500m","600m","700m","800m","900m","1,000m"};
	default = 1000;
};

class AO_minedRTProb {
	title = "Chance for minefield to spawn around Radio Tower?";
	values[] = {0,10,20,30,40,50,60,70,80,90,100};
	texts[] = {"Disabled","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"};
	default = 5;
};

class AO_groupPatrol {
	title = "Groups Patrolling Main AO";
	values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
	texts[] = {"Disabled",1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
	default = 5;
};

class AO_sniperPatrol {
	title = "Sniper Teams Patrolling Main AO";
	values[] = {0,1,2,3,4};
	texts[] = {"Disabled", 1, 2, 3, 4};
	default = 3;
};

class AO_aaPatrol {
	title = "AA Vehicles Patrolling Main AO";
	values[] = {0,1,2,3,4,5};
	texts[] = {"Disabled", 1, 2, 3, 4, 5};
	default = 2;
};

class AO_tankPatrol {
	title = "Tank Patrolling Main AO";
	values[] = {0,1,2,3};
	texts[] = {"Disabled", 1, 2, 3};
	default = 2;
};

class AO_apcPatrol {
	title = "APC Patrolling Main AO";
	values[] = {0,1,2,3};
	texts[] = {"Disabled", 1, 2, 3};
	default = 2;
};

class AO_carPatrol {
	title = "Car Patrolling Main AO";
	values[] = {0,1,2,3};
	texts[] = {"Disabled", 1, 2, 3};
	default = 2;
};

class AO_static {
	title = "Static Weapons in the Main AO";
	values[] = {0,1,2,3,4,5};
	texts[] = {"Disabled",1,2,3,4,5};
	default = 4;
};

class AO_overwatchPatrol {
	title = "Overwatch teams in the Main AO";
	values[] = {0,1,2,3,4,5,6,7,8};
	texts[] = {"Disabled",1,2,3,4,5,6,7,8};
	default = 4;
};	

class AO_airPatrolProb {
	title = "% Chance Of Air Vehicle Patrolling Main AO";
	values[] = {0,10,20,30,40,50,60,70,80,90,100};
	texts[] = {"Disabled","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"};
	default = 5;
};

class AO_garrison {
	title = "Number Of units garrisoned in Main AO";
	values[] = {0,5,10,15,20,25,30,35,40,45,50};
	texts[] = {"Disabled","5","10","15","20","25","30","35","40","45","50"};
	default = 15;
};
