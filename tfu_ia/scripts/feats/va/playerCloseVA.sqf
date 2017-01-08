/*
@filename: feats\va\playerOnCloseVA.sqf
Author:
	Ben
Description:
	this run on player when it close the arsenal,
	Check that all the gear equiped by player is in the arsenal, thx Nancy...
*/

if ( (["filterArsenal"] call core_fnc_getParam) == 0 ) exitWith {};

private _removed = false;

private _goggle = goggles player;
if ( !(_goggle isEqualTo "") ) then {
	if ( !(_goggle in A_items) ) then {
		systemChat format["Goggle: %1 is not allowed", _goggle];
		_removed = true;
		removeGoggles player;
	};
};

private _bino = binocular player;
if ( !(_bino isEqualTo "") ) then {
	if ( !(_bino in A_items) ) then {
		systemChat format["Binocular: %1 is not allowed", _bino];
		_removed = true;
		player removeWeapon _bino;
	};
};


private _headgear = headgear player;
if ( !(_headgear isEqualTo "") ) then {
	if ( !(_headgear in A_items) ) then {
		systemChat format["Headgear: %1 is not allowed", _headgear];
		_removed = true;
		player unassignItem _headgear;
		player removeItem _headgear;
	};
};

//backpack
private _backpack = backpack player;
if ( !(_backpack isEqualTo "") ) then {
	if ( !(_backpack in A_backpacks) ) then {
		systemChat format["Backpack: %1 is not allowed", _backpack];
		_removed = true;
		removeBackpack player;
	} else {
		_removed =  !(["backpack"] call va_fnc_checkContent);
	};
};

//uniform
private _uniform = uniform player;
if ( !(_uniform isEqualTo "") ) then {
	if ( !(_uniform in A_items) ) then {
		systemChat format["Uniform: %1 is not allowed", _uniform];
		_removed = true;
		player unassignItem _uniform;
		player removeItem _uniform;
	} else {
		_removed = !(["uniform"] call va_fnc_checkContent);
	};
};

private _vest = vest player;
if ( !(_vest isEqualTo "") ) then {
	if ( !(_vest in A_items) ) then {
		systemChat format["Vest: %1 is not allowed", _vest];
		_removed = true;
		player unassignItem _vest;
		player removeItem _vest;
	} else {
		_removed = !(["vest"] call va_fnc_checkContent);
	};
};

//assigned items
{
	private _found = false;
	private _isRadio = false;
	if ( MOD_tfar ) then {
		private _item = _x;
		{
			if ( ([_item, _x] call TFAR_fnc_isSameRadio)) exitWith {
				_found = true;
			};
		} count TFAR_SR;
	};
	if ( !_found ) then {
		if ( !(_x in A_items) ) then {
			systemChat format["Item: %1 is not allowed", _x];
			_removed = true;
			player unassignItem _x;
			player removeItem _x;
		};
	};
} count (assignedItems player);

private _primWeap =  primaryWeapon player;
if ( !(_primWeap isEqualTo "") ) then {
	private _baseWeap = [_primWeap] call assets_fnc_baseWeapon;
	if ( !(_baseWeap in A_weapons) ) then {
		systemChat format["primary weapon : %1 (%2) is not allowed", _baseWeap, _primWeap];
		_removed = true;
		player removeWeapon _primWeap;
	} else {
		private _primItems = primaryWeaponItems player;
		{
			if ( !(_x isEqualTo "") ) then {
				if ( !(_x in A_items) ) then {
					systemChat format["primary weapon Item: %1 is not allowed", _x];
					_removed = true;
					player removePrimaryWeaponItem _x;
				}
			}
		} count _primItems;
		private _count = player ammo _primWeap;
		if ( _count > 0 ) then {
			private _mags = primaryWeaponMagazine player;
			{
				if ( !(_x in A_ammo) ) then {
					systemChat format["primary weapon magazine: %1 is not allowed", _x];
					player setAmmo [_primWeap, 0];
					_removed = true;
				};	
			} count _mags;
		};
	};
};

private _secondWeap =  secondaryWeapon player;
if ( !(_secondWeap isEqualTo "") ) then {
	if ( !(_secondWeap in A_weapons) ) then {
		systemChat format["secondary weapon : %1 is not allowed", _secondWeap];
		_removed = true;
		player removeWeapon _secondWeap;
	} else {
		private _secondItems = secondaryWeaponItems player;
		{
			if ( !(_x isEqualTo "") ) then {
				if ( !(_x in A_items) ) then {
					systemChat format["secondary weapon item: %1 is not allowed", _x];
					_removed = true;
					player removeSecondaryWeaponItem _x;
				};
			};
		} count _secondItems;
		private _count = player ammo _secondWeap;
		if ( _count > 0 ) then {
			private _mags = secondaryWeaponMagazine player;
			{
				if ( !(_x in A_ammo) ) then {
					systemChat format["secondary weapon magazine: %1 is not allowed", _x];
					player setAmmo [_secondWeap, 0];
					_removed = true;
				};	
			} count _mags;
		};
	};
};

private _handWeap = handgunWeapon player;
if ( !(_handWeap isEqualTo "") ) then {
	if ( !(_handWeap in A_weapons) ) then {
		systemChat format["hand weapon : %1 is not allowed", _handWeap];
		_removed = true;
		player removeWeapon _handWeap;
	} else {
		private _handItems = handgunItems player;
		{
			if ( !(_x isEqualTo "") ) then {
				if ( !(_x in A_items) ) then {
					_removed = true;
					systemChat format["handgun item: %1 is not allowed", _x];
					player removeHandgunItem _x;
				};
			};
		} count _handItems;
		private _count = player ammo _handWeap;
		if ( _count > 0 ) then {
			private _mags = handGunMagazine player;
			{
				if ( !(_x in A_ammo) ) then {
					systemChat format["handgun magazine: %1 is not allowed", _x];
					player setAmmo [_handWeap, 0];
					_removed = true;
				};	
			} count _mags;
		};
	};
};

if ( _removed ) then {
	private _msg = ["va", "message"] call core_fnc_getSetting;
	private _duration = ["va", "duration"] call core_fnc_getSetting;
	titleText [_msg, "PLAIN", _duration];
};