class reviveDistance {
	title = "Distance from wounded that medics will see an in-game icon";
	values[] = {0, 100, 200, 300, 500, 1000, 2000};
	texts[] = {"Disabled", "100m", "200m", "300m", "500m", "1km", "2km"};
	default = 500;
};
/*
class reviveNeedFaks {
	title = "Need a FirstAidKit to revive";
	values[] = {0, 1};
	texts[] = {"False", "True"};
	default = 1;
};
*/
class reviveNoTFAR {
	title = "Disable use of radio whn unconcius (can still use direct speak)";
	values[] = {0, 1};
	texts[] = {"False", "True"};
	default = 1;
};

class reviveNoChat {
	title = "Disable use of chat when unconcius";
	values[] = {0, 1};
	texts[] = {"False", "True"};
	default = 1;
};

class reviveShowTimer {
	title = "Display bleedout time left";
	values[] = {0, 1};
	texts[] = {"False", "True"};
	default = 1;
};

class reviveBleedTime {
	title = "Maximun Bleedout time (amount of taken damage will reduce this)";
	values[] = {300, 900, 1200};
	texts[] = {"Short (5m)","Medium (15m)", "Long (25m)"};
	default = 900;
};
