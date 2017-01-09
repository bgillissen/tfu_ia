#define EAST 0
#define WEST 1
#define IND 2

class assets {
	class vanilla {};
	class apex {};
	class ace {
		cfgPatch = "ace_main";
		sides[] = {EAST, WEST, IND};
	};
	class afrf {
		name = "rhsAFRF";
		cfgPatch = "rhs_main";
		sides[] = {EAST};
	};
	class gref {
		name = "rhsGREF";
		cfgPatch = "rhsgref_main";
		sides[] = {WEST, IND};
	};
	class usaf {
		name = "rhsUSAF";
		cfgPatch = "rhsusf_main";
		sides[] = {WEST};
	};
	class tfar {
		cfgPatch = "task_force_radio";
		sides[] = {EAST, WEST, IND};
	};
};
