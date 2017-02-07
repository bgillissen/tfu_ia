/*
@filename: feats\mods\vanilla\assetCommmon.sqf
Author:
	Ben
Description:
	run on server,
	call by feats\mods\vanilla\init.sqf
	return the vanilla assets common to all side
*/

private _out = [];

//------------------------------------------------------------ Arsenal Vanilla (common)

A_VC = 0;

private _backpacks = ["B_Parachute"];
private _items = ["ItemMap", 
                  "ItemRadio", 
                  "ItemGPS", 
                  "ItemCompass", 
                  "ItemWatch", 
                  "MineDetector", 
                  "FirstAidKit", 
                  "Medikit", 
                  "ToolKit",
                  "Binocular",
                  "Laserdesignator",
                  "Laserdesignator_02",
                  "Laserdesignator_03"];
private _weapons = [];
private _ammo = ["DemoCharge_Remote_Mag",
                 "IEDUrbanSmall_Remote_Mag",
                 "IEDLandSmall_Remote_Mag",
                 "SatchelCharge_Remote_Mag",
                 "IEDUrbanBig_Remote_Mag",
                 "IEDLandBig_Remote_Mag",
                 "ATMine_Range_Mag",
                 "ClaymoreDirectionalMine_Remote_Mag",
                 "APERSMine_Range_Mag",
                 "APERSBoundingMine_Range_Mag",
                 "SLAMDirectionalMine_Wire_Mag",
                 "APERSTripMine_Wire_Mag"];

_out set [A_VC, [_backpacks, _items, _weapons, _ammo]];

//------------------------------------------------------------ Allowed Vehicles Vanilla (common)

AV_VC = A_VC + 1;

private _heli = [];
private _plane = [];
private _tank = [];

_out set [AV_VC, [_heli, _plane, _tank]];

//------------------------------------------------------------ supplyDrop Vanilla (common)

SD_VC = AV_VC + 1;

private _backpacks = [];
private _items = [["Laserdesignator", 3],
                  ["Laserbatteries", 5],
                  ["FirstAidKit", 20],
                  ["Medikit", 2],
                  ["ToolKit", 2]];
private _weapons = [];
private _ammo = [["SatchelCharge_Remote_Mag", 3],
                 ["DemoCharge_Remote_Mag", 5]];
private _crates = ["B_supplyCrate_F"];
private _vehicles = [];

_out set [SD_VC, [ _backpacks, _items, _weapons, _ammo, _crates, _vehicles]];

//------------------------------------------------------------ Rewards Vanilla (common)

R_VC = SD_VC + 1;

private _rewards = [];

_out set [R_VC, _rewards];

//------------------------------------------------------------ Vehicles Vanilla  (common)

BV_VC = R_VC + 1;

private _car = [];
private _carArmed = [];
private _apc = [];
private _tank = [];
private _aaTank = [];
private _planeCAS = [];
private _planeAA = [];
private _planeTransport = [];
private _uav = [];
private _heliSmall = [];
private _heliSmallArmed = [];
private _heliMedium = [];
private _heliMedEvac = [];
private _heliBig = [];
private _heliAttack = [];
private _boatSmall = ["B_Boat_Transport_01_F"];
private _boatAttack = ["B_Boat_Armed_01_minigun_F"];
private _boatBig = [];
private _sub = ["B_SDV_01_F"];
private _landMedic = [];
private _repair = [];
private _fuel = [];
private _ammo = [];
private _quad = ["B_Quadbike_01_F"];

