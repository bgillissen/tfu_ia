/*
@filename: feats\iaSIDE\misHQCoast.sqf
Author:
	Ben
Description:
	this run on server,
	it create a new side mission 
*/

private _aoCoord = getMarkerPos "aoCircle";
private _flatPos = [0,0,0];
private _accepted = false;

//find a flat position, near coast
while {!_accepted} do {
	private _position = [[[] call BIS_fnc_worldArea],["water","out"]] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty [2,0,0.3,1,1,true];
	while {(count _flatPos) < 2} do {
		_position = [[[] call BIS_fnc_worldArea],["water","out"]] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [2,0,0.3,1,1,true];
	};

	if ((_flatPos distance (getMarkerPos "SZ")) > SIDE_minDistFromBase ) then {
		if ( _flatPos distance _aoCoord) > SIDE_minDistFromAO ) then {
			_accepted = true;
		};
	};
};

//objective building
private _hq = "Land_Cargo_HQ_V1_F" createVehicle _flatPos;
waitUntil {alive _hq};
_hq setDir (random 360);
(getPos _hq) params["_hqX", "_hqY", "_hqZ"];
//_hq setPos [_hqX, _hqY, _hqZ];
_hq setVectorUp [0,0,1];

//objective crate
private _crate = (selectRandom S_crates) createVehicle [0,0,0];
_crate allowDamage false;
_crate setPos [_hqX, _hqY, (_hqZ + 5)];
[_crate, SIDE_hqCoastAction] remoteExec ["SIDE_fnc_addAction", allPlayers - entities "HeadlessClient_F"];

