class viewDistance {
	tag = "viewDistance";
	class functions {
		class onSliderChange { file="feats\viewDistance\onSliderChange.sqf"; };
		class onTerrainChange { file="feats\viewDistance\onTerrainChange.sqf"; };
		class update { file="feats\viewDistance\update.sqf"; };
		class open { file="feats\viewDistance\open.sqf"; };
		class track { file="feats\viewDistance\track.sqf"; };
		class init {
			postInit = 1;
			file="feats\viewDistance\init.sqf";
		};
	};
};