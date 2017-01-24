// by psycho
params ["_unit", ["_part", ""]];

if ( (count reviveBleedStack) <= 0 ) exitWith {};
{
	[player, _bodyPart, _bodyPos, _memPoint]
	_x params ["_unit", "_bodyPart", "_bodyPos", "_memPoint"];
	if ( _unit isEqualTo _this ) then {
		if ( (_part isEqualTo _bodyPart) || (_part isEqualTo "") ) then {
			reviveBleedStack = reviveBleedStack - [_x];
		};
	};
} forEach reviveBleedStack;

publicVariable "reviveBleedStack";
