/*
@filename: common\deleteObjects.sqf
Author:
	Ben
Description:
	it remove the objects given 
*/

params ["_objects"];

{
	if (typeName _x == "GROUP") then {
		{
			if ( !(isNull objectParent _x) ) then deleteVehicle (vehicle _x);
        	deleteVehicle _x;
		} count (units _x);
	} else {
		if ( !(isNull objectParent _x) ) then {
			deleteVehicle (vehicle _x);
			if ( !(_x isKindOf "Man") ) then {
				{ deleteVehicle _x; } count (crew _x);
			};
		};
		deleteVehicle _x;
	};
} count _objects;
/* not sure why this is needed....
{
	if (_x in allGroups) then {
		{
			if (!isNull _x) then { deleteVehicle _x; };
		} count (units _x);
	} else {
		if (!isNull _x) then { deleteVehicle _x; };
	};
} count _objects;
}
*/