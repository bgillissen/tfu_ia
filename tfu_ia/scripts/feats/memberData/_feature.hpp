class memberData : feat_base  {
	class player : featServer_base {
		class init : featinit_base { order = 10; };
	};
	class server : featServer_base {
		class preInit : featPreInit_base {};
	};
};
