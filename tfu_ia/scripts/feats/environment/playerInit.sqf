
if ( (["environment"] call core_fnc_getParam) == 0 ) exitWith {};

private _hours = "true" configClasses (missionConfigFile >> "settings" >> "environment" >> "setTime");

{
	{
		_x params ["_thing", "_actions"];
		{
			if ( (configName _x) isEqualTo "environment" ) then {
				diag_log format["adding environment action to %1", _thing];
				{
					private _action = getText(_x >> "action");
					_thing addAction [_action, {_this call environment_fnc_setTime}, getArray(_x >> "time"), 0, false, true, "", "'setTime' call environment_fnc_condition", 2];
				} forEach _hours;
				private _action = getText(missionConfigFile >> "settings" >> "environment" >> "clearFog" >> "action");
				_thing addAction [_action, {call environment_fnc_clearFog}, "", 0, false, true, "", "'clearFog' call environment_fnc_condition", 2];
				private _action = getText(missionConfigFile >> "settings" >> "environment" >> "clearRain" >> "action");
				_thing addAction [_action, {call environment_fnc_clearRain}, "", 0, false, true, "", "'clearRain' call environment_fnc_condition", 2];
			};
		} forEach _actions;
	} forEach _x;
} forEach [BA_obj, BA_npc, BA_veh];