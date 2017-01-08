class vonHint : feat_base  {
	class player : featPlayer_base {
		class postInit : featPostInit_base { thread = 1; };
		class destroy : featDestroy_base {};
	};
};
