// by Bon_Inf*
params ["_wounded","_dragger"];

if (!isNull(_wounded getVariable "healer") || {!isNull(_wounded getVariable "dragger")} || {!isNull(_wounded getVariable "helper")}) exitWith {
	[format ["%1 is already being attended to.", name _wounded],0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText
};
if (_wounded distance _dragger > 2.5) exitWith {
	[format ["%1 is out of range to be dragged." call tcb_ais_font, name _wounded],0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText
};
if (!alive _wounded) exitWith {
	[format ["R.I.P. %1" call tcb_ais_font, name _wounded],0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText
};


[_dragger, "grabDrag"] call common_fnc_doGesture;

private _dir = 180;

_wounded setVariable ["dragger", _dragger, true];
_wounded setDir (getDir _dragger + _dir);
_wounded setPosASL (getPosASL _wounded vectorAdd (vectorDir _wounded vectorMultiply 1.5));

if ( tcb_ais_hasMoved ) then {
	[_wounded, "AinjPpneMrunSnonWnonDb_grab", 2] call common_fnc_doAnim;
} else {
	//got to find one that do not move _wounded to belly before moving it back on the back before grab 
	[_wounded, "AinjPpneMrunSnonWnonDb_grab", 2] call common_fnc_doAnim;
};

//private _relPos = [0, 1, 0.08]; //ais dft
private _relPos = [0, 1.1, 0.092];//ace drag pos

_wounded attachTo [_dragger, _relPos];
[_wounded, _dir] call common_fnc_setDir;
//[_wounded, "AinjPpneMrunSnonWnonDb_grab", 2] call common_fnc_doAnim;
[_wounded, "AinjPpneMrunSnonWnonDb_still", 0] call common_fnc_doAnim;

diag_log "fn_drag: action added";
private _action = _dragger addAction [format["<t color='#FC9512'>Drop %1</t>",name _wounded], {_this spawn tcb_fnc_drop},_wounded, 0, false, true];
_dragger setVariable ["drop_action", _action];