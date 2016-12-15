class curator {
	tag = "curator";
	class functions {
		class eventHandlers {
			postInit = 1;
			file="common\curatorEH.sqf";
		};
		class grpPlaced { file="common\curatorGrpPlaced.sqf"; };
		class objPlaced { file="common\curatorObjPlaced.sqf"; };
	};
};

class common {
	tag = "common";
	class functions {
		class deleteObjects { file="common\deleteObjects.sqf"; };
		class garrisonUnit { file="common\garrisonUnit.sqf"; };
		class globalHint { file="common\globalHint.sqf"; };
		class globalNotification { file="common\globalNotification.sqf"; };
		class globalSideChat { file="common\globalSideChat.sqf"; };
		class implentAssets { file="common\implentAssets.sqf"; };
		class featInit { file="common\featInit.sqf"; };
		class setSkill { file="common\setSkill.sqf"; };
	};
};

