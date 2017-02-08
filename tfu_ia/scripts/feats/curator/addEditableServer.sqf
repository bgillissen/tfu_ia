
params ["_toAdd", "_crew"];

if !( (typeName _toAdd) isEqualTo "ARRAY" ) then { _toAdd = [_toAdd]; };

{
	_x addCuratorEditableObjects [_toAdd, _crew];
} count allCurators;