_out set [BV_VC, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Vehicles Cargo Vanilla (common)

VC_VC = BV_VC + 1;

private _car = [[],
                [["FirstAidKit", 10]],
                [],
                []];
private _carArmed = [[],
                     [["FirstAidKit", 10]],
                     [],
                     []];
private _apc = [[],
                [["FirstAidKit", 15]],
                [],
                []];
private _tank = [[],
                 [["FirstAidKit", 15]],
                 [],
                 []];
private _aaTank = [[],
                   [["FirstAidKit", 15]],
                   [],
                   []];
private _planeCAS = [[],[],[],[]];
private _planeAA = [[],[],[],[]];
private _planeTransport = [[["B_Parachute", 10]],
                           [["FirstAidKit", 20]],
                           [],
                           []];
private _uav = [[],[],[],[]];
private _heliSmall = [[],
                      [["FirstAidKit", 10]],
                      [],
                      []];
private _heliSmallArmed = [[],
                           [["FirstAidKit", 5]],
                           [],
                           []];
private _heliMedium = [[],
                       [["FirstAidKit", 10]],
                       [],
                       []];
private _heliMedEvac = [[],
                        [["FirstAidKit", 30],
                         ["Medikit", 5]],
                         [],
                         []];
private _heliBig = [[],
                    [["FirstAidKit", 20]],
                    [],
                    []];
private _heliAttack = [[],[],[],[]];
private _boatSmall = [[],
                      [["FirstAidKit", 10]],
                      [],
                      []];
private _boatAttack = [[],
                       [["FirstAidKit", 10]],
                       [],
                       []];
private _boatBig = [[],
                    [["FirstAidKit", 20]],
                    [],
                    []];
private _sub = [[],[],[],[]];
private _landMedic = [[],
                      [["FirstAidKit", 30],
                       ["Medikit", 5]],
                      [],
                      []];
private _repair = [[],[],[],[]];
private _fuel = [[],[],[],[]];
private _ammo = [[],[],[],[]];
private _quad = [[],[],[],[]];

_out set [VC_VC, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                 _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                 _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Role Loadout Vanilla Common
/*
 [uniform, [inUniform]], 
 [vest, inVest]], 
 [backpack, [inBackpack]], 
 [primWeapon, [primWeaponItems]] 
 [secWeapon, [secWeapItems]], 
 [handWeapon, handWeapItems]], 
 helmet, face, comm, terminal, map, bino, nv, watch, compass
*/
RL_VC = VC_VC + 1;

private _hq = [["", []], 
               ["", []], 
               ["", []], 
               ["", []], 
               ["", []], 
               ["", []], 
               "", "", "ItemRadio", "ItemGPS", "ItemMap", "", "", "ItemWatch", "ItemCompass"];
private _sl = [["", []], 
               ["", []], 
               ["", [["FirstAidKit", 4]]], 
               ["", ["optic_Nightstalker"]], 
               ["", []], 
               ["", []], 
               "", "", "ItemRadio", "ItemGPS", "ItemMap", "", "", "ItemWatch", "ItemCompass"];
private _tl = [["", []], 
               ["", []], 
               ["", [["Medikit", 1], ["FirstAidKit", 4]]], 
               ["", ["optic_Nightstalker"]], 
               ["", []], 
               ["", []], 
               "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _medic = [["", []], 
                  ["", []], 
                  ["", [["Medikit", 1], ["FirstAidKit", 10]]], 
                  ["", []], 
                  ["", []], 
                  ["", []], 
                  "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _lmg = [["", []], 
                ["", []], 
                ["", [["FirstAidKit", 4]]], 
                ["", []], 
                ["", []], 
                ["", []], 
                "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _hmg = [["", []], 
                ["", [["FirstAidKit", 3]]], 
                ["", []], 
                ["", []], 
                ["", []], 
                ["", []], 
                "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _assHMG = [["", []], 
                   ["", []], 
                   ["", [["FirstAidKit", 4]]], 
                   ["", []], 
                   ["", []], 
                   ["", []], 
                   "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _at = [["", []], 
               ["", []], 
               ["", [["FirstAidKit", 4]]], 
               ["", []], 
               ["", []], 
               ["", []], 
               "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _assAT = [["", []], 
                  ["", []], 
                  ["", [["FirstAidKit", 4]]], 
                  ["", []], 
                  ["", []], 
                  ["", []], 
                  "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _sniper = [["", []], 
                   ["", []], 
                   ["", [["FirstAidKit", 4]]], 
                   ["", []], 
                   ["", []], 
                   ["", []], 
                   "", "", "ItemRadio", "ItemGPS", "ItemMap", "", "", "ItemWatch", "ItemCompass"];
private _marksman = [["", []], 
                     ["", []], 
                     ["", [["FirstAidKit", 4]]], 
                     ["", []], 
                     ["", []], 
                     ["", []], 
                     "", "", "ItemRadio", "ItemGPS", "ItemMap", "", "", "ItemWatch", "ItemCompass"];
private _repair = [["", []], 
                   ["", []], 
                   ["", [["FirstAidKit", 4], ["ToolKit", 1]]], 
                   ["", []], 
                   ["", []], 
                   ["", []], 
                   "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _demo = [["", []], 
                 ["", []], 
                 ["", [["FirstAidKit", 4], ["ToolKit", 1]]], 
                 ["", []], 
                 ["", []], 
                 ["", []], 
                 "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _engineer = [["", []], 
                     ["", []], 
                     ["", [["FirstAidKit", 4], ["ToolKit", 1]]], 
                     ["", []], 
                     ["", []], 
                     ["", []], 
                     "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _grenadier = [["", []], 
                      ["", []], 
                      ["", [["FirstAidKit", 4]]], 
                      ["", []], 
                      ["", []], 
                      ["", []], 
                      "", "", "ItemRadio", "ItemGPS", "ItemMap", "", "", "ItemWatch", "ItemCompass"];
private _rifleman = [["", []], 
                     ["", []], 
                     ["", [["FirstAidKit", 4]]], 
                     ["", []], 
                     ["", []], 
                     ["", []], 
                     "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _jtac = [["", [["Laserbatteries", 2]]], 
                 ["", []], 
                 ["", [["FirstAidKit", 4]]], 
                 ["", []], 
                 ["", []], 
                 ["", []], 
                 "", "", "ItemRadio", "ItemGPS", "ItemMap", "Laserdesignator", "", "ItemWatch", "ItemCompass"];
private _hPilot = [["", []], 
                   ["", []], 
                   ["", [["FirstAidKit", 4]]], 
                   ["", []], 
                   ["", []], 
                   ["", []], 
                   "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _jPilot = [["", [["FirstAidKit", 2]]], 
                   ["", []], 
                   ["B_Parachute", []], 
                   ["", []], 
                   ["", []], 
                   ["", []], 
                   "", "", "ItemRadio", "ItemGPS", "ItemMap", "", "", "ItemWatch", "ItemCompass"];
private _crew = [["", []], 
                 ["", []], 
                 ["", [["ToolKit", 1],["FirstAidKit", 4]]], 
                 ["", []], 
                 ["", []], 
                 ["", []], 
                 "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _mortar = [["", []], 
                   ["", []], 
                   ["", [["FirstAidKit", 4]]], 
                   ["", []], 
                   ["", []], 
                   ["", []], 
                   "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _uavopp = [["", []], 
                   ["", [["FirstAidKit", 4]]], 
                   ["", []], 
                   ["", []], 
                   ["", []], 
                   ["", []], 
                   "", "", "ItemRadio", "", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];
private _spotter = [["", []], 
                    ["", []], 
                    ["", [["FirstAidKit", 4]]], 
                    ["", []], 
                    ["", []], 
                    ["", []], 
                    "", "", "ItemRadio", "ItemGPS", "ItemMap", "Binocular", "", "ItemWatch", "ItemCompass"];

_out set [RL_VC, [_hq, _sl, _tl, _medic, _lmg, _hmg, _assHMG, _at, _assAT, _sniper, _marksman,
                 _repair, _demo, _engineer, _grenadier, _rifleman, _jtac, _hPilot, _jPilot, _crew, 
                 _mortar, _uavopp, _spotter]];

//------------------------------------------------------------ Base Atmosphere Role Vanilla Common

BALO_VC = RL_VC + 1;

private _medic = [];
private _gear = [];
private _support = [];
private _default = [];

_out set [BALO_VC, [_medic, _gear, _support, _default]];

//------------------------------------------------------------ Spawn Vanilla Common

S_VC = BALO_VC + 1;

private _rt = ["Land_TTowerBig_2_F"];
private _crates = ["Land_CargoBox_V1_F"];
private _pGroups = [];
private _sGroups = [];
private _pilot = [];
private _crew = [];
private _officer = [];
private _garrison = [];
private _aa = [];
private _arti = [];
private _static = [];
private _cas = [];
private _tank = [];
private _apc = [];
private _car = [];
private _carArmed = [];
private _aPatrol = [];
private _civ = [];

_out set [S_VC, [_rt, _crates, _pGroups, _sGroups, _pilot, _crew, _officer, _garrison, _civ,
                _aa, _arti, _static, _cas, _tank, _apc, _car, _carArmed, _aPatrol]];


//------------------------------------------------------------ FINITO, return

_out