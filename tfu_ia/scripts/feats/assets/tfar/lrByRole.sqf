
params["_role"];

if ( !(_role in ["hq", "sl", "tl", "jtac"]) ) exitWith { "" };

if ( PLAYER_SIDE isEqualTo west ) exitWith {
	if ( _role isEqualTo "hq" ) exitWith { "" };
	""
};
if ( PLAYER_SIDE isEqualTo east ) exitWith {
	if ( _role isEqualTo "hq" ) exitWith { "" };
	""
};
if ( PLAYER_SIDE isEqualTo independent ) exitWith {
	if ( _role isEqualTo "hq" ) exitWith { "tf_anprc155" };
	"tf_anprc155_coyote"
};