
if ( (["onelifeonly"] call core_fnc_getParam) == 0 ) exitWith {};

if ( isNil "OLO" ) exitWith {
	OLO = true;
	private _uid = getPlayerUID player;
	if ( _uid in DEAD_PLAYERS ) then {
		waitUntil { !BLACKSCREEN };
		"olo" cutText ["You already died during this mission, sorry but you can only spectate", "BLACK", 1, true];
		sleep 3;
		"olo" cutFadeOut 2;
		[] call bis_fnc_respawnspectator; 
	};
};

[] call bis_fnc_respawnspectator;