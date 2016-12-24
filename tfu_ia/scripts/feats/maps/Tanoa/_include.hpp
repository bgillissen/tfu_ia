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

#define UT_hPilot []
#define UT_jPilot []
#define UT_crew []
#define UT_mg []
#define UT_at []
#define UT_marksman []
#define UT_sniper []
#define UT_medic ["B_medic_F", "B_recon_medic_F", "B_G_medic_F"]
#define UT_officer []
#define UT_arti []

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
					["Belfort",\ 					//tuvanaka
					 "Tuvanaka"]\
                   ]

//------------------------------------------------------------ FOB Tanoa

#define FOBT_markers [\
                     ["","","","","","","","",""],\	//bala
                   	 ["","","","","","","","",""],\	//main
                   	 [],\							//ravi-ta
                   	 ["","","","","","","","",""],\	//saintgeorge
                   	 [],\							//sosovu
                   	 []\							//tuvanaka
                    ]

#define FOBT_objects [\
                     ["markerName", ["v1Coord", "v1Dir"], ["v2Coord", "v2Dir"], "padDir"]
                     ]
//------------------------------------------------------------ BASE Tanoa

#define BT [["varName0", "compName0", "dspName0", "size0", "frSize0"],
            ["tuvanaka", "tuvanaka", "Tuvanaka Military Airfield", "400", "200"]]
//varName	=> to compute all the other needed markers from that name (prefix)
//compName	=> to find the composition to load with LARS
//dspName	=> for a hint after blackout "Welcome to %dspName% base, you are %PLAYER_SIDE%"
//size		=> for baseProtection SZ_RADIUS
//frSize 	=> for gearRestriction => FR_RADIUS

//------------------------------------------------------------ Base vehicle Tanoa
#define BVT_varName0 [["type0", "respawnTime0"],
                      ["type1", "respawnTime1"],
                      ["type2", "respawnTime2"]]
#define BVT_tuvanaka [["heliSmall", 20],
                      ["heliAttack", 20],
                      ["heliMedium", 20],
                      ["heliMedEvac", 20],
                      ["planeTransport", 20],
                      ["planeAA", 20],
                      ["planeCAS", 20],
                      ["car", 20],
                      ["quad", 20]]
//type			=> to pick one from the right pool
//respawnTime 	=> for vehicleRespawn
//------------------------------------------------------------ Base atmosphere Tanoa

#define BAT_varName0 [
                    ["type0", ["action0", "action1"], "varName0"],\
                    ["type1", ["action0", "action1"],  "varName1", ["uniform", "vest", "head"]],\
                    ["type2", ["action0", "action1"],  "varName2"],\
                    ]
#define BAT_tuvanaka [
                    	["npc", ["arsenal"], "BA_leftVA", ["", "", ""]],\
                    	["npc", ["arsenal"], "BA_rightVA", ["", "", ""]],\
                    	["object", ["billboard"], "BA_leftBB"],\
                    	["object", ["billboard"], "BA_rightBB"],\
                    	["object", ["hos"], "BA_hos0"],\
                    	["object", ["hos"], "BA_hos1"],\
                    	["object", ["hos"], "BA_hos2"],\
                    	["object", ["hos"], "BA_hos3"],\
                    	["object", ["hos"], "BA_hos4"],\
                     ]
/*
type, actios, type conf, coord + bearing
for all disable damage,
	vehicle	=>  remove cargo, if no actions set simpleObject, disable damage, actions
	npc		=>  loadout, actions
	object  =>  actions
actions => to know which action i got to bind to that thing, those key words are used by features
	arsenal => va, viewDistance
	support => supportCrate
	curator => curator, zeusMission

once implented that become
in baseAtmosphere :
	spawn composition (FIXED POSITION)
	BA => composition reference
	BA_[vehicle, npc, object] => [_obj, [actions]]
		to create got to loop through the loaded base atmosphere "BAT_varname"
	BS_[HPILOT, JPILOT, CREW, INF]
		markers directly from composition
	BR_[land, heli, jet, uav, boat]
		markers directly from composition
		use those to create the triggers
	SZ, FR
		markers directly from composition
	HOS_[0,1,2,3,4,5,6]
		new feature, get "name" from settings, hideGlobal those that are not assigned

in baseVehicle
	BV_[0,1,2,3,4,5,6] =>
		markers directly from composition
		to populate VEHRESPAWN got to loop through the loaded base vehicle "BVT_varname"



*/



