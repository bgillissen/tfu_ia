class spawn_vanilla {
	title = "Add vanilla units to enemy units spawn pool";
	values[] = {0,1};
	texts[] = {"no", "yes"};
	default = 1;
};
class vanilla_modEnemy {
	title = "Vanilla units are spawned when RHS (enemy side) is present";
	values[] = {0,1};
	texts[] = {"no", "yes"};
	default = 0;
};
class gear_vanilla {
	title = "Which vanilla gear is available in arsenal";
	values[] = {0,1,2,3};
	texts[] = {"none", "player side only", "player side + allies", "all"};
	default = 1;
};
class vanilla_modPlayer {
	title = "Vanilla gear / vehicle are available when RHS (player side) is present";
	values[] = {0,1};
	texts[] = {"no", "yes"};
	default = 0;
};

class reward_vanilla {
	title = "Add vanilla vehicles to reward pool";
	values[] = {0,1,2,3};
	texts[] = {"no", "player side only", "player side + allies", "all"};
	default = 2;
};
class bv_vanilla {
	title = "Add vanilla vehicle to base vehicle pool";
	values[] = {0,1,2,3};
	texts[] = {"no", "player side only", "player side + allies", "all"};
	default = 2;
};
class rl_vanilla {
	title = "Players spawn with vanilla loadout";
	values[] = {0,1};
	texts[] = {"no", "yes"};
	default = 1;
};
