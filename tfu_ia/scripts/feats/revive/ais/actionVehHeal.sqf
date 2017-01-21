// by BonInf*
// changed by psycho
params ["_wounded", "_healer"];

private _medEvac = (getPos _healer) nearEntities [(BV_medEvac + BV_landMedic), 10];

if ( count _medEvac == 0 ) exitWith {};

_wounded setVariable ["medEvac", (_medEvac select 0), true];

[_wounded, _healer] call tcb_fnc_actionHeal;