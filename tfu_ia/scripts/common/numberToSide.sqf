
private _logic = {
	if ( _this isEqualTo 0 ) exitWith { east };
	if ( _this isEqualTo 1 ) exitWith { west };
	independent		
};

if ( typeName _this isEqualTo "ARRAY" ) exitWith {
	{
		_this set [_forEachIndex, (_x call _logic)];
	} forEach _this;
	_this
};

(_this call _logic)