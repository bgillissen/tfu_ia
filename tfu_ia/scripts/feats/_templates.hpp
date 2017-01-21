class featEvent_base {
	order = 20;
	enable = 0;
	thread = 0;
};

class featPreInit_base : featEvent_base { enable = 1; };
class featInit_base : featEvent_base { enable = 1; };
class featPostInit_base : featEvent_base { enable = 1; };
class featJoin_base : featEvent_base { enable = 1; };
class featRespawn_base : featEvent_base { enable = 1; };
class featLeave_base : featEvent_base { enable = 1; };
class featCloseVA_base : featEvent_base { enable = 1; };
class featShoot_base  : featEvent_base { enable = 1; };
class featGetIn_base : featEvent_base { enable = 1; };
class featSwitchSeat_base : featEvent_base { enable = 1; };
class featGetOut_base : featEvent_base { enable = 1; };
class featTake_base : featEvent_base { enable = 1; };
class featKilled_base : featEvent_base { enable = 1; };
class featDestroy_base : featEvent_base { enable = 1; };

class featContext_base {
	class preInit : featEvent_base {};
	class init : featEvent_base {};
	class join : featEvent_base {};
	class destroy : featEvent_base {};
	class leave : featEvent_base {};
	class postInit : featEvent_base {};
};

class featServer_base : featContext_base {
	class respawn : featEvent_base {};
	class killed : featEvent_base {};
};

class featPlayer_base : featContext_base {
	class respawn : featEvent_base {};
	class killed : featEvent_base {};
	class closeVA : featEvent_base {};
	class shoot  : featEvent_base {};
	class getIn : featEvent_base {};
	class switchSeat : featEvent_base {};
	class getOut : featEvent_base {};
	class take : featEvent_base {};
};

class featHeadless_base : featContext_base {};

class feat_base {
	class server : featServer_base {};
	class player : featPlayer_base {};
	class headless : featHeadless_base {};
};
