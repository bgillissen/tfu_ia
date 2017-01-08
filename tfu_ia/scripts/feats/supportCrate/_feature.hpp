class supportCrate : feat_base  {
	class server : featServer_base {
		class init : featInit_base { thread = 1; };
		class destroy : featDestroy_base {};
	};
	class player : featPlayer_base {
		class init : featInit_base {};
	};
};
