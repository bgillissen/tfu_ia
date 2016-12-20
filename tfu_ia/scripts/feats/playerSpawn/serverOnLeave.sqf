/*
@filename: feats\playerSpawn\serverOnLeave.sqf
Author:
	Ben
Description:
	this run on server when a player has disconnected
	remove player _unit (no dead in base ;))
*/

param ["_unit", "_id", "_uid", "_name"];

if ( !(isNull _unit) ) then deleteVehicle _unit;