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

private _checkDelay = ["ia", "checkDelay"] call core_fnc_getSetting;
private _ammo = ((_batteries select 0) magazinesTurret [0]) select 0;

private _targets = allPlayers - (entities "headless_Client_F");
private _target = objNull;
private _targetPos = [0,0,0];
private _accepted = false;

while { !_accepted } do {
	if ( (count _targets) == 0 ) exitWith {};
	_target = selectRandom _targets;
	_targets = _targets - [_target];
	if ( (side _target) isEqualTo PLAYER_SIDE ) then {
		_targetPos = getPos _target;
		_accepted = true;
		{
			_x params ["_pos", "_radius"];
			if ( (_targetPos distance _pos) <= _radius ) then { 
				_accepted = false; 
			};
		} count _szCoords;
		if ( _accepted ) then {
			if !( _targetPos inRangeOfArtillery [_batteries, _ammo] ) then { 
				_accepted = false; 
			};			
		};
	};
	if ( SIDE_stop || zeusMission ) exitWith {};
	sleep _checkDelay;
};
_accepted = nil;
_sleepDelay = nil;

if ( _target isEqualTo objNull ) exitWith {};

if ( (["ArtilleryTargetTickWarning"] call core_fnc_getParam) == 1 ) then {
	private _msgs = ["ia", "side", "priority", "arti", "firingMsg"] call core_fnc_getSetting;
	[1, (selectRandom _msgs), ["HQ", PLAYER_SIDE]] call global_fnc_chat;
	_msgs = nil;
};

private _salve = ["ia", "side", "priority", "arti", "salve"] call core_fnc_getSetting;
private _delay = ["ia", "side", "priority", "arti", "salveDelay"] call core_fnc_getSetting;
private _radius = ["ia", "side", "priority", "arti", "radius"] call core_fnc_getSetting;
{
	if ( alive _x ) then {
		for "_c" from 1 to _salve do {
			_targetPos params ["_targetX", "_targetY"];
			private _pos = [(_targetX - _radius + (2 * random _radius)),
							(_targetY - _radius + (2 * random _radius)),
							0
						   ];
			_x doArtilleryFire [_pos, _ammo, 1];
			sleep _delay;
		};
	};
} count (_batteries);
