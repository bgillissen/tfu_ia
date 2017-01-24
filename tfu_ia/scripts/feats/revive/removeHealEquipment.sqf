
private _time = time;
{
	_x params ["_obj", "_expire"];
	if ( _time > _expire ) then {
		reviveHealEquipment = reviveHealEquipment - [_x];
		deleteVehicle _obj; 
	};
} forEach reviveHealEquipment;