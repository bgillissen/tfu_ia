
private _start = (["zeusMission", "startAction"] call core_fnc_getSetting);
private _stop = (["zeusMission", "stopAction"] call core_fnc_getSetting); 

private _compos = [];
for "_i" from 0 to 99 do {
	private _compName = format["ZM_%1_comp%2", toUpper(worldName), _i];
	if ( isClass(missionConfigFile >> "CfgCompositions" >> _compName) ) then {
		_compos pushback _compName;
	};
};


{
	{
		_x params ["_thing", "_actions"];
		{
			if ( (configName _x) isEqualTo "curator" ) then {
				_thing addAction [_start, {call zeusMission_fnc_set}, true, 0, false, true, "", "[true] call zeusMission_fnc_condition", 2];
				_thing addAction [_stop, {call zeusMission_fnc_set}, false, 0, false, true, "", "[false] call zeusMission_fnc_condition", 2];
				{
					private _name = getText(missionConfigFile >> "CfgCompositions" >> _x >> "name");
					private _author = getText(missionConfigFile >> "CfgCompositions" >> _x >> "author");
					private _action = format["Spawn Composition: %1 (%2)", _name, _author];
					_thing addAction [_action, {call zeusMission_fnc_spawnCompo}, _x, 0, false, true, "", "[false] call zeusMission_fnc_condition", 2];
				} forEach _compos;
			};
		} forEach _actions;
	} forEach _x;
} forEach [BA_npc, BA_obj, BA_veh];