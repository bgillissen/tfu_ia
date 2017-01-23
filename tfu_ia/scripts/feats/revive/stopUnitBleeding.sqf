// by psycho

if ( (count reviveBleedStack) > 0 ) then {
	{
		_x params ["_unit", "_bodyPos", "_wound"];
		if ( _unit isEqualTo _this ) then {
			reviveBleedStack = reviveBleedStack - [_x];
			_unit setVariable ["PulseTime", -1]; 
			deletevehicle (_unit getVariable ["bloodParticleLogic", objNull]);
			deletevehicle (_unit getVariable ["bloodParticleSource", objNull]);
		};
	} forEach reviveBleedStack;
	publicVariable "reviveBleedStack";
};