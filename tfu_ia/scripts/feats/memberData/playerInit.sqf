
private _uid = getPlayerUID player;

{
	if ( _uid isEqualTo (_x select 0) ) exitWith {
		player setVariable["MD_rank", (_x select 1), true];
		private _shortRank = getText(missionConfigFile >> "memberData" >> "ranks" >> format["rank%1", (_x select 1)] >> "shortName");
		player setVariable["MD_name", format["%1. %2", _shortRank, (name player)], true];
	};
} forEach memberData;

if ( isNil "memberDataPVEH" ) then {
	memberDataPVEH = "memberData" addPublicVariableEventHandler {
		memberData = _this select 1;
	};
};

if ( (["memberData", "dynamic", "mode"] call core_fnc_getSetting) == 0 ) exitWith {};

private _action = (["memberData", "dynamic", "action"] call core_fnc_getSetting);

{
	{
		_x params ["_thing", "_actions"];
		{
			_x params ["_action", "_mode"];
			if ( "memberData" isEqualTo _action ) then {
				_thing addAction [_action, {call memberData_fnc_update}, [], 0, false, true, '', '( (player getVariable["MD_rank", 0]) >= 6 )', 2];
			};
			true
		} count _actions;
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];