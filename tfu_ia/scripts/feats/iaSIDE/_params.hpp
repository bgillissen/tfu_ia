class SIDE {
	title = "Enable Side Objectives?";
	values[] = {1,0};
	texts[] = {"Enabled","Disabled"};
	default = 1;
};

class ArtiTargetTickTimeMin {
	title = "Minimum Time between Priority Target actions";
	values[] = {30,60,120,180,240,300,600,900};
	texts[] = {"30 seconds","1 minute","2 minutes","3 minutes","4 minutes","5 minutes","10 minutes","15 minutes"};
	default = 180;
};

class ArtiTargetTickTimeMax {
	title = "Maximum Time between Priority Target actions";
	values[] = {30,60,120,180,240,300,600,900};
	texts[] = {"30 seconds","1 minute","2 minutes","3 minutes","4 minutes","5 minutes","10 minutes","15 minutes"};
	default = 300;
};

class ArtiTargetTickWarning {
	title = "Warnings from CROSSROAD regarding Priority Target actions?";
	values[] = {1,0};
	texts[] = {"Enabled","Disabled"};
	default = 1;
};
