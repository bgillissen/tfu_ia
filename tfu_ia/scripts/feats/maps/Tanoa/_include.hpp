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

#define BT [["tuvanaka", "tuvanaka", "Tuvanaka Military Airfield", "400", "200"]]
//varName	=> to compute all the other needed markers from that name (prefix)
//compName	=> to find the composition to load with LARS
//dspName	=> for a hint after blackout "Welcome to %dspName% base, you are %PLAYER_SIDETXT%"
//size		=> for baseProtection SZ_RADIUS
//frSize 	=> for gearRestriction => FR_RADIUS

//------------------------------------------------------------ Base vehicle Tanoa
#define BVT_tuvanaka [["heliSmall", 		20, "BV_lb1"],
                      ["heliSmallArmed", 	20, "BV_lb2"],
                      ["heliMedium", 		20, "BV_bh1"],
                      ["heliMedEvac", 		20, "BV_bh2"],
                      ["planeTransport", 	20, "BV_c130"],
                      ["planeAA", 			20, "BV_aajet"],
                      ["uav",	 			20, "BV_uav"],
                      ["planeCAS", 			20, "BV_a10"],
                      ["carArmed",			20, "BV_hmmv1"],
                      ["carArmed",			20, "BV_hmmv2"],
                      ["car", 				20, "BV_hmmv3"],
                      ["car", 				20, "BV_hmmv4"],
                      ["carArmed",			20, "BV_fobhmmv1"],
                      ["carArmed",			20, "BV_fobhmmv2"],
                      ["quad", 				20, "BV_quadI1"],
                      ["quad", 				20, "BV_quadI2"],
                      ["quad", 				20, "BV_quadI3"],
                      ["quad", 				20, "BV_quadI4"],
                      ["quad", 				20, "BV_quadH1"],
                      ["quad", 				20, "BV_quadH2"],
                      ["quad", 				20, "BV_quadJ1"],
                      ["quad", 				20, "BV_quadJ2"],
                      ["quad", 				20, "BV_quadB1"],
                      ["quad", 				20, "BV_quadB2"],
                      ["quad", 				20, "BV_quadB3"],
                      ["quad", 				20, "BV_quadB4"],
                      ["apc", 				20, "BV_crewapc"],
                      ["apc", 				20, "BV_fobapc"],
                      ["tank", 				20, "BV_fobtank"],
                      ["boatAttack",		20, "BV_ba1"],
                      ["boatAttack",		20, "BV_ba2"],
                      ["boatSmall",			20, "BV_bs1"],
                      ["boatSmall",			20, "BV_bs2"],
                      ["sub",				20, "BV_sub1"],
                      ["sub",				20, "BV_sub2"],
                      ["boatBig",			20, "BV_bb1"],
                      ]
//type			=> to pick one from the right pool
//respawnTime 	=> for vehicleRespawn
//------------------------------------------------------------ Base atmosphere Tanoa

#define BAT_varName0 [
                    ["type0", ["action0", "action1"], "varName0"],\
                    ["type1", ["action0", "action1"],  "varName1", ["uniform", "vest", "head"]],\
                    ["type2", ["action0", "action1"],  "varName2"],\
                    ]
#define BAT_tuvanaka [
                    	["npc",	["arsenal"],	"BA_leftVA"],\
                    	["npc",	["arsenal"], 	"BA_rightVA"],\
                    	["npc",	["support"], 	"BA_support"],\
                    	["obj",	["arsenal"], 	"BA_crewVA"],\
                    	["obj",	["arsenal"], 	"BA_heliVA"],\
                    	["obj",	["arsenal"], 	"BA_jetVA"],\
                    	["obj",	["arsenal"], 	"BA_fobVA"],\
                    	["obj",	["arsenal"], 	"BA_frVA"],\
                    	["obj",	["billboard"], 	"BA_leftBB"],\
                    	["obj",	["billboard"], 	"BA_rightBB"],\
                    	["obj",	["hos"], 		"BA_hos0"],\
                    	["obj",	["hos"], 		"BA_hos1"],\
                    	["obj",	["hos"], 		"BA_hos2"],\
                    	["obj",	["hos"], 		"BA_hos3"],\
                    	["obj",	["hos"], 		"BA_hos4"],\
                     ]
/*
type, actios, varName in composition
for all disable damage,
	veh	=>  remove cargo, if no actions set simpleObject
	npc	=>  loadout (BA_npcLoadout), noMove, make member of BA_npcGROUP (for side)
	obj =>  ??? will it keep my object state ?
actions => to know which action i got to bind to that thing, those are key words are used by features
	arsenal => va, viewDistance
	support => supportCrate
	curator => curator, zeusMission

once implented that become
in mods
	change BALO_[medic, gear, support]
in baseAtmosphere :
	spawn composition (FIXED POSITION)
	BA => composition reference
	BA_[veh, npc, obj] => [_obj, [actions]]
		to create got to loop through the loaded base atmosphere "BAT_%varName%"
	BAS_[HPILOT, JPILOT, CREW, INF]
		markers directly from composition
	BAR_[land, heli, jet, uav, boat]
		markers directly from composition
		new feature, baseRepair
			use those to create the repair triggers
	SZ, FR
		markers directly from composition
	BAHOS_[0,1,2,3,4,5,6]
		new feature, hallOfshame that get a list of "name" from settings to apply texture, hideGlobal those that are not assigned
	BABD_[0,1,2,3,4,5,6]
		markers directly from composition
		new feature, baseDefence
			spawn baseDefence AA batteries from BV_aaTank pool on each BADB_?? marker
			use : if (getMarkerColor "markerName" == "") then {hint "Marker not found";}; ;) to know if a marker exists !
in baseVehicle
	BV_[0,1,2,3,4,5,6]
		markers directly from composition
		got to loop through BV and foreach
			- getPos from marker "BV_%_forEachIndex%", for boat (posABL Z = 0)
			- spawn the vehicle using the corresponding pool (BV_[???])
			- clear and fill the vehicle cargo following VC_[????])
			- append to VR[veh, delay, class, pos, dir]

*/
