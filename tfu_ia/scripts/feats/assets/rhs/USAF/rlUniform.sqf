params ["_role"];

if ( _role isEqualTo "hq" ) exitWith { "rhs_uniform_g3_blk" };
if ( _role isEqualTo "jPilot" ) exitWith { "" };

if ( ("jungle" in MAP_KEYWORDS) || ("wood" in MAP_KEYWORDS) ) exitWith { "rhs_uniform_g3_m81" };

if ( "desert" in MAP_KEYWORDS ) exitWith { "rhs_uniform_g3_tan" };

if ( "dry" in MAP_KEYWORDS ) exitWith { "rhs_uniform_g3_mc" };

"rhs_uniform_g3_rgr"