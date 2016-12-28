/*
@filename: feats\ia\SIDE\artiFire.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	run on server,
	used by priority side mission when arti type has been picked
	it search for a player in range and not in a safe zone,
	and send him some salve :D 
Params:
	_batteries	ARRAY of objects, list of arti tanks
	_szCoords	ARRAY of ARRAY of SCALAR, [x,y,z] coordonates of the safe zones
Environment:
	missionParams:
		ArtilleryTargetTickWarning
	missionConfig:
		ia >> checkDelay
		ia >> side >> priority >> arti >> firingMsg
		ia >> side >> priority >> arti >> salve
		ia >> side >> priority >> arti >> salveDelay
		ia >> side >> priority >> arti >> radius
Return:
	nothing
*/

params ["_batteries", "_szCoords"];

private _checkDelay = ["ia", "checkDelay"] call BIS_fnc_GetCfgData;
private _ammo = ((_batteries select 0) magazinesTurret [0]) select 0;
private _target = nullObj;
private "_targetPos";
private _accepted = false;

while ( true ) do {
	_target = playableUnits select (floor (random (count playableUnits)));
	if ( !(isNull _target) ) then {
		if ( (side _target) isEqualTo PLAYER_SIDE ) then {
			_targetPos = getPos _target;
			_accepted = true;
			{
				_x params ["_pos", "_radius"];
				if ((_targetPos distance _pos) < _radius) then { 
					_accepted = false; 
				};
			} count sz_Coords;
			if ( _accepted ) then {
				if ( _targetPos inRangeOfArtillery [_batteries, _ammo] ) exitWith  { 
					_accepted = true; 
				};			
			};
		};
	};
	if ( SIDE_stop || zeusMission ) exitWith { _target = nullObj; };
	if ( _accepted ) exitWith {};
	sleep _checkDelay;
};
_accepted = nil;
_sleepDelay = nil;

if ( _target == nullObj ) exitWith {};

if ( ["ArtilleryTargetTickWarning"] call core_fnc_getConf ) then {
	private _msgs = ["ia", "side", "priority", "arti", "firingMsg"] call BIS_fnc_GetCfgData;
	[(selectRandom _msgs)] remoteExec ["common_fnc_globalSideChat", 0, false];
	_msgs = nil;
};

private _salve = ["ia", "side", "priority", "arti", "salve"] call BIS_fnc_GetCfgData;
private _delay = ["ia", "side", "priority", "arti", "salveDelay"] call BIS_fnc_GetCfgData;
private _radius = ["ia", "side", "priority", "arti", "radius"] call BIS_fnc_GetCfgData;
{
	if ( alive _x ) then {
		for "_c" from 1 to _salve do {
			_targertPos params ["_targetX", "_targetY"];
			private _pos = [(_targetX - _radius + (2 * random _radius)),
							(_targetY - _radius + (2 * random _radius)),
							0
						   ];
			_x doArtilleryFire [_pos, _ammo, 1];
			sleep _delay;
		};
	};
} count (_batteries);
