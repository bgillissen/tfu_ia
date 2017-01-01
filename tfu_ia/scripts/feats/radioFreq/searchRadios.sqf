
params [["_isProto", false], ["_radio", ""]];

private _out = [];

private _checkContent = {
	params ["_tocheck", "_filter", "_isProto"];
	private _do = false;
	if ( _filter isEqualTo "" ) then {
		{
			if ( [_tocheck, _x] call TFAR_fnc_isSameRadio ) exitWith { _do = true; };
		} count TFAR_SR;
	} else {
		_do = ([_tocheck, _filter] call TFAR_fnc_isSameRadio);
	};
	if ( _do ) then {
		private _append = true;
		if ( _isProto ) then {
			_append = ( _tocheck call TFAR_fnc_isPrototypeRadio ); 
		};
		if ( _append ) then {
			_out append [_tocheck];
		};
	};
	true	
};


//assigned
{
	[_x, _radio, _isProto] call _checkContent;
} count (assignedItems player);
//uniform
{
	[_x, _radio, _isProto] call _checkContent;
} count ((getItemCargo uniformContainer player) select 0);
//vest
{
	[_x select 0, _radio, _isProto] call _checkContent;
} count ((getItemCargo vestContainer player) select 0);
//backpack
{
	[_x select 0, _radio, _isProto] call _checkContent;
} count ((getItemCargo backpackContainer player) select 0);

_out