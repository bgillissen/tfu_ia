/*
@filename: common\global\chatPlayer.sqf
Author:
	ben
Description:
	run on player
	display a chat message
*/

params ["_type", "_msg", "_conf"];

if ( _type isEqualto 1 ) exitWith {	//sideChat
	_conf params ["_from", ["_side", PLAYER_SIDE]];
	[_side, _from] sideChat _msg;
};

if ( _type isEqualto 2 ) exitWith {	//groupChat
	_conf groupChat _msg;
};

if ( _type isEqualto 3 ) exitWith {	//globalChat
	_conf globalChat _msg;
};

if ( _type isEqualto 4 ) exitWith {	//vehicleChat
	_conf vehicleChat _msg;
};

if ( _type isEqualto 5 ) exitWith {	//commandChat
	_conf commandChat _msg;
};

if ( _type isEqualto 6 ) exitWith {	//commandChat
	_conf params ["_source", "_channel"];
	_source customChat [_channel, _msg];
};

if ( _type isEqualto 7 ) exitWith {	//systemChat
	systemChat _msg;
};