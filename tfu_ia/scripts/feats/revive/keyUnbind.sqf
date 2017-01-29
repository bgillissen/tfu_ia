// by psycho
// unbind some key functions while the player is unconcious (caused by stupid 3.0)
#include "..\..\common\dik.hpp"

if !( player getVariable ['agony', false] ) exitWith { false };

params ["_ctrl", "_key", "_shift", "_ctrlKey", "_alt"];		

if ( userInputDisabled ) exitWith { true };

if ( _key isEqualTo DIK_ESCAPE ) exitWith { false };

if ( _key isEqualTo DIK_H ) exitWith {	//call for Help
	[player] call revive_fnc_callHelp;
	true
};

private _handled = true;
private _inWater = player getVariable ["inWater", false];
private _hasMoved = player getVariable ["hasMoved", false];
private _inVeh =  ( !(isNull (player getVariable ["inVeh", objNull])) || !((vehicle player) isEqualTo player) );
private _list = ['ShowMap', 'HideMap', 'Chat', 'LookAround'];
if ( _hasMoved || _inWater ) then { _list pushback "personView"; };
if !( _inVeh || _inWater ) then { _list pushback 'MoveForward'; };//'MoveSlowForward'

{
	if ( _key in (actionKeys _x) ) then {
		if ( _x isEqualTo 'Chat' ) then {
			private _noChat = [false, true] select (["reviveNoChat"] call core_fnc_getParam);
			_handled = _noChat;
			if ( _noChat ) then { "Chat is disabled." call revive_fnc_dynamicText; };
		} else {
			_handled = false;
			if ( !(_hasMoved) && (_x isEqualTo 'MoveForward') ) then {
				player setVariable ["hasMoved", true, true];
			};
		};
	};
} forEach _list;

_handled