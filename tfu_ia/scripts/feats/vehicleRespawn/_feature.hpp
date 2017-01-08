class vehicleRespawn : feat_base  {
	class server : featServer_base {
		class init : featInit_base { thread = 1; };
		class preInit : featPreInit_base {};
		class destroy : featDestroy_base {};
	};
};
