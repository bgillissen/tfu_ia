/*
@filename: feats\supplyDrop\playerOnRespawn.sqf
Author:
	Ben
Description:
	run on player side
	Add eventHandlers to heli/jet pilots to allow them to do a supply drop.
*/

if ( !(["supplyDrop"] call core_fnc_getConf) ) exitWith{};

private _isHeliPilot = ( ({player isEqualType _x} count PUT_hPilot) > 0 );
private _isJetPilot = false;
if ( !_isHeliPilot ) then {
	_isJetPilot = ( ({player isEqualType _x} count PUT_jPilot) > 0 );
};

if  ( _isHeliPilot || _isJetPilot ) then {
	player addAction [SD_action, supplyDrop_fnc_drop, [], 0, false, true, '', '[] call supplyDrop_fnc_condition'];
};