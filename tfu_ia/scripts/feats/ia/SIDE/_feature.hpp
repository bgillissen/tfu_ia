class side : feat_base {
	class server : featServer_base {
		class postinit : featPostInit_base {
			thread = 1;
			order = 99;
		};
		class destroy : featDestroy_base {};
	};
};
