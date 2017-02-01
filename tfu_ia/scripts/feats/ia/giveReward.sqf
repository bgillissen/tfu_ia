
if ( count REWARDS == 0 ) exitWith {
	"noReward";
};

//TODO base/side change 
if ( isNil "REWARD_markers" ) then {
	REWARD_markers = [];
	REWARD_markerPool = [];
	REWARD_pool = [];
	for "_x" from 1 to 99 do { 
		private _markerName = format["Reward_%1", _x];
		if !( getMarkerPos _markerName isEqualTo [0,0,0] ) then { 
			REWARD_markers pushback _markerName; 
		};
	};
};

if ( count REWARD_markers == 0 ) exitWith {
	"noMarkers";
};

if ( count REWARD_markerPool == 0 ) then {
	REWARD_markerPool = REWARD_markers;
};
if ( count REWARD_pool == 0 ) then {
	REWARD_pool = REWARDS;
};

private _marker = (selectRandom REWARD_markerPool);
REWARD_markerPool = REWARD_markerPool - [_marker];
private _pos = getMarkerPos _marker;
private _dir = markerDir _merker;

private _reward = (selectRandom REWARD_pool);
REWARD_pool = REWARD_pool - [_reward];

_reward params ["_class", "_poolName", "_actions"];

private _veh = _class createVehicle _pos;
_veh setDir _dir;

[_veh, _poolName, _actions] call vehicleRespawn_fnc_setup;

getText("cfgVehicles" >> _reward >> "displayName")