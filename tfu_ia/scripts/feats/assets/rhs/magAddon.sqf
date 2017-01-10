
if ( format["rhs_magazine_%1", _this] in getArray(configFile >> "cfgPatches" >> "rhs_c_weapons" >> "units") ) exitWith { "RHS_AFRF" };
if ( _this in getArray(configFile >> "cfgPatches" >> "rhs_c_weapons" >> "magazines") ) exitWith { "RHS_AFRF" };

if ( format["rhs_magazine_%1", _this] in getArray(configFile >> "cfgPatches" >> "rhsgref_c_weapons" >> "units") ) exitWith { "RHS_GREF" };
if ( _this in getArray(configFile >> "cfgPatches" >> "rhsgref_c_weapons" >> "magazines") ) exitWith { "RHS_GREF" };

if ( format["rhs_magazine_%1", _this] in getArray(configFile >> "cfgPatches" >> "rhsusf_c_weapons" >> "units") ) exitWith { "RHS_USAF" };
if ( _this in getArray(configFile >> "cfgPatches" >> "rhsusf_c_weapons" >> "magazines") ) exitWith { "RHS_USAF" };

""