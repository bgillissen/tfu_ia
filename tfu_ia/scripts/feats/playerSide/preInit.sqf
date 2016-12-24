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
if ( PLAYER_SIDE isEqualTo east ){
	PLAYER_SIDETXT = "EAST";
	ENEMY_SIDETXT = "WEST";
} else {
	PLAYER_SIDETXT = "WEST";
	ENEMY_SIDETXT = "EAST";
};

//check if independent are ennemy to players
IND_ARE_ENEMY = ( ["indEnemy"] call core_fnc_getConf );

//change independent friendship according to parameters
independent setFriend [PLAYER_SIDE, !IND_ARE_ENEMY];
PLAYER_SIDE, setFriend [independent, !IND_ARE_ENEMY];
independent setFriend [ENEMY_SIDE, IND_ARE_ENEMY];
ENEMY_SIDE setFriend [independent, IND_ARE_ENEMY];

