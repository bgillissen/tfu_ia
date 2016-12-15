/*
@filename: common\deleteObjects.sqf
Author:
	Ben
Description:
	it remove the objects given 
*/
param ["_objects"];
private ["_obj", "_isGroup"];
{
	if (typeName _x == "GROUP") then {
		{
			if (vehicle _x != _x) then deleteVehicle (vehicle _x);
        	deleteVehicle _x;
		} forEach (units _x);
	} else {
		if (vehicle _x != _x) then {
			deleteVehicle (vehicle _x);
		};
		if !(_x isKindOf "Man") then {
			{ deleteVehicle _x; } forEach (crew _x);
		};
		deleteVehicle _x;
	};
} forEach (_objects);

for "_c" from 0 to (count _objects) do {
	_obj = _objects select _c;
	if (_obj in allGroups) then {
		{
			if (!isNull _x) then { deleteVehicle _x; };
		} forEach (units _obj);
	} else {
		if (!isNull _obj) then { deleteVehicle _obj; };
	};
};