
params [["_dlcFilter", 0], ["_factionFilters", []], ["_kindFilters", []], ["_isArmed", 0], ["_isArmedFunction", "{true}"], ["_extFilters", []]];

private _filters = [];

if ( !(_dlcFilter isEqualTo 0) ) then {
	_filters pushback format["getText( _x >> 'dlc' ) isEqualTo '%1'", _dlcFilter];
};

if ( typeName _factionFilters isEqualTo "SIDE" ) then {
	_filters pushback format["getNumber( _x >> 'side' ) isEqualTo %1", (_factionFilters call BIS_fnc_sideID)];
} else {
	if ( typeName _factionFilters isEqualTo "STRING" ) then {
		_factionFilters = [_factionFilters];
	};
	if ( (count _factionFilters) > 0 ) then {
		private _buff = [];
		{
			_buff pushback format["getText( _x >> 'faction' ) isEqualTo '%1'", _x];
			true
		} count _factionFilters;
		_filters pushback format["(%1)", (_buff joinString ") || (")];
	};
};

if ( typeName _kindFilters isEqualTo "STRING" ) then {
	_kindFilters = [_kindFilters];
};
if ( (count _kindFilters) > 0 ) then {
	private _buff = [];
	{
		_buff pushback format["(configName _x) isKindOf ['%1', (configFile >> 'CfgVehicles')]", _x];
		true
	} count _kindFilters;
	_filters pushback format["(%1)", (_buff joinString ") || (")];
};

if ( !(_isArmed isEqualTo 0) ) then {
	if ( _isArmed ) then {
		_filters pushback format["_x call %1", _isArmedFunction];	
	} else {
		_filters pushback format["!(_x call %1)", _isArmedFunction];
	};
};

if ( typeName _extFilters == "STRING" ) then {
	_extFilters = [_extFilters];
};
if ( (count _extFilters) > 0 ) then {
	_filters append _extFilters;
};

_filters