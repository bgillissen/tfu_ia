
private _time = time;

{
	_x params ["_obj", "_expire"];
	if ( _time > _expire ) then {
		tcb_ais_healEquipment = tcb_ais_healEquipment - [_x];
		deleteVehicle _obj; 
	};
} forEach tcb_healEquipment;