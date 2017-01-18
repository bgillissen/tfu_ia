// by psycho
// unbind some key functions while the player is unconcious (caused by stupid 3.0)

if !( player getVariable ['unit_is_unconscious', false] ) exitWith { true };

params ["_ctrl", "_key", "_shift", "_ctrlKey", "_alt"];		

if ( _key isEqualTo 35 ) exitWith {	//H = call for Help
	[player] call tcb_fnc_callHelp;
	false
};

if ( _key isEqualTo (actionKeys 'FreeHeadMove') ) exitWith {
	tcb_ais_FreeHeadMove = true;
	true
};


private _handled = false;
{
	if ( _key in (actionKeys _x) ) then { 
		_handled = ( (_x isEqualTo 'Chat') && tcb_ais_noChat );
		if !( _handled ) then {
			["<t size='0.8' shadow='1' color='#ffffff' font='PuristaMedium'>Chat disabled.", (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 1] spawn BIS_fnc_dynamicText;
		};
	};
} forEach ['ReloadMagazine', 'ShowMap', 'HideMap', 'Throw', 'CycleThrownItems', 'Chat'];

_handled