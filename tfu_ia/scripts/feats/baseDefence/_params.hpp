
class baseDefence {
	title = "Base Defence";
	values[] = {0, 1, 2};
	texts[] = {"Disabled", "Allways", "On request"};
	default = 1;
};

class baseDefence_duration {
	title = "Base Defence duration (when set to on request)";
	values[] = {300, 900, 1200};
	texts[] = {"Short (5min)", "Medium (15min)", "Long (20min)"};
	default = 900;
};

class baseDefence_cooldown {
	title = "Base Defence cooldown (when set to on request)";
	values[] = {300, 900, 1200};
	texts[] = {"Short (5min)", "Medium (15min)", "Long (20min)"};
	default = 1200;
};
