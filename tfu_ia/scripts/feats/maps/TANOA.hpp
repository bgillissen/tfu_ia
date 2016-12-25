/*
@filename: feats\maps\TANOA.hpp
Author:
	Ben
Description:
		preprocessed by feats\maps\serverPreInit.sqf
		Tanoa map define
*/

#define MAP_PREFIX "T"
#define MAP_FOLDER "Tanoa"
//#define MAP_KEYWORDS ["jungle", "water", "apex"], for later, kind of assets selection helper
#define TOT_CURATOR 4


//------------------------------------------------------------ AO

#define AO_zones [\
					["bala",3],\
					["main",3],\
					["ravi-ta",1],\
					["saintgeorge",3],\
					["sosovu",1],\
					["tuvanaka",2]\
				 ]

#define AO_markers [\
					["Bala Airstrip",\		//bala
					 "Leqa",\
					 "Cerebu",\
					 "Muaceba",\
					 "Balavu",\
					 "Rautake",\
					 "Laikoro",\
					 "Namuvaka",\
					 "Ferry",\
					 "Katkoula",\
					 "Lailai",\
					 "Koumac",\
					 "Comm Tower",\
					 "Yanukka"],\
					["Georgetown",\			//main
					 "Regina",\
					 "Tanouka",\
					 "Kotomo",\
					 "Oumere",\
					 "Luganville",\
					 "Vatukoulo",\
					 "Ba",\
					 "Blue Pearl industrial port",\
					 "Ovau",\
					 "La Rochelle Aerodrome",\
					 "La Rochelle",\
					 "Saint-Paul",\
					 "Nicolet",\
					 "Oua-Oue",\
					 "Temple ruins",\
					 "Red Spring surface mine",\
					 "Comms Bravo",\
					 "Mont Tanoa",\
					 "Nasua",\
					 "Lumberyard",\
					 "Buawa",\
					 "Galili",\
					 "Jungle",\
					 "Lobaka",\
					 "Lakatoro",\
					 "Cocoa plantations",\
					 "Tanoa Airfield",\
					 "Railway Depot",\
					 "Diesel power plant"],\
					["Ravi-ta"],\					//ravi-ta
					["Harcourt",\ 					//saintgeorge
					 "Losi",\
					 "Moddergat",\
					 "La Foa",\
					 "Tobakoro",\
					 "Blerick",\
					 "Lijnhaven",\
					 "Taga",\
					 "Rereki",\
					 "Bua Bua",\
					 "Fortress ruins",\
					 "Port-Boise",\
					 "forest clearing",\
					 "Saioko",\
					 "Doodstil",\
					 "Ile Saint-George",\
					 "Saint-George Airstrip"],\
					["Sosovu"],\					//sosovu
					["Belfort",\ 					//tuvanaka
					 "Tuvanaka"]\
                   ]

//------------------------------------------------------------ FOB

#define FOBS [\
                     ["","","","","","","","",""],\	//bala
                   	 ["","","","","","","","",""],\	//main
                   	 [],\							//ravi-ta
                   	 ["","","","","","","","",""],\	//saintgeorge
                   	 [],\							//sosovu
                   	 []\							//tuvanaka
                    ]

//------------------------------------------------------------ BASE

#define BASES [["tuvanaka", "Tuvanaka Military Airfield", "400", "200"]]
