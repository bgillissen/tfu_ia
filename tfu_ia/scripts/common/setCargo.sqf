/*
@filename: common\setCargo.sqf
Author:
	Ben
Description:
	this script will run on client or server side,
	it populate object cargo
*/

param ["_obj"];

clearWeaponCargoGlobal _obj;
clearMagazineCargoGlobal _obj;
clearItemCargoGlobal _obj;
clearBackpackCargoGlobal _obj;

{ _obj addWeaponCargoGlobal [_x select 0, _x select 1]; } forEach( CARGO_weapons );
{ _obj addMagazineCargoGlobal [_x select 0, _x select 1]; } forEach( CARGO_ammo );
{ _obj addItemCargoGlobal [_x select 0, _x select 1]; } forEach( CARGO_items );
{ _obj addBackpackCargoGlobal [_x select 0, _x select 1]; } forEach( CARGO_backpacks );