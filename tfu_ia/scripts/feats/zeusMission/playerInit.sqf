
private _start = (["zeusMission", "startAction"] call core_fnc_getSetting);
private _stop = (["zeusMission", "stopAction"] call core_fnc_getSetting); 

{
	{
		_x params ["_thing", "_actions"];
		if ( "curator" in _actions ) then {
			_thing addAction [_start, {call zeusMission_fnc_set}, true, 0, false, true, "", "[true] call zeusMission_fnc_condition", 2];
			_thing addAction [_stop, {call zeusMission_fnc_set}, false, 0, false, true, "", "[false] call zeusMission_fnc_condition", 2];
		};
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];