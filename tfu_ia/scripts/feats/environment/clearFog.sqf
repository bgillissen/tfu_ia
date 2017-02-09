
if ( !isServer ) exitWith {
	remoteExec ["environment_fnc_clearFog", 2];
};

0 setFog 0;
forceWeatherChange;