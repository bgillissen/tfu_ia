class common {
	tag = "common";
	class functions {
		class globalHint { file="common\globalHint.sqf"; };
		class globalNotification { file="common\globalNotification.sqf"; };
		class globalSideChat { file="common\globalSideChat.sqf"; };
		class implentAssets  { file="common\implentAssets.sqf"; };
};

class curator {
	tag = "curator";
	class eventHandlers {
		postInit = 1;
		file="common\curatorEH.sqf";
	};
	class objPlaced { file="common\curatorObjPlaced.sqf"; };
	class grpPlaced { file="common\curatorGrpPlaced.sqf"; };
};