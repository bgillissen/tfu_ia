

VR_triggers = [];
VR_markers = [];

private _size = ["vehicleRepair", "triggerSize"] call core_fnc_getSetting;
private _color = call common_fnc_getMarkerColor;

{
	private _markerName = format["VR_%1", _x];
	private _coord = getMarkerPos _markerName;
	if !( _coord isEqualTo [0,0,0] ) then { 
		private _trigger = createTrigger ["EmptyDetector", _coord];
		_trigger setTriggerArea [_size, _size, 0, false, -1];
		_trigger setTriggerActivation [toUpper (str PLAYER_SIDE), "PRESENT", true];
		_trigger setTriggerStatements ["this and ((getPos (thisList select 0)) select 2 < 1)",
		                               format["0 = [(thisList select 0), '%1'] spawn vehicleRepair_fnc_repair;", _x],
		                               ""];
		VR_triggers pushback _trigger;
		private _marker = format["VR_marker_%1", _x];
		createMarker [_marker, _coord];
		_marker setMarkerColor _color;
		_marker setMarkerShape "ICON";
		_marker setMarkerType (["vehicleRepair", _x, "icon"] call core_fnc_getSetting);
		_marker setMarkerText (["vehicleRepair", _x, "text"] call core_fnc_getSetting);
		VR_markers pushback _marker;
	};
} forEach ["uav", "plane", "heli", "land", "boat"];