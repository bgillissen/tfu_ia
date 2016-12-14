/*
@filename: feats\voiceControl\channelId.sqf
Author:
	Ben
Description:
	This script is used to know on which channel player is talking
*/

param ["_chan"];

switch _chan do {
	case localize "str_channel_global" : {["Global",0]};
	case localize "str_channel_side" : {["Side",1]};
	case localize "str_channel_command" : {["Command",2]};
	case localize "str_channel_group" : {["Group",3]};
	case localize "str_channel_vehicle" : {["Vehicle",4]};
	case localize "str_channel_direct" : {["Direct",5]};
	default {["",-1]};
};