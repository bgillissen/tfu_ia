// by psycho
private _carrier = _this select 1;
private _injuredperson	= _this select 3;

if (_injuredperson distance _carrier > 3) exitWith {
	[format ["%1 is out of range to be carried." call tcb_ais_font, name _injuredperson],0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText
};
if (!alive _injuredperson) exitWith {
	[format ["R.I.P. %1" call tcb_ais_font, name _injuredperson],0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText
};
if (_carrier call tcb_fnc_checklauncher) exitWith {
	[format ["You are not able to carry anyone else while carrying a launcher on your back." call tcb_ais_font],0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText
};

_injuredperson setVariable ["carrier", _carrier, true];
/*
if (!isNil {_dragger getVariable "carry_action"}) then {
	_dragger removeAction (_dragger getVariable "carry_action");
	_dragger setVariable ["carry_action", nil];
};

detach _dragger;
detach _injuredperson;
*/

_pos = _carrier ModelToWorld [0,1.9,0];
_injuredperson setPos _pos;
//_injuredperson playActionNow "grabCarried";
[_injuredperson, "grabCarried", true] call common_fnc_playAction;
sleep 2;

if (!isPlayer _injuredperson) then {_injuredperson disableAI "ANIM"};
//_dragger playAction "grabCarry";
[_carrier, "grabCarry"] call common_fnc_playAction;

_timenow = time;
waitUntil {!alive _injuredperson || {!alive _carrier} || {_carrier getVariable "tcb_ais_agony"} || {time > _timenow + 16}};

tcb_ais_dropAction = _carrier addAction [format["<t color='#FC9512'>Drop %1</t>",name _injuredperson], {_this spawn tcb_fnc_drop},_injuredperson, 0, false, true];
_carrier setVariable ["drop_action", tcb_ais_dropAction];

if (!alive _injuredperson || {!alive _carrier} || {(_carrier getVariable "tcb_ais_agony")}) then {
	if (alive _injuredperson) then {
		//_injuredperson playActionNow "agonyStart";
		[_injuredperson, "agonyStart", true] call common_fnc_playAction;
	} else {
		if (!isNil {_carrier getVariable "drop_action"}) then {
			_carrier removeAction (_carrier getVariable "drop_action");
			_carrier setVariable ["drop_action", nil];
		};
	};
	if (alive _carrier && {!(_carrier getVariable "tcb_ais_agony")}) then {
		//_dragger playMoveNow "amovpknlmstpsraswrfldnon";
		[_carrier, "amovpknlmstpsraswrfldnon", true] call common_fnc_playMove;
	};
} else {
	_injuredperson attachTo [_carrier, [-0.6, 0.28, -0.05]];
};

_carrier = _injuredperson getVariable "carrier";
waitUntil {!alive _injuredperson || {!alive _carrier} || {_carrier getVariable "tcb_ais_agony"} || {isNull _carrier}};
if (isNull _carrier) exitWith {};
if (alive _injuredperson) then {
	//_injuredperson playActionNow "agonyStart";
	[_injuredperson, "agonyStart", true] call common_fnc_playAction;
} else {
	if (!isNil {_carrier getVariable "drop_action"}) then {
		_carrier removeAction (_dragger getVariable "drop_action");
		_carrier setVariable ["drop_action", nil];
	};
};
if (alive _carrier && {!(_carrier getVariable "tcb_ais_agony")}) then {
	//_dragger playMoveNow "amovpknlmstpsraswrfldnon";
	[_carrier, "amovpknlmstpsraswrfldnon", true] call common_fnc_playMove;
};