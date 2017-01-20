// by psycho
// unbind some key functions while the player is unconcious (caused by stupid 3.0)
#include "..\..\..\common\dik.hpp"

if !( player getVariable ['agony', false] ) exitWith { false };

params ["_ctrl", "_key", "_shift", "_ctrlKey", "_alt"];		

if ( _key isEqualTo DIK_ESCAPE ) exitWith { false };

if ( _key isEqualTo DIK_H ) exitWith {	//call for Help
	[player] call tcb_fnc_callHelp;
	true
};

private _handled = true;
private _hasMoved = player getVariable ["hasMoved", false];

private _list = ['MoveSlowForward', 'MoveForward', 'ShowMap', 'HideMap', 'Chat', 'LookAround'];
if ( _hasMoved ) then { _list pushback "personView"; };

{
	if ( _key in (actionKeys _x) ) then {
		if ( _x isEqualTo 'Chat' ) then {
			_handled = tcb_ais_noChat;
			if ( tcb_ais_noChat ) then { "Chat disabled." call tcb_fnc_dynamicText; };
		} else {
			_handled = false;
			if ( !_hasMoved && (_x in ['MoveForward','MoveSlowForward']) ) then {
				player setVariable ["hasMoved", true, true];
			};
		};
	};
} forEach _list;

_handled