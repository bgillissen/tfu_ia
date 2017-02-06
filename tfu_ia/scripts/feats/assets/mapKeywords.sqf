
private _keywords = getArray(missionConfigFile >> "maps" >> toUpper(worldName) >> "keywords");

( ({_x in MAP_KEYWORDS} count _this) > 0 )