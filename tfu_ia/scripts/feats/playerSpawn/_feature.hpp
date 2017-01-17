class playerSpawn : feat_base  {
	class player : featPlayer_base {
		class preInit : featPreInit_base { order=10; };
		class init : featInit_base { order=99; };
		class respawn : featRespawn_base { order = 10; };
		class postInit : featPostInit_base {
			order=98;
			thread=1;
		};
	};
	class server : featServer_base {
		class leave : featLeave_base { order = 10; };
	};
};
