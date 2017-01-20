// by psycho

if ( (count tcb_ais_bleedStack) > 0 ) then {
	{
		_x params ["_unit", "_bodyPos", "_wound"];
		if ( _unit isEqualTo _this ) then {
			tcb_ais_bleedStack = tcb_ais_bleedStack - [_x];
			_unit setVariable ["PulseTime", -1]; 
			deletevehicle (_unit getVariable ["bloodParticleLogic", objNull]);
			deletevehicle (_unit getVariable ["bloodParticleSource", objNull]);
		};
	} forEach tcb_ais_areBleeding;
	publicVariable "tcb_ais_bleedStack";
};