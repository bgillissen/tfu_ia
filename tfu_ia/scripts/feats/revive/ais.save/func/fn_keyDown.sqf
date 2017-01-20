// by psycho
// unbind some key functions while the player is unconcious (caused by stupid 3.0)
#include "..\..\..\..\common\bik.hpp"

if !( player getVariable ['unit_is_unconscious', false] ) exitWith { false };

params ["_ctrl", "_key", "_shift", "_ctrlKey", "_alt"];		

if ( _key isEqualTo DIK_ESCAPE ) exitWith { false };

if ( _key isEqualTo DIK_H ) exitWith {	//call for Help
	[player] call tcb_fnc_callHelp;
	true
};

private _handled = true;

private _list = ['MoveSlowForward', 'MoveForward', 'ShowMap', 'HideMap', 'Chat', 'LookAround'];
if ( tcb_ais_hasMoved ) then { _list pushback "personView"; };

{
	if ( _key in (actionKeys _x) ) then {
		if ( _x isEqualTo 'Chat' ) then {
			_handled = tcb_ais_noChat;
			if ( tcb_ais_noChat ) then {
				["<t size='0.8' shadow='1' color='#ffffff' font='PuristaMedium'>Chat disabled.", (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 1] spawn BIS_fnc_dynamicText;
			};
		} else {
			_handled = false;
			if !( tcb_ais_hasMoved ) then {
				tcb_ais_hasMoved = (_x in ['MoveForward','MoveSlowForward']);
				if ( tcb_ais_hasMoved ) then {
					player remoteExec ["ais_fnc_hasMoved", allPlayers, false]; 
				};
			};
		};
	};
} forEach _list;

_handled