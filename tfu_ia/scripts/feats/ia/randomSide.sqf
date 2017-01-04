
#include "..\..\core\debug.hpp"

params ["_poolName"];

private _pools = [];

private _poolData = missionNamespace getVariable format["S_%1", _poolName];

{
	private _key = _x call {
		if ( _this isEqualTo east ) exitWith { OPFOR_ENEMY_KEY };
		if ( _this isEqualTo west ) exitWith { BLUFOR_ENEMY_KEY };
		IND_ENEMY_KEY
	};
	if ( count (_poolData select _key) > 0 ) then {
		_pools append [[_x, (_poolData select _key), _key]];
	};
} count ENEMIES;

_pools call {
	if ( count _pools > 0 ) exitWith { selectRandom _pools };
	#ifdef DEBUG
		private _debug = format["No populated enemy pool found for S_%1", _poolName];
		conRed(_debug);
	#endif	
	nil
};