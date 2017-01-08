class assets {
	class vanilla {};
	class apex {};
	class ace {
		cfgPatch = "ace_main";
		sides[] = {east, west, independent};
	};
	class afrf {
		name = "rhsAFRF";
		cfgPatch = "rhs_main";
		sides[] = {east};
	};
	class gref {
		name = "rhsGREF";
		cfgPatch = "rhsgref_main";
		sides[] = {west, independent};
	};
	class usaf {
		name = "rhsUSAF";
		cfgPatch = "rhsusf_main";
		sides[] = {west};
	};
	class tfar {
		cfgPatch = "task_force_radio";
		sides[] = {east, west, independent};
	};
};
