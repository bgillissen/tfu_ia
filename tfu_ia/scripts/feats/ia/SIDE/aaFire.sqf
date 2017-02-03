/*
@filename: feats\ia\SIDE\aaFire.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	run on server,
	search for an air target in range and fire at it
Params:
	_batteries	ARRAY of object, list of vehicles to make fire (aaTanks)
Environment params:
	missionConfig:
		ia >> side >> priority >> aa >> range
		ia >> side >> priority >> aa >> minAltitude
Return:
	nothing
*/

params ["_batteries"];

private _pos = getPos (_batteries select 0);
private _range = ["ia", "side", "priority", "aa", "range"] call core_fnc_getSetting;

//find a target
private _targetList = _pos nearEntities [["Air"], _range];
_range = nil;

if ( (count _targetList) <= 0 ) exitWith {};

private _goodTargets = [];
private _minAlt = ["ia", "side", "priority", "aa", "minAltitude"] call core_fnc_getSetting;
{
	if ( (side _x) isEqualTo PLAYER_SIDE ) then {
		if ((getPos _x select 2) > _minAlt ) then {
			_goodTargets pushback _x;
		};
	};
} count _targetList;
_targetList = nil;
_minAlt = nil;

if ((count _goodTargets) <= 0) exitWith {};

{
	private _target = selectRandom _goodTargets;
	if (canFire _x) then {
		_x doWatch _target;
		_x doTarget _target;
		sleep 2;
		//_x fireAtTarget [_target, "missiles_titan"];
		_x doFire _target;
	};
} count _batteries;
