
if ( (["groupManagement"] call core_fnc_getParam) == 0 ) exitWith {};

private _insignia = getText(missionConfigFile >> "settings" >> "groupManagement" >> (player getVariable "groupID") >> "insignia");
[player, _insignia] call BIS_fnc_setUnitInsignia;