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

#define AO_markers [["ao1", "ao2", "ao3"],\ //zoneA
					["ao4", "ao5", "ao6"],\ //zoneB
					["ao7"]]				//zoneC

//------------------------------------------------------------ FOB

#define FOBS [["fob1", "fob2", "fob3", "fob4"],\	//zoneA
              ["fob5", "fob6", "fob7"],\			//zoneB
              []]									//zoneC

//------------------------------------------------------------ BASE

#define BASES [["baseA", "Virtual Reality Base A", "400", "200"],\
               ["baseB", "Virtual Reality Base B", "400", "200"],\
               ["baseC", "Virtual Reality Base C", "400", "200"]]
