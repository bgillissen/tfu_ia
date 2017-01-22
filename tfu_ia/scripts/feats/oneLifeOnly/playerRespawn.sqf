
if ( (["onelifeonly"] call core_fnc_getParam) == 0 ) exitWith {};

if ( isNil "OLO" ) exitWith {
	OLO = true;
	if ( (getPlayerUID player) in DEAD_PLAYERS ) then {
		waitUntil { !BLACKSCREEN };
		"olo" cutText ["You already died during this mission, sorry but you can only spectate", "BLACK", 0.1, true];
		[] call bis_fnc_respawnspectator;
		sleep 3;
		"olo" cutFadeOut 2;
	};
};

[] call bis_fnc_respawnspectator;