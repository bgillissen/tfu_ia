class revive : feat_base  {
	class player : featPlayer_base {
		class destroy : featDestroy_base {};
		class init : featInit_base {};
		class join : featJoin_base {};
	};
	class server : featServer_base {
		class destroy : featDestroy_base {};
		class init : featInit_base {};
		class join : featJoin_base {};
	};
	class headless : featServer_base {
		class destroy : featDestroy_base {};
		class init : featInit_base {};
		class join : featJoin_base {};
	};
};
