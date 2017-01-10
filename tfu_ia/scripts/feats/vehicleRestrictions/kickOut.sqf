/*
@filename: feats\vehicleRestrictions\kickOut.sqf
Author:
	Ben
Description:
	run on player
	kickout player from the vehicle seat he is in,
	if vehicle is moving move him to crago, else kick out.
*/

params ["_veh", "_wasIn"];

if ( isNil "_wasIn" ) then { _wasIn = false; };

(getPos _veh) params ["_x", "_y", "_z"];
(velocity _veh) params ["_vx", "_vy", "_vz"];

private "_freeSeat";

if (  (_vx != 0) || (_vy != 0) || (_vz != 0) || (_z > 0) || _wasIn ) then {
	private _crew = fullcrew [_veh, "cargo", true];
	_freeSeat = _crew call {
		{
			_x params ["_unit", "_role", "_index"];
			if ( _unit isEqualTo objNull ) exitWith { _index };
			true;
		} count _this;
	};
};

if ( !isNil "_freeSeat" ) then {
	player action ["moveToCargo", _veh, _freeSeat];
} else {
	player action ["getOut", _veh];
};