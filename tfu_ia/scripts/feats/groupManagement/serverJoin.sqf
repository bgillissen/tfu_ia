/*
@filename: feats\groupManagement\serverJoin.sqf
Author:
	Ben
Description:
	run on server,
	register player's squad if not already done
*/

if ( (["groupManagement"] call core_fnc_getParam) == 0 ) exitWith {};

params ["_player"];

private _id = _player getVariable "groupID";
private _grp = (missionNamespace getVariable format["SQUAD_%1", _id]);

if !( ["IsGroupRegistered", [_grp]] call BIS_fnc_dynamicGroups ) then {
	private _insignia = getText(missionConfigFile >> "settings" >> "groupManagement" >> _id >> "insignia");
	private _name = getText(missionConfigFile >> "settings" >> "groupManagement" >> _id >> "name");
	["RegisterGroup", [_grp, leader group _player, [_insignia, _name, false]]] call BIS_fnc_dynamicGroups;
};