class oneLifeOnly : feat_base  {
	class server : featServer_base {
		class init : featInit_base {};
		class killed : featKilled_base {};
		class respawn : featRespawn_base {};
	};
	class player : featPlayer_base {
		class killed : featKilled_base {};
		class respawn : featRespawn_base {};
	};
};
