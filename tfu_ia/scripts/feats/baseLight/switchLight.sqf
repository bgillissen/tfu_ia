
if ( !isServer ) exitWith {
	_this remoteExec ["baseLight_fnc_switchLight", 2];
};


_this remoteExec ["baseLight_fnc_switchLightPlayer", allPlayers, true];

params ["_thing", "_caller", "_id", "_arg"];

baseLight = _arg;
publicVariable "baseLight";