class spawn_apex {
	title = "Add apex units to enemy units spawn pool";
	values[] = {0,1};
	texts[] = {"no", "yes"};
	default = 1;
};
class apex_modEnemy {
	title = "Apex units are spawned when RHS (enemy side) is present";
	values[] = {0,1};
	texts[] = {"no", "yes"};
	default = 0;
};
class gear_apex {
	title = "Which apex gear is available in arsenal";
	values[] = {0,1,2,3};
	texts[] = {"none", "player side only", "player side + allies", "all"};
	default = 1;
};
class apex_modPlayer {
	title = "Apex gear / vehicle are available when RHS (player side) is present";
	values[] = {0,1};
	texts[] = {"no", "yes"};
	default = 0;
};

class reward_apex {
	title = "Add apex vehicles to reward pool";
	values[] = {0,1,2,3};
	texts[] = {"no", "player side only", "player side + allies", "all"};
	default = 2;
};
class bv_apex {
	title = "Add apex vehicle to base vehicle pool";
	values[] = {0,1,2,3};
	texts[] = {"no", "player side only", "player side + allies", "all"};
	default = 2;
};
class rl_apex {
	title = "Players spawn with apex loadout";
	values[] = {0,1};
	texts[] = {"no", "yes"};
	default = 1;
};
