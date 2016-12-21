

private _backpack = backpack player;
private _ammo = magazines player;

private _primWeap =  primaryWeapon player;
private _primItems = primaryWeaponItems player;
private _secondWeap =  secondaryWeapon player;
private _secondItems = secondaryWeaponItems player;
private _handWeap = handgunWeapon player;
private _handItems = handgunItems player;

private _curAmmo = currentMagazines player;

/* for all gear equiped check it is available in Arsenal hoooo yeah */
if ( !(_backpack in A_backpacks) ) then removeBackpack player;

{
	if ( !(_x in A_ammo) ) then player removeMagazines _x;
} count(_ammo);
if ( !(_curAmmo in A_ammo) ) then player removeMagazines _x;


if ( !(_primWeap in A_weapons) ) then player removeWeapon _primWeap;
{
	if ( !(_x in A_items) ) then player removeMagazines _x;
} count(_primItems);
if ( !(_secondWeap in A_weapons) ) then player removeWeapon _secondWeap;

if ( !(_handWeap in A_weapons) ) then player removeWeapon _handWeap;