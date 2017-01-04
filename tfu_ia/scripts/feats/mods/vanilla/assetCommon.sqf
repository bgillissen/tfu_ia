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

private _backpacks = [];
private _items = ["ItemMap", "ItemRadio", "ItemGPS", "ItemCompass", "ItemWatch", "MineDetector", "FirstAidKit", "Medikit", "ToolKit"];
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
private _crates = [];
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
private _boatSmall = [];
private _boatAttack = [];
private _boatBig = [];
private _sub = [];
private _landMedic = [];
private _repair = [];
private _fuel = [];
private _ammo = [];
private _quad = [];

_out set [BV_VC, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Vehicles Cargo Vanilla (common)

VC_VC = BV_VC + 1;

private _car = [[],[],[],[]];
private _carArmed = [[],[],[],[]];
private _apc = [[],[],[],[]];
private _tank = [[],[],[],[]];
private _aaTank = [[],[],[],[]];
private _planeCAS = [[],[],[],[]];
private _planeAA = [[],[],[],[]];
private _planeTransport = [[],[],[],[]];
private _uav = [[],[],[],[]];
private _heliSmall = [[],[],[],[]];
private _heliSmallArmed = [[],[],[],[]];
private _heliMedium = [[],[],[],[]];
private _heliMedEvac = [[],[],[],[]];
private _heliBig = [[],[],[],[]];
private _heliAttack = [[],[],[],[]];
private _boatSmall = [[],[],[],[]];
private _boatAttack = [[],[],[],[]];
private _boatBig = [[],[],[],[]];
private _sub = [[],[],[],[]];
private _landMedic = [[],[],[],[]];
private _repair = [[],[],[],[]];
private _fuel = [[],[],[],[]];
private _ammo = [[],[],[],[]];
private _quad = [[],[],[],[]];

_out set [VC_VC, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                 _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                 _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ FINITO, return

_out