class IA {
	tag = "IA";
	class functions {
		class placeInfPatrol { file="feats\ia\placeInfPatrol.sqf"; };
		class placeSniper { file="feats\ia\placeSniper.sqf"; };
		class placeGarrison { file="feats\ia\placeGarrison.sqf"; };
		class placeStatic { file="feats\ia\placeStatic.sqf"; };
		class placeVehicle { file="feats\ia\placeVehicle.sqf"; };
		class placeAirPatrol { file="feats\ia\placeAirPatrol.sqf"; };
	};
};

#include "AO\_cfgFunctions.hpp"
#ifdef OK
#include "FOB\_cfgFunctions.hpp"
#include "SIDE\_cfgFunctions.hpp"
#endif
