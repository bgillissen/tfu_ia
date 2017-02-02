/*
@filename: feats\baseAtmosphere\serverInit.sqf
Author:
	Ben
Description:
	run on server
 	spawn the active base using LARs,
 	configure base things
*/

#include "..\..\core\debug.hpp"

BASE_REF = [BASE_COMP, [], [0,0,0], 0, false, false] call comp_fnc_spawn;

BA_npc = [];
BA_markers = [];
BA_obj = [];

{
	_x params ["_type", "_name", "_actions"];
	if ( _type isEqualTo "marker" ) then {
		BA_markers pushback _name;
		{
			_x params ["_action", "_mode"];
			if ( "markerColor" isEqualTo _action ) then {
				_name setMarkerColor (call common_fnc_getMarkerColor); 
			};
			true
		} count _actions;
	} else {
		if ( !(isNil _name) ) then {
			private _thing = missionNamespace getVariable _name;
			if ( _type isEqualTo "obj" ) then { 
				BA_obj pushback [_thing, _actions];
			} else {
				if ( _type isEqualto "npc" ) then {
					{ _thing disableAI _x; } count ["MOVE", "TARGET", "AUTOTARGET"];
					_thing setVariable ["NOAI", true, true];
					[_thing, _actions] call baseAtmosphere_fnc_npcLoadout;
					BA_npc pushback [_thing, _actions];
				};
			};
			#ifdef DEBUG
		} else {
			private _debug = format["baseAtmosphere: missing composition element in '%1', '%2' is not defined!", BASE_COMP, _name]; 
			conRed(_debug);
		#endif
		};
	};
	true
} count BA;

publicVariable "BA_npc";
publicVariable "BA_obj";