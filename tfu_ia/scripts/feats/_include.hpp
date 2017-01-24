/*
@filename: feats\_include.hpp
Author:
	Ben
Description:
	on all context,
	included by description.ext,
	declare mission parameters class and include feature's params,
	include class for feature's events template class
	declare features class and include feature's event and settings,
	plus some features that needs ui class
*/

class Params {
	#include "assets\_params.hpp"
	#include "baseProtection\_params.hpp"
	#include "earPlugs\_params.hpp"
	#include "fatigue\_params.hpp"
	#include "gearRestrictions\_params.hpp"
	#include "groupManagement\_params.hpp"
	#include "ia\_params.hpp"
	#include "intro\_params.hpp"
	#include "loadBalance\_params.hpp"
	#include "maps\_params.hpp"
	#include "mapTracker\_params.hpp"
	#include "noRenegade\_params.hpp"
	#include "oneLifeOnly\_params.hpp"
	#include "playerSide\_params.hpp"
	#include "radioFreq\_params.hpp"
	#include "revive\_params.hpp"
	#include "squadHint\_params.hpp"
	#include "startTime\_params.hpp"
	#include "supplyDrop\_params.hpp"
	#include "supportCrate\_params.hpp"
	#include "va\_params.hpp"
	#include "vehicleCrew\_params.hpp"
	#include "vehicleRespawn\_params.hpp"
	#include "vehicleRestrictions\_params.hpp"
	#include "voiceControl\_params.hpp"
	#include "vonHint\_params.hpp"
};

#include "_templates.hpp"

class features {
	#include "assets\_feature.hpp"
	#include "baseAtmosphere\_feature.hpp"
	#include "baseProtection\_feature.hpp"
	#include "baseVehicle\_feature.hpp"
	#include "billboards\_feature.hpp"
	#include "cleanUp\_feature.hpp"
	#include "curator\_feature.hpp"
	#include "earPlugs\_feature.hpp"
	#include "fatigue\_feature.hpp"
	#include "flags\_feature.hpp"
	#include "gearRestrictions\_feature.hpp"
	#include "groupManagement\_feature.hpp"
	#include "hallOfShame\_feature.hpp"
	#include "ia\_feature.hpp"
	#include "intro\_feature.hpp"
	#include "loadBalance\_feature.hpp"
	#include "maps\_feature.hpp"
	#include "mapTracker\_feature.hpp"
	#include "noRenegade\_feature.hpp"
	#include "oneLifeOnly\_feature.hpp"
	#include "playerSide\_feature.hpp"
	#include "playerSpawn\_feature.hpp"
	#include "radioFreq\_feature.hpp"
	#include "revive\_feature.hpp"
	#include "squadHint\_feature.hpp"
	#include "startTime\_feature.hpp"
	#include "supplyDrop\_feature.hpp"
	#include "supportCrate\_feature.hpp"
	#include "va\_feature.hpp"
	#include "vehicleCrew\_feature.hpp"
	#include "vehicleRespawn\_feature.hpp"
	#include "vehicleRestrictions\_feature.hpp"
	#include "viewDistance\_feature.hpp"
	#include "voiceControl\_feature.hpp"
	#include "vonHint\_feature.hpp"
	#include "zeusMission\_feature.hpp"
};

class settings {
	#include "assets\_settings.hpp"
	#include "baseProtection\_settings.hpp"
	#include "billboards\_settings.hpp"
	#include "cleanup\_settings.hpp"
	#include "curator\_settings.hpp"
	#include "earPlugs\_settings.hpp"
	#include "flags\_settings.hpp"
	#include "gearRestrictions\_settings.hpp"
	#include "groupManagement\_settings.hpp"
	#include "hallOfShame\_settings.hpp"
	#include "ia\_settings.hpp"
	#include "loadBalance\_settings.hpp"
	#include "mapTracker\_settings.hpp"
	#include "playerSpawn\_settings.hpp"
	#include "radioFreq\_settings.hpp"
	#include "revive\_settings.hpp"
	#include "squadHint\_settings.hpp"
	#include "supplyDrop\_settings.hpp"
	#include "supportCrate\_settings.hpp"
	#include "va\_settings.hpp"
	#include "vehicleCrew\_settings.hpp"
	#include "vehicleRespawn\_settings.hpp"
	#include "vehicleRestrictions\_settings.hpp"
	#include "viewDistance\_settings.hpp"
	#include "voiceControl\_settings.hpp"
	#include "vonHint\_settings.hpp"
	#include "zeusMission\_settings.hpp"
};

#include "intro\_include.hpp"
#include "viewDistance\_include.hpp"

