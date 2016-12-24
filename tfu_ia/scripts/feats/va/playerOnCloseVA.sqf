/*
@filename: feats\va\playerOnCloseVA.sqf
Author:
	Ben
Description:
	this run on player when it close the arsenal,
	Check that all the gear equiped by player is in the arsenal, thx Nancy...
*/

if ( !(["filterArsenal"] call core_fnc_getConf) ) exitWith {};

private _removed = false;

//backpack
private _backpack = backpack player;
if ( !(_backpack in A_backpacks) ) then {
	_removed = true;
	removeBackpack player;
} else {
	private _backpackItems = backpackItems player;
	{
		if ( !(_x in A_items) ) then {
			_removed = true;
			player removeItemFromBackpack _x;
		};
	} count _backpackItems;
	private _backpackWeap = getWeaponCargo (unitBackpack player);
	if ( !(_backpackWeap in A_weapons) ) then {
		_removed = true;
	 	player removeWeapon _backpackWeap;
	};
};

private _goggles = goggles player;
if ( !(_googles in A_items) ) then {
	_removed = true;
	player removeItem _googles;
};

private _headgear = headgear player;
if ( !(_headgear in A_items) ) then {
	_removed = true;
	player removeItem _headgear;
};

private _uniform = uniform player;
if ( !(_uniform in A_items) ) then {
	_removed = true;
	player removeItem _uniform;
} else {
	private _uniformItems = uniformItems player;
	{
		if ( !(_x in A_items) ) then {
			_removed = true;
			player removeItemFromUniform _x;
		};
	} count _uniformItems;
};

private _vest = vest player;
if ( !(_vest in A_items) ) then {
	_removed = true;
	player removeItem _vest;
} else {
	private _vestItems = vestItems player;
	{
		if ( !(_x in A_items) ) then {
			_removed = true;
			player removeItemFromVest _x;
		};
	} count _vestItems;
};

private _assignedItems = assignedItems player;
{
	if ( !(_x in A_items) ) then {
		_removed = true;
		player removeItem _x;
	};
} count _assignedItems;

private _primWeap =  primaryWeapon player;
if ( !(_primWeap in A_weapons) ) then {
	_removed = true;
	player removeWeapon _primWeap;
} else {
	private _primItems = primaryWeaponItems player;
	{
		if ( !(_x in A_items) ) then {
			_removed = true;
			player removePrimaryWeaponItem _x;
		}
	} count _primItems;
};

private _secondWeap =  secondaryWeapon player;
if ( !(_secondWeap in A_weapons) ) then {
	_removed = true;
	player removeWeapon _secondWeap;
} else {
	private _secondItems = secondaryWeaponItems player;
	{
		if ( !(_x in A_items) ) then {
			_removed = true;
			player removeSecondaryWeaponItem _x;
			
		};
	} count _secondItems;
};

private _handWeap = handgunWeapon player;
if ( !(_handWeap in A_weapons) ) then {
	_removed = true;
	player removeWeapon _handWeap;
} else {
	private _handItems = handgunItems player;
	{
		if ( !(_x in A_items) ) then {
			_removed = true;
			player removeHandgunItem _x;
			
		};
	} count _handItems;
};

private _allMagazines = magazinesAmmoFull player;
{
	_x params ["_class", "_ammoCount", "_loaded", "_type", "_loc"];
	if ( !(_class in A_ammo) ) then {
		_removed = true;
		player removeMagazines _x;
	};
} count _allMmagazines;
_allMagazines = nil;	

if ( _removed ) then {
	titleText [A_filterMSG, "PLAIN", A_msgDuration];
};