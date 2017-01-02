
params ["_toadd", "_crew"];

{
	_x addCuratorEditableObjects [_toadd, _crew];
} count allCurators;