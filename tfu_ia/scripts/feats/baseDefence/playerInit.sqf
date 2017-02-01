
if !( (["baseDefence"] call core_fnc_getParam) isEqualTo 2 ) exitWith {};

private _action = (["baseDefence", "action"] call core_fnc_getSetting);
{
	{
		_x params ["_thing", "_actions"];
		{
			_x params ["_action", "_mode"];
			if ( "baseDefence" isEqualTo _action ) then {
				_thing addAction [_action, {[player] call baseDefence_fnc_spawn}, true, 0, false, true, "", "time > BD_availAt && !DB_active", 2];
			};
			true
		} count _actions;
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];