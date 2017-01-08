
params ["_type"];

private _out = true;

private _container = _type call {
	if ( _this isEqualTo "backpack" ) exitWith { (backpackContainer player) };
	if ( _this isEqualTo "uniform" ) exitWith { (uniformContainer player) };
	if ( _this isEqualTo "vest" ) exitWith { (vestContainer player) };
	nil
};

if ( isNil "_container" ) exitWith {};

private _removeItem = _type call {
		if ( _this isEqualTo "backpack" ) exitWith { { player removeItemFromBackpack _this; } };
		{ player unassignItem _this;player removeItem _this; }
};

//items
{
	private _found = false;
	if ( MOD_tfar ) then {
		private _item = _x;
		{
			if ( ([_item, _x] call TFAR_fnc_isSameRadio)) exitWith {
				_found = true;
			};
		} count TFAR_SR;
	};
	if ( !_found ) then {
		if ( (_x in A_items) ) then { _found = true; };
	};
	if ( !_found ) then {
		systemChat format["Item in your %1: %2 is not allowed", _type, _x];
		_out = false;
		_x call _removeItem;
	};
} count ((getItemCargo _container) select 0);

//weapons
private _content = getWeaponCargo _container;
{
	private _baseWeap = [_x] call assets_fnc_baseWeapon;
	if ( !(_baseWeap in A_weapons) ) then { 
		_out = false;
		systemChat format["Weapon in your %1: %2 (%3) is not allowed", _type, _baseWeap, _x];
		for "_i" from 1 to ((_content select 1) select _forEachIndex) do {
			_x call _removeItem;
		};
	};
} forEach (_content select 0);

//ammo
{
	if ( !(_x in A_ammo) ) then { 
		_out = false;
		systemChat format["Magazine in your %1: %2 is not allowed", _type, _x];
		player removeMagazines _x;	
	};
} count ((getMagazineCargo _container) select 0);
_out