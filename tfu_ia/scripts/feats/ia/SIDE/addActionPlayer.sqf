/*
@filename: feats\ia\SIDE\addActionPlayer.sqf
Author:
	Ben
Description:
	run on client,
	add the action to finish a side mission on the given object,
	when activated it call an other function that will take care of the animation and
	letting the server know the player did it.
*/

params ["_obj", "_label"];

_obj addAction[_label, {_this call SIDE_fnc_doAction}, [], 6, true, true, "", "true", 2, false];