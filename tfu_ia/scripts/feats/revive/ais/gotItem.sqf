
params ["_unit", "_item"];

private _items = uniformItems _unit;
if ( _item in _items ) exitWith { true };

_items = vestItems _unit;
if ( _item in _items ) exitWith { true };

_items = backpackItems _unit;
if ( _item in _items ) exitWith { true };

false
