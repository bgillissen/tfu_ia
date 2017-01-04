
params ["_coord", "_radius"];


private _objects = _coord nearObjects ["Ruins", _radius];
if ( count _objects > 0 ) then {
	[_objects] call common_fnc_deleteObjects;
};
