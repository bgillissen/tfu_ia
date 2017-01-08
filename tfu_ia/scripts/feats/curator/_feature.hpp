class curator : feat_base {
	class server : featServer_base {
		class init : featInit_base  {};
		class postInit : featPostInit_base  {};
		class destroy : featDestroy_base {};
		class leave : featLeave_base {};
		class join : featJoin_base {};
	};
	class player : featPlayer_base {
		class init : featInit_base {};
		class postInit : featPostInit_base  {};
	};
};
