class btc_distance {
	title = "Distance from woonded that medic won't see";
	values[] = {100, 200, 300, 500, 1000, 2000};
	texts[] = {"100m", "200m", "300m", "500m", "1km", "2km"};
	default = 500;
};

class btc_needFaks {
	title = "Need a FirstAidKit to revive";
	values[] = {0, 1};
	texts[] = {"False", "True"};
	default = 1;
};

class btc_bleedout {
	title = "Maximum Bleedout time";
	values[] = {300, 900, 1200};
	texts[] = {"Short (5m)","Medium (15m)", "Long (25m)"};
	default = 900;
};

class btc_noRespawn {
	title = "Prevent players to respawn when unconcious";
	values[] = {0, 1};
	texts[] = {"No", "Yes"};
	default = 0;
};
