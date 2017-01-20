
if !( isServer ) exitWith {
	_this remoteExec ["common_fnc_globalDoAnimServer", 2, false];
};

_this call common_fnc_globalDoAnimServer;