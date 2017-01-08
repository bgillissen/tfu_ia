class loadBalance : feat_base  {
	class server : featServer_base {
		class init : featInit_base { thread = 1; };
		class destroy : featDestroy_base {};
	};
};
