/*
@filename: feats\ia\SIDE\artiFire.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this run on server,
	search for a target player in range and not in safe zone,
	and send some salve to him :D 
*/

params ["_batteries", "_szCoords"];

private _ammo = ((_batteries select 0) magazinesTurret [0]) select 0);
private _target = nullObj;
private "_targetPos";
private _accepted = false;

while { true } do {
	_target = playableUnits select (floor (random (count playableUnits)));
	if (!isNull _target) then {
		_targetPos = getPos _target;
		_accepted = true;
		{
			_x params ["_pos", "_radius"];
			if ((_targetPos distance _pos) < _radius) then _accepted = false;
		} count (sz_Coords);
		if ( _accepted ) then {
			if ( _targetPos inRangeOfArtillery [_batteries, _ammo] ) then {
				if ( side _target == PLAYER_SIDE ) ewitWith  { _accepted = true; }			
			};
		};
	};
	if ( SIDE_stop || zeusMission ) exitWith { _target = nullObj; };
	if ( _accepted ) exitWith {};
	sleep IA_checkDelay;
};
_accepted = nil;

if ( _target == nullObj ) exitWith {};

if ( ["ArtilleryTargetTickWarning"] call core_fnc_getConf ) then {
	[(selectRandom SIDE_priorityArtiFiringMsg)] remoteExec ["common_fnc_globalSideChat", 0, false];
};

{
	if ( alive _x ) then {
		for "_c" from 1 to SIDE_priorityArtiSalve do {
			_targertPos params ["_targetX", "_targetY"];
			private _pos = [(_targetX - SIDE_priorityArtiRadius + (2 * random _SIDE_priorityArtiRadius),
							(_targetY - SIDE_priorityArtiRadius + (2 * random _SIDE_priorityArtiRadius),
							0
						   ];
			_x doArtilleryFire [_pos, _ammo, 1];
			sleep SIDE_priorityArtiSalveDelay;
		};
	};

} count (_batteries);