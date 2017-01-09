/*
@filename: feats\curator\playerInit.sqf
Author:
	Ben
Description:
	run on player.
	add once the needed variable eventHandlers to handle a dynamic curator alocation,
	add once the needed curator event to share objects/groups between the curators
	add curator action to things in base that got a curator action 
*/



//eventHandlers
if ( isNil "curator_EH" ) then {
	isCurator = false;
	"curatorUIDs" addPublicVariableEventHandler {
		curatorUIDs = _this select 1;
		isCurator = [player] call curator_fnc_isCurator;
		isAssigned = [player] call curator_fnc_isAssigned;
	};
	isAssigned = false;
	"curatorAssigned" addPublicVariableEventHandler {
		curatorAssigned = _this select 1;
		isAssigned = [player] call curator_fnc_isAssigned;
	};
	remoteUnit = objNull;
	"curatorUnit" addPublicVariableEventHandler {
		remoteUnit = _this select 1;
	};
	private _doMsg = [false, true] select (["curator", "msgOnTakeOver"] call core_fnc_getSetting);
	for "_curSlot" from 0 to (TOT_CURATOR - 1) do {
		private _gm = missionNamespace getVariable format["zeus_%1", _curSlot];   
		_gm addEventHandler ["CuratorGroupPlaced", {_this call curator_fnc_placeGrpPlayer}];
		_gm addEventHandler ["CuratorObjectPlaced", {_this call curator_fnc_placeObjPlayer}];
		if ( _doMsg ) then {
			[_gm, "curatorObjectRemoteControlled", {_this call curator_fnc_remoteControl}] call BIS_fnc_addScriptedEventHandler;
		};
		true
	};
	curator_EH = true;
};

//adding actions
private _request = ["curator", "requestAction"] call core_fnc_getSetting;
private _release = ["curator", "releaseAction"] call core_fnc_getSetting;
private _web = (["curator", "web"] call core_fnc_getSetting == 1);
private _reload  = ["curator", "reloadAction"] call core_fnc_getSetting;

{
	{
		_x params ["_thing", "_actions"];
		if ( "curator" in _actions ) then {
			_thing addAction [_request, {call curator_fnc_actionRequest}, [], 0, false, true, '', '[false] call curator_fnc_condition', 2];
			_thing addAction [_release, {call curator_fnc_actionRelease}, [], 0, false, true, '', '[true] call curator_fnc_condition', 2];
			if ( _web ) then {
				_thing addAction [_reload, {call curator_fnc_actionReload}, [], 0, false, true, '', '[true] call curator_fnc_condition', 2];
			};
		};
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];