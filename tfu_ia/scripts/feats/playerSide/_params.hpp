class side {
	title = "Player side";
	values[] = {0, 1, 2};
	texts[] = {"OPFOR", "BLUFOR", "IND"};
	default = 0;
};

class opforEnemy {
	title = "OPFOR are enemy to players (do not apply when player side is OPFOR)";
	values[] = {1,0};
	texts[] = {"yes", "no"};
	default = 1;
};

class bluforEnemy {
	title = "BLUFOR are enemy to players (do not apply when player side is BLUFOR)";
	values[] = {1,0};
	texts[] = {"yes", "no"};
	default = 1;
};

class indEnemy {
	title = "IND are enemy to players (do not apply when player side is IND)";
	values[] = {1,0};
	texts[] = {"yes", "no"};
	default = 1;
};
