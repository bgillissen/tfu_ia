/*
@filename: feats\curator\playerInit.sqf
Author:
	Ben
Description:
	run on player.
	add once needed variable eventHandlers to handle a curator events,
	add curator action to things in base that got a curator action 
*/

if ( isNil "curator_PEH" ) then {
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
	if ( isNil "curator_SEH" ) then {
		diag_log "PLAYER curatorGroupPlaced / ObjectPlaced registred";
		{    
			_x addEventHandler ["CuratorGroupPlaced", {_this call curator_fnc_placeGrpPlayer}];
			_x addEventHandler ["CuratorObjectPlaced", {_this call curator_fnc_paceObjPlayer}];
			true
		} count allCurators;
	};
	curator_PEH = true;
};

private _request = ["curator", "requestAction"] call BIS_fnc_GetCfgData;
private _release = ["curator", "releaseAction"] call BIS_fnc_GetCfgData;
private _web = (["curator", "web"] call BIS_fnc_GetCfgData == 1);
private _reload  = ["curator", "reloadAction"] call BIS_fnc_GetCfgData;

call curator_fnc_reload;

{
	{
		_x params ["_thing", "_actions"];
		{
			if ( _x == "curator") then {
				_thing addAction [_request, curator_fnc_actionRequest, [], 0, false, true, '', '[false] call curator_fnc_condition', 2];
				_thing addAction [_release, curator_fnc_actionRelease, [], 0, false, true, '', '[true] call curator_fnc_condition', 2];
				if ( _web ) then {
					_thing addAction [_reload, curator_fnc_actionReload, [], 0, false, true, '', '[true] call curator_fnc_condition', 2];
				};
			}
		} count _actions;
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];