// by psycho
private _carrier = _this select 1;
private _wounded = _this select 3;

if (_wounded distance _carrier > 3) exitWith {
	[format ["%1 is out of range to be carried." call tcb_ais_font, name _wounded],0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText
};
if (!alive _wounded) exitWith {
	[format ["R.I.P. %1" call tcb_ais_font, name _wounded],0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText
};
if (_carrier call tcb_fnc_checklauncher) exitWith {
	[format ["You are not able to carry anyone else while carrying a launcher on your back." call tcb_ais_font],0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText
};

_wounded setVariable ["carrier", _carrier, true];
/*
if (!isNil {_dragger getVariable "carry_action"}) then {
	_dragger removeAction (_dragger getVariable "carry_action");
	_dragger setVariable ["carry_action", nil];
};

detach _dragger;
detach _wounded;
*/

_pos = _carrier ModelToWorld [0,1.9,0];
_wounded setPos _pos;
//_wounded playActionNow "grabCarried";
[_wounded, "grabCarried", 1] call common_fnc_doGesture;
sleep 2;

if (!isPlayer _wounded) then {_wounded disableAI "ANIM"};
//_dragger playAction "grabCarry";
[_carrier, "grabCarry"] call common_fnc_doGesture;

_timenow = time;
waitUntil {!alive _wounded || {!alive _carrier} || {_carrier getVariable "tcb_ais_agony"} || {time > _timenow + 16}};

tcb_ais_dropAction = _carrier addAction [format["<t color='#FC9512'>Drop %1</t>",name _wounded], {_this spawn tcb_fnc_drop},_wounded, 0, false, true];
_carrier setVariable ["drop_action", tcb_ais_dropAction];

if (!alive _wounded || {!alive _carrier} || {(_carrier getVariable "tcb_ais_agony")}) then {
	if (alive _wounded) then {
		//_wounded playActionNow "agonyStart";
		[_wounded, "agonyStart", 1] call common_fnc_doGesture;
	} else {
		if (!isNil {_carrier getVariable "drop_action"}) then {
			_carrier removeAction (_carrier getVariable "drop_action");
			_carrier setVariable ["drop_action", nil];
		};
	};
	if (alive _carrier && {!(_carrier getVariable "tcb_ais_agony")}) then {
		//_dragger playMoveNow "amovpknlmstpsraswrfldnon";
		[_carrier, "amovpknlmstpsraswrfldnon", 2] call common_fnc_doAnim;
	};
} else {
	//_wounded attachTo [_carrier, [-0.6, 0.28, -0.05]];
	_wounded attachTo [_carrier, [0.4, -0.1, -1.25]]; //ace carry 195
	[_wounded, 195] call common_fnc_setDir;
};

_carrier = _wounded getVariable "carrier";
waitUntil {!alive _wounded || {!alive _carrier} || {_carrier getVariable "tcb_ais_agony"} || {isNull _carrier}};
if (isNull _carrier) exitWith {};
if (alive _wounded) then {
	//_wounded playActionNow "agonyStart";
	[_wounded, "agonyStart", 1] call common_fnc_doGesture;
} else {
	if (!isNil {_carrier getVariable "drop_action"}) then {
		_carrier removeAction (_dragger getVariable "drop_action");
		_carrier setVariable ["drop_action", nil];
	};
};
if (alive _carrier && {!(_carrier getVariable "tcb_ais_agony")}) then {
	//_dragger playMoveNow "amovpknlmstpsraswrfldnon";
	[_carrier, "amovpknlmstpsraswrfldnon", 2] call common_fnc_doAnim;
};