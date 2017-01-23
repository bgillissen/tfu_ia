
if ( MOD_ace ) exitWith {};

{
	_x execFSM ("feats\revive\fsm\main.fsm");
} forEach ( allPlayers - (entities 'headless_Client_F') );