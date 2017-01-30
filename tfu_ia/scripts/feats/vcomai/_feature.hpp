class vcomai : feat_base  {
	class headless : featHeadless_base {
		class postInit : featPostInit_base { thread=1; };
	};
	class server : featServer_base {
		class postInit : featpostInit_base { thread=1; };
	};
};
