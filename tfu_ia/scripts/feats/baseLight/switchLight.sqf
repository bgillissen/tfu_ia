
if ( !isServer ) exitWith {
	_this remoteExec ["baseLight_fnc_switchLight", 2];
};

params ["_thing", "_caller", "_id", "_arg"];

private _lightTypes = (["baseLight", "lights"] call core_fnc_getSetting);

private _lights = nearestObjects [(getMarkerPos "SZ"), _lightTypes, SZ_RADIUS]; 

private _dmg = 0;
if !( _arg ) then { _dmg = 0.97; };

{
	_x allowDamage true;
	_x setHit ["light_1_hitpoint", _dmg];
	_x setHit ["light_2_hitpoint", _dmg];
	_x setHit ["light_3_hitpoint", _dmg];
	_x setHit ["light_4_hitpoint", _dmg];
	_x allowDamage false;
	true
} count _lights;

baseLight = _arg;
publicVariable "baseLight";