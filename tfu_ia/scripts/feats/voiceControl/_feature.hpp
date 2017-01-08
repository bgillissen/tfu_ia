class voiceControl : feat_base  {
	class player : featPlayer_base {
		class init : featInit_base { thread = 1; };
		class destroy : featDestroy_base {};
	};
};