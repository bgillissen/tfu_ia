// by psycho
params ["_victim", "_killer"];

(getPosATL _victim) params ["_x", "_y", "_z"];
(vectorDir _victim) params ["_vx", "_vy"];
private _pos = [(_x - _vx * 3), (_y - _vy * 3), (_z + 1)];

titleCut ["", "BLACK IN", 1];

private _deadcam = "Camera" camCreate (position _victim);
_deadcam cameraEffect ["internal", "back"];
showCinemaBorder true;
_deadcam camPrepareTarget _victim;
_deadcam camPreparePos _pos;
_deadcam camPrepareFOV 0.7;
_deadcam camCommitPrepared 0;

(selectRandom tcb_ais_quotes) params ["_quote", "_author"];
[_quote, _author, (tcb_ais_respawndelay - 1)] spawn tcb_fnc_deadCamQuote;

waitUntil { camCommitted _deadcam };

if ( (_killer isEqualTo player) || (!alive _killer) || (isNull _killer) ) then {
	_deadcam camPrepareTarget _victim;
	_deadcam camsetrelpos [-3, 20, 10];
	_deadcam camPrepareFOV 0.474;
	_deadcam camCommitPrepared 20;
} else {
	sleep 1;
	_deadcam camCommand "inertia on";
	_deadcam camPrepareTarget (vehicle _killer);
	_deadcam camsetrelpos [-3, 20, 10];
	_deadcam camPrepareFOV 1;
	_deadcam camCommitPrepared 10;
};

waitUntil { alive player };

showCinemaBorder false;
player cameraEffect ["terminate", "back"];
camDestroy _deadcam;