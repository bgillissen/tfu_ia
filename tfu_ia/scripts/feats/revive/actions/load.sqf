params ["_wounded", "_loader"];

private _unsorted = (position player) nearEntities [["Air", "Car", "Armored"], 5];

if ( count _unsorted <= 0 ) exitWith {
	["No vehicle nearby.",0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText
};

private _sorted = [];
private _pos = getPos player;
private _closest = _unsorted select 0;
{
    {
    	if ((getPos _x distance _pos) < (getPos _closest distance _pos)) then { _closest = _x; };
    } forEach _unsorted;
    (velocity _x) params ["_vX", "_vY", "_vZ"];
    if ( _vx == 0 && _vY == 0 && _vZ == 0 ) then { _sorted pushback _closest; };
    _unsorted = _unsorted - [_closest]
} forEach _unsorted;

if ( count _sorted == 0 ) exitWith {
	["No stoped vehicle nearby.",0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText
};

private _found = false;
{
	private _crew = fullcrew [_x, "cargo", true];
	if ( ({(_x select 0) isEqualTo objNull} count _crew) > 0 ) exitWith {
		_found = true;
		_wounded setVariable ["inVeh", _x, true];
		private _vehName = getText(configFile >> "cfgVehicles" >> (typeOf _x) >> "displayName");
		[format["Loading %1 into %2.", name _wounded, _vehName],0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText
	};
} forEach _sorted;

if ( !_found ) then {
	["No free cargo seat left.",0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText
};
