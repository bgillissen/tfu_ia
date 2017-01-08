/*
@filename: feats\supplyDrop\playerOnRespawn.sqf
Author:
	Ben
Description:
	run on player
	Add action to heli/jet pilots to allow them to do a supply drop.
Params:
	none
Environment:
	missionParameters:
		SupplyDrop
	player:
		role
	missionConfig:
		supplyDrop >> action
Return:
	nothing
*/

if ( (["supplyDrop"] call core_fnc_getParam) == 0 ) exitWith {};

private _isHPilot = ( player getVariable "role" isEqualTo "hPilot" );
private _isJPilot = ( player getVariable "role" isEqualTo "jPilot" );

if  ( _isHPilot || _isJPilot ) then {
	private _action = ["supplyDrop", "action"] call core_fnc_getSetting;
	player addAction [_action, supplyDrop_fnc_drop, [], 0, false, true, '', 'call supplyDrop_fnc_condition'];
};