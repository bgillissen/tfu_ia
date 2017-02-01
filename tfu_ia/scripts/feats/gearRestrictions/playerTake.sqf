
if ( (["restrictGear"] call core_fnc_getParam) == 0 ) exitWith {};

params ["_unit", "_container", "_item"];

[_container] call gearRestrictions_fnc_checkGears