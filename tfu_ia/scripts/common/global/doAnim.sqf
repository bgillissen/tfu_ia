
if !( isServer ) exitWith {
	_this remoteExec ["global_fnc_doAnimServer", 2, false];
};

_this call global_fnc_doAnimServer;