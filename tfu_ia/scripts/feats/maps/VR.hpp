/*
@filename: feats\maps\VR.hpp
Author:
	Ben
Description:
		preprocessed by feats\maps\serverPreInit.sqf
		Virtual Reality map define
*/

#define MAP_PREFIX "VR"
#define MAP_FOLDER "VR"
//#define MAP_KEYWORDS []
#define TOT_CURATOR 4

//------------------------------------------------------------ AO

#define AO_zones [["zoneA", 3],\
				  ["zoneB", 3],\
				  ["zoneC", 1]]

#define AO_markers [["ao_1", "ao_2", "ao_3"],\ //zoneA
					["ao_4", "ao_5", "ao_6"],\ //zoneB
					["ao_7"]]					//zoneC

//------------------------------------------------------------ FOB

#define FOBS [["fob_1", "fob_2", "fob_3", "fob_4"],\	//zoneA
              ["fob_5", "fob_6", "fob_7"],\			//zoneB
              []]									//zoneC

//------------------------------------------------------------ BASE

#define BASES [["baseA", "Virtual Reality Base A", "400", "200"],\
               ["baseB", "Virtual Reality Base B", "400", "200"],\
               ["baseC", "Virtual Reality Base C", "400", "200"]]
