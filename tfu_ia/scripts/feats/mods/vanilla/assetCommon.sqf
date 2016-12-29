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

AVC = 0;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];

_a set [AVC, (["A", _backpacks, _items, _weapons, _ammo] call mods_fnc_append)];

//------------------------------------------------------------ Cargo Vanilla (common)

CVC = AVC + 1;

private _backpacks = [];
private _items = [["Laserdesignator", 5],
                  ["Laserbatteries", 5],
                  ["MineDetector", 5],
                  ["FirstAidKit", 20],
                  ["Medikit", 3],
                  ["ToolKit", 3]];
private _weapons = [];
private _ammo = [["SatchelCharge_Remote_Mag", 5],
                 ["DemoCharge_Remote_Mag", 10]];

_a set [CVC, (["C", _backpacks, _items, _weapons, _ammo] call mods_fnc_append)];

//------------------------------------------------------------ Allowed Vehicles Vanilla (common)

AVVC = CVC + 1;

private _heli = [];
private _plane = [];
private _tank = [];

_a set [AVVC, (["AV", _heli, _plane, _tank] call mods_fnc_append)];

//------------------------------------------------------------ supplyDrop Vanilla (common)

SDVC = AVVC + 1;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];
private _crates = [];

_out set [SDVC, (["SD", _backpacks, _items, _weapons, _ammo, _crates]  call mods_fnc_append)];

//------------------------------------------------------------ Rewards Vanilla (common)

RVC = SDVC + 1;

private _rewards = [];

_out set [RVC, _rewards];
//------------------------------------------------------------ Vehicles Cargo Vanilla (common)

VCVC = RVC + 1;

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

_out set [VCVC, (["VC", _car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                 	    _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                 	    _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]  call mods_fnc_append)];

//------------------------------------------------------------ FINITO, return

_out