/*
@filename: feats\va\playerOnCloseVA.sqf
Author:
	Ben
Description:
	this run on server,
	Check that all the gear equiped by player is in the arsenal, thx Nancy...
*/

if ( !(["filterArsenal"] call core_fnc_getConf) ) exitWith {};

private _backpack = backpack player;
private _ammo = magazines player;

private _primWeap =  primaryWeapon player;
private _primItems = primaryWeaponItems player;
private _secondWeap =  secondaryWeapon player;
private _secondItems = secondaryWeaponItems player;
private _handWeap = handgunWeapon player;
private _handItems = handgunItems player;

private _curAmmo = currentMagazines player;

if ( !(_backpack in A_backpacks) ) then removeBackpack player;

{
	if ( !(_x in A_ammo) ) then player removeMagazines _x;
} count(_ammo);
if ( !(_curAmmo in A_ammo) ) then player removeMagazines _x;

//TO FINISH, but for tomorrow
if ( !(_primWeap in A_weapons) ) then player removeWeapon _primWeap;
{
	if ( !(_x in A_items) ) then player removeMagazines _x;
} count(_primItems);
if ( !(_secondWeap in A_weapons) ) then player removeWeapon _secondWeap;

if ( !(_handWeap in A_weapons) ) then player removeWeapon _handWeap;