/*
@filename: feats\mapTracker\iconSize.sqf
Credits: 
	Quiksilver
Author:
	Ben
Description:
	run on client
	return the size of the icon to draw.
*/
params ["_veh"];

if (_veh isKindOf "Man") exitWith { MT_sizeMan };
if (_veh isKindOf "LandVehicle") exitWith { MT_sizeLandVehicle };
if (_veh isKindOf "Air") exitWith { MT_sizeAir };

MT_sizeShip