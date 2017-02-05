class memberData {
	class dynamic {
		/*
		  Notice that you will have to activate file patching via -filePatching.
		  Otherwise loadFile will not load any files outside your mission folder.
		  For more info see CMA:DevelopmentSetup (since Arma 3 1.49+).
		*/
		mode = 1;	//0: disabled, 1: loadFile, 2: fetchUrl extension
		//src = "http://taskforcunicorn.com/api/srvData";
		src = "mbrData.txt";
		action = "Reload Member Data";
	};
	class static {
		class ben {
			uid = "76561198030235789";
			rank = 7;
			isZeus = 1;
			gearRestrictions = 1;
			baseProtection = 1;
			vehicleRestrictions = 1;
			country = "BE";
		};
	};
	class ranks {
		class rank0 {
			displayName = "";
			shortName = "";
		};
		class rank1 {
			displayName = "Applicant";
			shortName = "A";
		};
		class rank2 {
			displayName = "Recruit";
			shortName = "R";
		};
		class rank3 {
			displayName = "Private";
			shortName = "Pvt";
		};
		class rank4 {
			displayName = "Private Firstclass";
			shortName = "Pfc";
		};
		class rank5 {
			displayName = "Corporal";
			shortName = "Cpl";
		};
		class rank6 {
			displayName = "Sergeant";
			shortName = "Sgt";
		};
		class rank7 {
			displayName = "Lieutenant";
			shortName = "Lt";
		};
		class rank8 {
			displayName = "Captain";
			shortName = "Cpt";
		};
	};
};
