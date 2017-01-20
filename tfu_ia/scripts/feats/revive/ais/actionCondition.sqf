
params ["_action", "_wounded"];

if !( alive _wounded ) exitWith { false };

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

if ( {!isNull(_wounded getVariable [_x, objNull])} count ["carrier", "dragger", "healer", "helper"] > 0 ) exitWith { false };

if !( isNull(player getVariable ["action", objNull]) ) exitWith { false };

if ( player distance _wounded > 3 ) exitWith { false };

if ( player getVariable ["agony", false] ) exitWith { false };

if ( _action isEqualTo "heal" ) exitWith {
	if !( ("mediKit" in (backpackItems _wounded)) || ("mediKit" in (backpackItems player)) ) exitWith { false };
	private _gotFaks = {
		_items = uniformItems _this;
		if ( "firstAidKit" in _items ) exitWith { true };
		_items = vestItems _this;
		if ( "firstAidKit" in _items ) exitWith { true };
		_items = backpackItems _this;
		if ( "firstAidKit" in _items ) exitWith { true };
		false
	};
	if !( (_wounded call _gotFaks) || (player call _gotFaks) ) exitWith { false };
};

true