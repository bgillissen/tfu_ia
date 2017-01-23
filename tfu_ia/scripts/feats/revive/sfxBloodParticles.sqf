

{
	_x params ["_unit", "_bodyPart", "_bodyPos", "_memPoint"];
	private _agony = _unit getVariable ["agony", false];
	if ( alive _unit && _agony ) then {
		private _allowBleeding = true;
		private _nextTime = _unit getVariable ["PulseTime", -1];
		if(_nextTime == -1) then {
			_unit setVariable ["PulseTime", diag_tickTime + (1+random 2)];
			private _source = "logic" createVehicleLocal (getpos _unit);
			_unit setVariable ["bloodParticleLogic", _source];
			if (vehicle _unit isEqualTo _unit) then {
				_source attachTo [_unit, _bodyPos, _memPoint];
			} else {
				_allowBleeding = false;
			};
			_unit setVariable ["bloodParticleSource", nil];
		};
		if ( _allowBleeding ) then {
			if ( (diag_tickTime >= _nextTime) && (isNull (_unit getVariable ["healer", objNull])) && (isNull (_unit getVariable ["helper", objNull])) ) then {
				private _source = _unit getVariable ["bloodParticleSource", nil];
				if (isNil "_source") then {
					_unit setVariable ["PulseTime", diag_tickTime + 0.5];
					private _logic = _unit getVariable "bloodParticleLogic";
					private _blood = "#particlesource" createVehicleLocal (getpos _logic);
					_blood setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 13, 1],
					                          "",
					                          "Billboard",
					                          0.5,
					                          0.1,																//lifetime
					                          [0,0,0],
					                          [(0.3 - (random 0.6)),(0.3 - (random 0.6)),(0.2 + (random 0.3))],	//velocity
					                          1, 																//rotationVel
					                          0.32, 															//weight
					                          0.2, 																//volume
					                          0.05,																//rubbing
					                          [0.05,0.25],
					                          [[0.2,0.01,0.01,1],[0.2,0.01,0.01,0]],							//color
					                          [0.1],
					                          1,																//ran dir
					                          0.04,																//ran intensity
					                          "",
					                          "",
					                          _logic];
					_blood setParticleRandom [2, [0, 0, 0], [0.0, 0.0, 0.0], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
					_blood setDropInterval 0.02;
					_unit setVariable ["bloodParticleSource", _blood];
				} else {
					_unit setVariable ["PulseTime", diag_tickTime + (1.5+random(2))];
					deletevehicle (_unit getVariable ["bloodParticleSource", objNull]);
					_unit setVariable ["bloodParticleSource", nil];
				};
			};
		};
	} else {
		_unit setVariable ["PulseTime", -1]; 
		deletevehicle (_unit getVariable ["bloodParticleLogic", objNull]);
		deletevehicle (_unit getVariable ["bloodParticleSource", objNull]);
	};
} forEach reviveBleedStack;