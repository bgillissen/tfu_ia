#define NO_SIDE -1
#define EAST 0			// (Russian)
#define WEST 1			// (NATO)
#define RESISTANCE 2	// Guerilla 
#define CIVILIAN 3
#define NEUTRAL 4
#define ENEMY 5
#define FRIENDLY 6
#define LOGIC 7

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