/*
@filename: common\setCargo.sqf
Author:
	Ben
Description:
	this script will run on client or server side,
	it populate object cargo with the given items list
	param object, backpacks, items, weapons, ammo
*/

params ["_obj"];

clearWeaponCargoGlobal _obj;
clearMagazineCargoGlobal _obj;
clearItemCargoGlobal _obj;
clearBackpackCargoGlobal _obj;

{
	if ( _forEachIndex == 1 ) then {
		{ _obj addBackpackCargoGlobal [_x select 0, _x select 1]; } forEach( _x );
	};
	if ( _forEachIndex == 2 ) then {
		{ _obj addItemCargoGlobal [_x select 0, _x select 1]; } forEach( _x );
	};
	if ( _forEachIndex == 3 ) then {
		{ _obj addWeaponCargoGlobal [_x select 0, _x select 1]; } forEach( _x );					
	};
	if ( _forEachIndex == 4 ) then {
		{ _obj addMagazineCargoGlobal [_x select 0, _x select 1]; } forEach( _x );		
	};
} forEach (_this);