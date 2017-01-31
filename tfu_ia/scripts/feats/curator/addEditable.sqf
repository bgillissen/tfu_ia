
if ( isServer ) exitWith {
	_this call curator_fnc_addEditableServer;
};

_this remoteExec ["curator_fnc_addEditableServer", 2, false];