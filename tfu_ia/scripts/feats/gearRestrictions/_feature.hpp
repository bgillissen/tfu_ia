class gearRestrictions : feat_base {
	class player : featPlayer_base {
		class init : featInit_base { thread = 1; };
		class closeVA : featCloseVA_base {};
		class take : featTake_base {};
	};
};
