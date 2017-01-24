
private _time = time;
{
	_x params ["_obj", "_expire"];
	if ( _time > _expire ) then {
		reviveHealEquipmentServer = reviveHealEquipmentServer - [_x];
		deleteVehicle _obj; 
	};
} forEach reviveHealEquipmentServer;