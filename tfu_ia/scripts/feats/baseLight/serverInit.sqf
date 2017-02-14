
baseLight = true;
publicVariable "baseLight";

private _lightTypes = (["baseLight", "lights"] call core_fnc_getSetting);

baseLights = nearestObjects [(getMarkerPos "SZ"), _lightTypes, SZ_RADIUS]; 
publicVariable "baseLights";

{ _x allowDamage false; } forEach baseLights;