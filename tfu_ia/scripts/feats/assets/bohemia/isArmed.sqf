
private _class = configName _this;

private "_out";

//if ( _class isKindOf "Air" ) then {
	//yep for air, flares does not count
//	_out = ( (count getArray(_this >> 'weapons')) > 1 );
//} else {
	_out = ( (count ("count getArray(_x >> 'weapons') > 0" configClasses (_this >> "Turrets"))) > 0 );
//};

_out