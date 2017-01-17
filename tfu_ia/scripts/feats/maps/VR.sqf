/*
@filename: feats\maps\VR.sqf
Author:
	Ben
Description:
		run on server, 
		call by feats\maps\serverPreInit.sqf,
		Virtual Reality map define
*/

MAP_PREFIX = "VR";
MAP_FOLDER = "VR";
MAP_KEYWORDS = [];
MAP_URBAN  = 4;
TOT_HC = 3;

//------------------------------------------------------------ AO

AO_zones = [["zoneA", 3],
            ["zoneB", 3],
			["zoneC", 1]];

AO_markers = [["ao_1", "ao_2", "ao_3"], //zoneA
			  ["ao_4", "ao_5", "ao_6"], //zoneB
			  ["ao_7"]];				//zoneC

//------------------------------------------------------------ FOB

FOBS = [["fob_1", "fob_2", "fob_3", "fob_4"],	//zoneA
        ["fob_5", "fob_6", "fob_7"],	 		//zoneB
        []];							 		//zoneC

//------------------------------------------------------------ BASE

BASES = [["baseA", "Virtual Reality Base A", 70, 20],
         ["baseB", "Virtual Reality Base B", 70, 20],
         ["baseC", "Virtual Reality Base C", 70, 20]];
