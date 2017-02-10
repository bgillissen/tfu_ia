
if ( (["environment"] call core_fnc_getParam) == 0 ) exitWith {};

private _presets = ["environment", "setTime", "presets"] call core_fnc_getSetting;

{
	{
		_x params ["_thing", "_actions"];
		{
			if ( (configName _x) isEqualTo "environment" ) then {
				{
					private _action = ["environment", "setTime", "actions", _x] call core_fnc_getSetting;
					_thing addAction [_action, {_this call environment_fnc_setTime}, _x, 0, false, true, "", "'setTime' call environment_fnc_condition", 4];
				} forEach _presets;
				private _action = getText(missionConfigFile >> "settings" >> "environment" >> "clearFog" >> "action");
				_thing addAction [_action, {call environment_fnc_clearFog}, "", 0, false, true, "", "'clearFog' call environment_fnc_condition", 4];
				private _action = getText(missionConfigFile >> "settings" >> "environment" >> "clearRain" >> "action");
				_thing addAction [_action, {call environment_fnc_clearRain}, "", 0, false, true, "", "'clearRain' call environment_fnc_condition", 4];
			};
		} forEach _actions;
	} forEach _x;
} forEach [BA_obj, BA_npc, BA_veh];