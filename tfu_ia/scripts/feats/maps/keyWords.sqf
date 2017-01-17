
if ( (["follow_mapKeywords"] call core_fnc_getParam) == 0 ) exitWith { true };

(({_x in MAP_KEYWORDS} count _this) > 0)