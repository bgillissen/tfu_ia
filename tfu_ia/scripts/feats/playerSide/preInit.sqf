/*
@filename: feats\playerSide\preInit.sqf
Author:
	Ben
Description:
	this run on client and server
*/

//check what is the players side, TODO move into a feature playerSide
PLAYER_SIDE = [east, west] select ( ["side"] call core_fnc_getConf );
ENEMY_SIDE = [west, east] select ( ["side"] call core_fnc_getConf );
if ( PLAYER_SIZE isEqualTo east ){
	PLAYER_SIDETXT = "OPFOR";
	ENEMY_SIDETXT = "BLUFOR";
} else {
	PLAYER_SIDETXT = "BLUFOR";
	ENEMY_SIDETXT = "OPFOR";
};

//check if independent are ennemy to players
IND_ARE_ENEMY = ( ["indEnemy"] call core_fnc_getConf );

//change independent friendship according to parameters
if ( (IND_ARE_ENEMY && PLAYER_SIDE == west) || (!IND_ARE_ENEMY && PLAYER_SIDE == east) ) then {
	//ind against west
	independent setFriend [east, 1];
	east setFriend [independent, 1];
	independent setFriend [west, 0];
	west setFriend [independent, 0];
} else {
	//ind against east
	independent setFriend [east, 0];
	east setFriend [independent, 0];
	independent setFriend [west, 1];
	west setFriend [independent, 1];
};