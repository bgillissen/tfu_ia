
params["_role"];

if ( !(_role in ["hq", "sl", "tl", "jtac"]) ) exitWith { "" };

if ( PLAYER_SIDE isEqualTo west ) exitWith {
	if ( _role isEqualTo "hq" ) exitWith { "tf_rt1523g_bwmod" };
	if ( ("wood" in MAP_KEYWORDS) || ("jungle" in MAP_KEYWORDS) ) exitWith { "tf_rt1523g_big_bwmod" };
	"tf_rt1523g_big_rhs"
};
if ( PLAYER_SIDE isEqualTo east ) exitWith {
	if ( ("dry" in MAP_KEYWORDS) || ("dessert" in MAP_KEYWORDS) ) exitWith { "tf_mr3000_multicam" };
	"tf_mr3000_bwmod"
};
if ( PLAYER_SIDE isEqualTo independent ) exitWith {
	if ( ("wood" in MAP_KEYWORDS) || ("jungle" in MAP_KEYWORDS) ) exitWith { "tf_anprc155" };
	"tf_anprc155_coyote"
};