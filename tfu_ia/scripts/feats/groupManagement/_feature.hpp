class groupManagement : feat_base {
	class server : featServer_base {
		class preInit : featPreInit_base { order = 2; };
		class init : featInit_base {};
		class join : featJoin_base {};
	};
	class player : featPlayer_base {
		class preInit : featPreInit_base {};
		class postInit : featPostInit_base {};
	};
};
