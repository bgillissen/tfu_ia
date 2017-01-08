params["_cfg"];

private _baseCfg = (configFile >> "cfgWeapons");

if ( (typeName _cfg) isEqualTo "STRING" ) then {
	_cfg = (_baseCfg >> _cfg);
};
	
while { isClass (_cfg >> "LinkedItems") } do {
	private _parent = configName (inheritsFrom _cfg);
	_cfg = _baseCfg >> _parent;
};

configName _cfg