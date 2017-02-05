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
		rank0 {
			displayName = "";
			shortName = "";
		};
		rank1 {
			displayName = "Applicant";
			shortName = "A";
		};
		rank2 {
			displayName = "Recruit";
			shortName = "R";
		};
		rank3 {
			displayName = "Private";
			shortName = "Pvt";
		};
		rank4 {
			displayName = "Private Firstclass";
			shortName = "Pfc";
		};
		rank5 {
			displayName = "Corporal";
			shortName = "Cpl";
		};
		rank6 {
			displayName = "Sergeant";
			shortName = "Sgt";
		};
		rank7 {
			displayName = "Lieutenant";
			shortName = "Lt";
		};
		rank8 {
			displayName = "Captain";
			shortName = "Cpt";
		};
	};
};
