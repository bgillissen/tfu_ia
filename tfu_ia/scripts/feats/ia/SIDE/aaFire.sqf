/*
@filename: feats\ia\SIDE\aaFire.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this run on server,
	search for an air target in range and fire at it 
*/

params ["_batteries"];

private _pos = getPos (_batteries select 0);

//find a target
private _targetList = _pos nearEntities [["Air"], SIDE_priorityAARange];

if ((count _targetList) == 0) ewitWith{};

private _goodTargets = [];
{
	if ((side _x) isEaqualTo PLAYER_SIDE ) then {
		if ((getPos _x select 2) > SIDE_priorityAAminAltitude ) then _goodTargets append [_x];
	};
} count _targetList;
_targetList = nil;

if ((count _goodTargets) == 0) ewitWith{};

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