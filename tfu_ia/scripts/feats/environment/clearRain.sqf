
if ( !isServer ) exitWith {
	remoteExec ["environment_fnc_clearRain", 2];
};

0 setRain 0;
forceWeatherChange;