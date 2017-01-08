/*
@filename: feats\assets\bohemia\apex\commmon.sqf
Author:
	Ben
Description:
	run on server,
	call by feats\mods\Apex\init.sqf
	return the Apex assets common to all side
*/

private _out = [];

//------------------------------------------------------------ Arsenal Apex (common)

A_AC = 0;

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

_out set [A_AC, [_backpacks, _items, _weapons, _ammo]];

//------------------------------------------------------------ Allowed Vehicles Apex (common)

AV_AC = A_AC + 1;

private _heli = [];
private _plane = [];
private _tank = [];

_out set [AV_AC, [_heli, _plane, _tank]];

//------------------------------------------------------------ supplyDrop Apex (common)

SD_AC = AV_AC + 1;

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

_out set [SD_AC, [ _backpacks, _items, _weapons, _ammo, _crates, _vehicles]];

//------------------------------------------------------------ Rewards Apex (common)

R_AC = SD_AC + 1;

private _rewards = [];

_out set [R_AC, _rewards];

//------------------------------------------------------------ Vehicles Apex  (common)

BV_AC = R_AC + 1;

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

_out set [BV_AC, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Vehicles Cargo Apex (common)

VC_AC = BV_AC + 1;

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

_out set [VC_AC, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                 _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                 _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Base Atmosphere Role Vanilla BLUFOR

BALO_AC = VC_AC + 1;

private _medic = [];
private _gear = [];
private _support = [];
private _default = [];

_out set [BALO_AC, [_medic, _gear, _support, _default]];

//------------------------------------------------------------ FINITO, return

_out