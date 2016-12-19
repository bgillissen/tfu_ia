/*
@filename: maps\Tanoa\_include.hpp
Author:
	Ben
Description:
		included by maps\_include.hpp
		Tanoa maps define
*/

//------------------------------------------------------------ Number of GameMaster module placed

#define TANOA_CURATOR 4

//------------------------------------------------------------ Playable Units Tanoa (type)

#define PUT_hPilot []
#define PUT_jPilot []
#define PUT_crew []
#define PUT_mg []
#define PUT_at []
#define PUT_marksman []
#define PUT_sniper []
#define PUT_medic ["B_medic_F", "B_recon_medic_F", "B_G_medic_F"]
#define PUT_officer []
#define PUT_arti []

//------------------------------------------------------------ AO Tanoa

#define AOT_zones [\
					["bala",3],\
					["main",3],\
					["ravi-ta",1],\
					["saintgeorge",3],\
					["sosovu",1],\
					["tuvanaka",2]\
				 ]

#define AOT_markers [\
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
					["Belfort",\ 					//tuvanka
					 "Tuvanaka"]\
                   ]

//------------------------------------------------------------ FOB Tanoa

#define FOBT_markers [\
                     ["","","","","","","","",""],\	//bala
                   	 ["","","","","","","","",""],\	//main
                   	 [],\							//ravi-ta
                   	 ["","","","","","","","",""],\	//saintgeorge
                   	 ["","","","","","","","",""],\	//sosovu
                   	 []\							//tuvanaka
                    ]

//------------------------------------------------------------ BASE Tanoa

#define BT [["varName0", "dspName0", "size0"]]
//varName	=> to compute all the other needed markers from that name (prefix)
//dspName	=> for a hint after blackout "Welcome to %dspName% base, you are %PLAYER_SIDE%"
//size		=> for baseProtection SZ_RADIUS

//------------------------------------------------------------ Base vehicle Tanoa
#define BV_varName0 ["type0", "type1", "type2"]
//type		=> to pick one from the right pool

                    //------------------------------------------------------------ Base atmosphere Tanoa

#define BA_varName0 [
                    ["vehicle", ["action0", "action1"], "className", ["x", "y", "z", "d"]],\
                    ["npc", ["action0", "action1"],  ["uniform", "vest", "head"], ["x", "y", "z", "d"]],\
                    ["object", ["action0", "action1"],  "className", ["x", "y", "z", "d"]],\
                    ]
/*
type, actios, type conf, coord + bearing
for all disable damage,
	vehicle	=>  remove cargo, if no actions set simpleObject, disable damage, actions
	npc		=>  loadout, actions
	object  =>  actions
actions => to know which action i got to bind to that thing, those key words are used by features
	arsenal => va, vas, viewDistance
	support => supportCrate
	zeus => curator, zeusMission, fatigue
*/



