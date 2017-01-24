
params ["_action", "_wounded"];

if !( alive _wounded ) exitWith { false };

if ( _action isEqualTo "drop" ) exitWith { (player isEqualTo _wounded) };

if ( player distance _wounded > 3 ) exitWith { false };

if !( isNull((player getVariable ["action", ["", objNull]]) select 1) ) exitWith { false };

//if !( player getVariable ["agony", false] ) exitWith { false }; should not be needed, as i remove the actions when needed

if ( {!isNull(_wounded getVariable [_x, objNull])} count ["carrier", "dragger", "healer", "helper"] > 0 ) exitWith { false };

if ( _action isEqualTo "load" ) exitwith {
	if !( (_wounded getVariable['inVeh', objNull]) isEqualTo objNull ) exitWith { false };
	private _vehs = (position player) nearEntities [["Air", "Car", "Armored"], 5];
	( count _vehs > 0 )
};

if ( _action isEqualTo "unload" ) exitwith {
	(velocity _wounded) params ["_vX", "_vY", "_vZ"];
	( _vx == 0 && _vY == 0 && _vZ == 0 )
};

//TODO do player swim ?, no ok can carry, 
//TODO can player drag wounded without his head is under water ?
//TODO, so got to check water depth, and use the right treshold... 
(getPos _wounded) params ["_x", "_y"];
if ( surfaceIsWater [_x, _y] ) exitwith { false };

if ( _action isEqualTo "heal" ) exitWith {
	if ( !([_wounded, "mediKit"] call revive_fnc_gotItem) && !([player, "mediKit"] call revive_fnc_gotItem) ) exitWith { false };
	if ( !([_wounded, "firstAidKit"] call revive_fnc_gotItem) && !([player, "firstAidKit"] call revive_fnc_gotItem) ) exitWith { false };
	true
};

if ( _action isEqualTo "vehHeal" ) exitWith {
	//( count ((getPos player) nearEntities [(BV_medEvac + BV_landMedic), 10]) > 0 )
};

true